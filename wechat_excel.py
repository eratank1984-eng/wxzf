#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
微信支付Excel处理脚本
功能：处理 /storage/Download/WeiXin 中的Excel文件
      1. 在A5单元格添加时间：导出时间：[当前时间]
      2. 每处理一个文件，时间增加45秒
      3. 文件名增加日期后缀（格式：yyyymmddhhmmss）
      4. 保存到 /storage/WeiXin，每次运行前先清空目标文件夹
"""

# ==================== 配置区 ====================
SOURCE_DIR = "/storage/emulated/0/Download/WeiXin"
TARGET_DIR = "/storage/emulated/0/WeiXin"
TIME_CELL = "A5"
INITIAL_TIME = ""
TIME_INCREMENT = 45
TIME_FORMAT_CELL = "%Y-%m-%d %H:%M:%S"
TIME_FORMAT_FILE = "%Y%m%d%H%M%S"
# ===============================================

import openpyxl
import os
import shutil
from datetime import datetime, timedelta
import re


def clean_target_folder():
    """清空目标文件夹"""
    print(f"🧹 准备清空目标文件夹：{TARGET_DIR}")

    if os.path.exists(TARGET_DIR):
        try:
            # 删除整个文件夹
            shutil.rmtree(TARGET_DIR)
            print(f"✅ 已删除旧文件夹：{TARGET_DIR}")
        except Exception as e:
            print(f"⚠️ 删除文件夹失败：{e}")

    # 重新创建空文件夹
    os.makedirs(TARGET_DIR, exist_ok=True)
    print(f"✅ 已创建空文件夹：{TARGET_DIR}")


def ensure_dir(directory):
    """确保目录存在"""
    if not os.path.exists(directory):
        os.makedirs(directory)
        print(f"✅ 创建目录：{directory}")


def safe_filename(filename):
    """处理文件名中的特殊字符"""
    return re.sub(r'[<>:"/\\|?*]', '_', filename)


def get_initial_time():
    """获取初始时间"""
    if INITIAL_TIME and INITIAL_TIME.strip():
        try:
            return datetime.strptime(INITIAL_TIME.strip(), TIME_FORMAT_CELL)
        except:
            print(f"⚠️ 初始时间格式错误，使用当前系统时间")
            return datetime.now()
    else:
        return datetime.now()


def process_excel_files():
    """主处理函数"""
    print("=" * 60)
    print("📊 微信支付Excel处理脚本")
    print("=" * 60)
    print(f"📂 源文件夹：{SOURCE_DIR}")
    print(f"📂 目标文件夹：{TARGET_DIR}")
    print(f"⏱️  时间写入位置：{TIME_CELL}")
    print(f"⏱️  时间间隔：{TIME_INCREMENT}秒")
    print("-" * 60)

    # ===== 第一步：清空目标文件夹 =====
    clean_target_folder()
    print("-" * 60)

    # 检查源文件夹
    if not os.path.exists(SOURCE_DIR):
        print(f"❌ 错误：源文件夹不存在！")
        print(f"请创建文件夹：{SOURCE_DIR}")
        return

    # 获取所有Excel文件
    excel_files = []
    for file in os.listdir(SOURCE_DIR):
        if file.lower().endswith(('.xlsx', '.xls')):
            file_path = os.path.join(SOURCE_DIR, file)
            if os.path.isfile(file_path):
                excel_files.append(file)

    if not excel_files:
        print(f"⚠️ 在 {SOURCE_DIR} 中找不到Excel文件")
        return

    # 按文件名排序
    excel_files.sort()
    file_count = len(excel_files)
    print(f"📄 找到 {file_count} 个Excel文件")
    print("-" * 60)

    # 初始化时间
    current_time = get_initial_time()
    print(f"⏱️  初始时间：{current_time.strftime(TIME_FORMAT_CELL)}")
    print("-" * 60)

    success_count = 0
    fail_count = 0

    for idx, filename in enumerate(excel_files, 1):
        source_path = os.path.join(SOURCE_DIR, filename)
        print(f"\n[{idx}/{file_count}] 处理文件：{filename}")

        try:
            # 打开Excel文件
            wb = openpyxl.load_workbook(source_path, data_only=True)
            ws = wb.active

            # 格式化时间
            time_str_cell = current_time.strftime(TIME_FORMAT_CELL)
            time_str_file = current_time.strftime(TIME_FORMAT_FILE)

            # 写入A5单元格
            ws[TIME_CELL] = f"导出时间：{time_str_cell}"

            # 生成新文件名
            name_part, ext_part = os.path.splitext(filename)
            new_filename = f"{name_part}_{time_str_file}{ext_part}"
            new_filename = safe_filename(new_filename)
            target_path = os.path.join(TARGET_DIR, new_filename)

            # 保存文件
            wb.save(target_path)
            wb.close()

            print(f"  ✅ 写入时间：导出时间：{time_str_cell}")
            print(f"  ✅ 保存为：{new_filename}")
            print(f"  ✅ 时间戳：{time_str_file}")

            # 更新下一个文件的时间
            current_time += timedelta(seconds=TIME_INCREMENT)
            success_count += 1

        except Exception as e:
            print(f"  ❌ 处理失败：{str(e)}")
            fail_count += 1
            continue

    print("\n" + "=" * 60)
    print("📊 处理完成！")
    print(f"✅ 成功：{success_count} 个文件")
    if fail_count > 0:
        print(f"❌ 失败：{fail_count} 个文件")
    print(f"📂 文件已保存到：{TARGET_DIR}")
    print("=" * 60)


if __name__ == "__main__":
    try:
        process_excel_files()
    except KeyboardInterrupt:
        print("\n⚠️ 用户中断处理")
    except Exception as e:
        print(f"\n❌ 程序出错：{str(e)}")