# 概述
这个是用于`motorola G51 5G` 手机的内核源代码,内核版本为`5.4.259`

## 编译环境配置

编译系统环境：`Ubuntu 22.04.5 LTS(jammy)` 

安装依赖包：`sudo apt install gcc-aarch64-linux-gnu bison flex bc libncurses-dev libssl-dev git device-tree-compiler`

需要用到的编译工具：

- Clang编译器：`https://github.com/ZyCromerZ/Clang/releases`
- mkdtimg工具：`https://github.com/Mxiier/mkdtimg`

## 开始编译

* 克隆这个仓库
```
git clone https://github.com/Mxiier/kernel_motorola_cypfq.git
```

* 导入编译环境
```
. envsetup.sh
```

* 导入内核配置defconfig文件
```
make vendor/cypfq_defconfig
```

* 开始编译
```
make
```

## 编译输出内容

成功编译完成后的内核二进制文件将保存在`out`目录中,内核必要的文件如下：

`out/arch/arm64/boot/Image` 内核编译后的二进制文件,用于替换`boot.img`中的`kernel`部分

`out/arch/arm64/boot/dtbo.img` 设备的dtbo部分,直接使用`fastboot flash dtbo_a dtbo.img` 命令刷入到设备的`dtbo`分区

`out/arch/arm64/boot/dts/vendor/qcom/holi-moto-base.dtb` 这是设备树文件,需要用这个文件替换`vendor_boot.img`中的`dtb`部分

* 内核的模块保存到设备的`vendor`分区中的`/lib/modules/`目录下

获取编译出的内核模块：
```
mkdir MyModules

find ./out -type f -name *.ko -exec cp {} MyModules \;

```