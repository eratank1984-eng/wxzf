#!/bin/bash

echo "开始下载所有需要的源码包（使用修正后的镜像地址）..."

# 确保目录存在
mkdir -p ~/.buildozer/android/packages
cd ~/.buildozer/android/packages

# 1. hostpython3 (Python 3.11.5)
echo "下载 hostpython3..."
wget https://mirrors.huaweicloud.com/python/3.11.5/Python-3.11.5.tgz
touch .mark-Python-3.11.5.tgz

# 2. libffi (3.4.2) - 从 GitHub 下载
echo "下载 libffi..."
wget https://github.com/libffi/libffi/releases/download/v3.4.2/libffi-3.4.2.tar.gz
touch .mark-libffi-3.4.2.tar.gz

# 3. openssl (1.1.1w)
echo "下载 openssl..."
wget https://mirrors.huaweicloud.com/openssl/source/openssl-1.1.1w.tar.gz
touch .mark-openssl-1.1.1w.tar.gz

# 4. sdl2_image (2.8.0) - 使用 GitHub 镜像
echo "下载 sdl2_image..."
wget https://ghfast.top/https://github.com/libsdl-org/SDL_image/releases/download/release-2.8.0/SDL2_image-2.8.0.tar.gz -O SDL2_image-2.8.0.tar.gz
touch .mark-SDL2_image-2.8.0.tar.gz

# 5. sdl2_mixer (2.6.3)
echo "下载 sdl2_mixer..."
wget https://ghfast.top/https://github.com/libsdl-org/SDL_mixer/releases/download/release-2.6.3/SDL2_mixer-2.6.3.tar.gz -O SDL2_mixer-2.6.3.tar.gz
touch .mark-SDL2_mixer-2.6.3.tar.gz

# 6. sdl2_ttf (2.20.2)
echo "下载 sdl2_ttf..."
wget https://ghfast.top/https://github.com/libsdl-org/SDL_ttf/releases/download/release-2.20.2/SDL2_ttf-2.20.2.tar.gz -O SDL2_ttf-2.20.2.tar.gz
touch .mark-SDL2_ttf-2.20.2.tar.gz

# 7. sqlite3 (3350500)
echo "下载 sqlite3..."
wget https://www.sqlite.org/2021/sqlite-amalgamation-3350500.zip
touch .mark-sqlite-amalgamation-3350500.zip

# 8. sdl2 (2.28.5)
echo "下载 sdl2..."
wget https://ghfast.top/https://github.com/libsdl-org/SDL/releases/download/release-2.28.5/SDL2-2.28.5.tar.gz -O SDL2-2.28.5.tar.gz
touch .mark-SDL2-2.28.5.tar.gz

# 9. setuptools (51.3.3) - 使用阿里云镜像
echo "下载 setuptools..."
wget https://mirrors.aliyun.com/pypi/packages/source/s/setuptools/setuptools-51.3.3.tar.gz
touch .mark-setuptools-51.3.3.tar.gz

# 10. six (1.15.0) - 使用阿里云镜像
echo "下载 six..."
wget https://mirrors.aliyun.com/pypi/packages/source/s/six/six-1.15.0.tar.gz
touch .mark-six-1.15.0.tar.gz

# 11. pyjnius (1.6.1)
echo "下载 pyjnius..."
wget https://ghfast.top/https://github.com/kivy/pyjnius/archive/1.6.1.zip -O 1.6.1.zip
touch .mark-1.6.1.zip

# 12. kivy (2.1.0) - 使用阿里云镜像
echo "下载 kivy..."
wget https://mirrors.aliyun.com/pypi/packages/source/k/kivy/kivy-2.1.0.tar.gz
touch .mark-kivy-2.1.0.tar.gz

echo "所有包下载完成！"
ls -la ~/.buildozer/android/packages/
