#!/bin/bash

echo "开始下载所有需要的源码包..."

# 确保目录存在
mkdir -p ~/.buildozer/android/packages

# 1. hostpython3 (Python 3.11.5)
echo "下载 hostpython3..."
wget https://repo.huaweicloud.com/python/3.11.5/Python-3.11.5.tgz -O ~/.buildozer/android/packages/Python-3.11.5.tgz
touch ~/.buildozer/android/packages/.mark-Python-3.11.5.tgz

# 2. libffi (3.4.2)
echo "下载 libffi..."
wget https://repo.huaweicloud.com/libffi/libffi-3.4.2.tar.gz -O ~/.buildozer/android/packages/libffi-3.4.2.tar.gz
touch ~/.buildozer/android/packages/.mark-libffi-3.4.2.tar.gz

# 3. openssl (1.1.1w)
echo "下载 openssl..."
wget https://repo.huaweicloud.com/openssl/source/openssl-1.1.1w.tar.gz -O ~/.buildozer/android/packages/openssl-1.1.1w.tar.gz
touch ~/.buildozer/android/packages/.mark-openssl-1.1.1w.tar.gz

# 4. sdl2_image (2.8.0)
echo "下载 sdl2_image..."
wget https://repo.huaweicloud.com/gnu/SDL_image/SDL2_image-2.8.0.tar.gz -O ~/.buildozer/android/packages/SDL2_image-2.8.0.tar.gz
touch ~/.buildozer/android/packages/.mark-SDL2_image-2.8.0.tar.gz

# 5. sdl2_mixer (2.6.3)
echo "下载 sdl2_mixer..."
wget https://repo.huaweicloud.com/gnu/SDL_mixer/SDL2_mixer-2.6.3.tar.gz -O ~/.buildozer/android/packages/SDL2_mixer-2.6.3.tar.gz
touch ~/.buildozer/android/packages/.mark-SDL2_mixer-2.6.3.tar.gz

# 6. sdl2_ttf (2.20.2)
echo "下载 sdl2_ttf..."
wget https://repo.huaweicloud.com/gnu/SDL_ttf/SDL2_ttf-2.20.2.tar.gz -O ~/.buildozer/android/packages/SDL2_ttf-2.20.2.tar.gz
touch ~/.buildozer/android/packages/.mark-SDL2_ttf-2.20.2.tar.gz

# 7. sqlite3 (3350500)
echo "下载 sqlite3..."
wget https://repo.huaweicloud.com/sqlite/2021/sqlite-amalgamation-3350500.zip -O ~/.buildozer/android/packages/sqlite-amalgamation-3350500.zip
touch ~/.buildozer/android/packages/.mark-sqlite-amalgamation-3350500.zip

# 8. sdl2 (2.28.5)
echo "下载 sdl2..."
wget https://repo.huaweicloud.com/gnu/SDL/SDL2-2.28.5.tar.gz -O ~/.buildozer/android/packages/SDL2-2.28.5.tar.gz
touch ~/.buildozer/android/packages/.mark-SDL2-2.28.5.tar.gz

# 9. setuptools (51.3.3)
echo "下载 setuptools..."
wget https://pypi.tuna.tsinghua.edu.cn/packages/source/s/setuptools/setuptools-51.3.3.tar.gz -O ~/.buildozer/android/packages/setuptools-51.3.3.tar.gz
touch ~/.buildozer/android/packages/.mark-setuptools-51.3.3.tar.gz

# 10. six (1.15.0)
echo "下载 six..."
wget https://pypi.tuna.tsinghua.edu.cn/packages/source/s/six/six-1.15.0.tar.gz -O ~/.buildozer/android/packages/six-1.15.0.tar.gz
touch ~/.buildozer/android/packages/.mark-six-1.15.0.tar.gz

# 11. pyjnius (1.6.1)
echo "下载 pyjnius..."
wget https://ghfast.top/https://github.com/kivy/pyjnius/archive/1.6.1.zip -O ~/.buildozer/android/packages/1.6.1.zip
touch ~/.buildozer/android/packages/.mark-1.6.1.zip

# 12. kivy (2.1.0)
echo "下载 kivy..."
wget https://pypi.tuna.tsinghua.edu.cn/packages/source/k/kivy/kivy-2.1.0.tar.gz -O ~/.buildozer/android/packages/kivy-2.1.0.tar.gz
touch ~/.buildozer/android/packages/.mark-kivy-2.1.0.tar.gz

echo "所有包下载完成！"
ls -la ~/.buildozer/android/packages/
