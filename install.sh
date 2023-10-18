#!/bin/bash
# Author: sun~shell
# Time: 2020.4.10
# Function: 该脚本用于Fedora上一键安装搜狗输入法，测试于 Fedora31-GNOME
# version: v1.0.0
# Email: hello_linux@aliyun.com

current_dir=$(cd $(dirname $0); pwd)
echo '提示: 确保路径不存在中文,当前路径: :' $current_dir
PS3='提示: 请输入序号并回车以开始: '
echo $PS3

## 安装配置
function sogou(){
#解决输入法依赖
    sudo dnf install -y qtwebkit libidn-devel
    #解压和配置包 version: 2.3.1.0112
    tar xvJf sogou.tar.xz
    sudo cp -pr usr/ /
    sudo cp -pr etc/ /
    #链接共享库
    sudo cp /usr/lib/x86_64-linux-gnu/fcitx/fcitx-sogoupinyin.so /usr/lib64/fcitx
    sudo ln -s /usr/lib/x86_64-linux-gnu/fcitx/fcitx-punc-ng.so /usr/lib64/fcitx-punc-ng.so
    sudo ln -s /usr/lib64/libidn.so.12 /usr/lib64/libidn.so.11
    #启动
    sogou-qimpanel
}

## fcitx安装配置
function fcitx(){
    #解决环境依赖性
    sudo dnf install fcitx fcitx-configtool fcitx-qt5 fcitx-sunpinyin fcitx-libs sunpinyin  gnome-tweak-tool -y
    #开机启动fcitx
    sudo mkdir ~/.config/autostart
    sudo cp $current_dir/fcitx.desktop ~/.config/autostart
    #重启时生效 默认输入法修改
    sudo cp $current_dir/fcitx.sh /etc/profile.d
    #本地默认输入法
    echo 'export GTK_IM_MODULE=fcitx' >> ~/.bashrc
    echo 'export QT_IM_MODULE=fcitx' >> ~/.bashrc
    echo 'export XMODIFIERS=@im=fcitx' >> ~/.bashrc
    #系统默认输入法
    
    echo "请重启计算机以生效！"
}


select choice in fcitx sougou
do
    case "$choice" in
        fcitx)
            fcitx
            ;;
        sougou)
            sogou
            ;;
    esac
done


