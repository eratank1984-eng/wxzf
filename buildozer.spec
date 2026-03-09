[app]
title = wxzf
package.name = wxzf
package.domain = org.test
source.dir = .
source.include_exts = py,png,jpg,kv,atlas
version = 0.1
requirements = python3,kivy==2.1.0,openpyxl
orientation = portrait
fullscreen = 0

[buildozer]
log_level = 2
warn_on_root = 1

# 使用本地 p4a
p4a.local = /home/wsl2/project/wxzf/.buildozer/android/platform/python-for-android
p4a.skip_download = True
p4a.branch = master
p4a.ignore_branch = True

# 禁用不必要的功能
android.accept_sdk_license = True
android.ndk = 25b
android.sdk = 31