openEuler拼音安装方法
===
安装方式
====
# 一.自动安装

1.脚本加权限
```
cd openEuler-Pinyin
chmod +x *.sh
```
2.如果你尚未安装fcitx(亦或你无法调用起fcitx),你可以使用如下命令,根据提示完成fcitx的配置安装(重启生效)
```
./install.sh 
```
3.如果你已经完成了fcitx的安装,并且可以使用它,请使用如下命令根据提示完成搜狗输入法的安装
```
./install.sh 
```
### 4.开机启动fcitx
```
mkdir ~/.config/autostart
cp fcitx.desktop ~/.config/autostart
#重启时生效 默认输入法修改
sudo cp fcitx.sh /etc/profile.d
#设置fcitx为本地默认输入法
echo 'export GTK_IM_MODULE=fcitx' >> ~/.bashrc
echo 'export QT_IM_MODULE=fcitx' >> ~/.bashrc
echo 'export XMODIFIERS=@im=fcitx' >> ~/.bashrc
```
### 5.链接共享库
```
cp /usr/lib/x86_64-linux-gnu/fcitx/fcitx-sogoupinyin.so /usr/lib64/fcitx
ln -s /usr/lib/x86_64-linux-gnu/fcitx/fcitx-punc-ng.so /usr/lib64/fcitx-punc-ng.so
ln -s /usr/lib64/libidn.so.12 /usr/lib64/libidn.so.11
```
### 5.启动输入法
```
openEuler-qimpanel
```
### 快捷键为： Ctrl+空格(space)
启动且无致命错误后，可以测试输入法，或者终止安装程序。

# 卸载输入法
```
./uninstall.sh
```

# 如何安装皮肤以及快速切换皮肤?
```
第三方搜狗皮肤下载地址: https://pinyin.sogou.com/skins/
```
```
安装后都会带有几款默认的搜狗皮肤,存储目录为/usr/share/openeuler-qimpanel/recommendSkin/skin
搜狗默认皮肤目录为:/usr/share/openeuler-qimpanel/skin
从官网下载你喜欢的皮肤,记住一定是要带有后缀.ssf文件的才是linux支持的皮肤
然后放到skin目录下新建一个文件夹,名字就是这款皮肤的名字,之后使用鼠标右击.ssf文件,选择用搜狗拼音打开
最终你会看到输入法皮肤已经改变了!
至于快速切换皮肤的时候,右击输入法界面,选择皮肤,之后在里面选择你喜欢的皮肤即可
```
# 如何删除已经安装的输入法皮肤
```
进入到 /root/.config/openeuler-qimpanel/skin,删除对应的皮肤目录即可
```
# 常见问题
1. 启动报错
```
open file /usr/share/fcitx-openeulerpinyin/openeulerInput/sgim_charvalid.bin failed.
没有那个文件或目录: 没有那个文件或目录
没有那个文件或目录: 没有那个文件或目录
open file /root/.config/openeulerPY/punctures.ini failed.
没有那个文件或目录: 没有那个文件或目录
check false, remove P
没有那个文件或目录: 没有那个文件或目录
没有那个文件或目录: 没有那个文件或目录
没有那个文件或目录: 没有那个文件或目录
没有那个文件或目录: 没有那个文件或目录
没有那个文件或目录: 没有那个文件或目录
open file /root/.config/openeulerPY/punctures.ini failed.
没有那个文件或目录: 没有那个文件或目录
open file failed.
没有那个文件或目录: 没有那个文件或目录
check false, remove C
没有那个文件或目录: 没有那个文件或目录
open file failed.
没有那个文件或目录: 没有那个文件或目录
check false, remove C
没有那个文件或目录: 没有那个文件或目录
```
这种一般是输入法缓存导致的执行如下命令重启即可
```
rm -rf ~/.config/openeulerPY
rm -rf /tmp/openeuler*
rm -rf /tmp/fcitx-socket-:0
```
