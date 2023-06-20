export ARCH=arm64
export SUBARCH=arm64

export CROSS_COMPILE=aarch64-linux-gnu-
export CROSS_COMPILE_ARM32=arm-linux-gnueabi-

#Add your username here
export KBUILD_BUILD_USER=v3kt0r

#Add your Hostname here
export KBUILD_BUILD_HOST=v3kt0rPC

#Clang Compiler Path - Default Clang is Zyc (Change PATH to your clang directory)
export PATH="/mnt/HDD_2/Kernels/clang/bin:$PATH" 

#Change (munch_defconfig) to your device_defconfig
make O=out clean mrproper
make O=out CC=clang munch_defconfig
make O=out CC=clang -j$(nproc --all) \
    CFLAGS="-O2 -flto=thin" \
    LDFLAGS="-O2 -flto=thin"