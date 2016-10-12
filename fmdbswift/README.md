# FMDBSWIFT

使用FMDB访问数据库 —— Swift

github上下载[fmdb开源框架](https://github.com/ccgus/fmdb)，工程中引入开源框架下 `src` 里的`fmdb`文件夹内的文件。

## 创建桥接文件

swift和oc混编需要桥接文件，xcode7之前引入或者创建oc文件会有是否创建桥接文件BridgeHeader的提醒，xcode8之后没有了提醒，需要手动创建。

command + n 选择创建 `Header File`。

![img](https://github.com/mxdios/notebook/blob/master/XDSQLiteOperate/fmdbswift/image/QQ20161012-0.png?raw=true)

点击`Next`，输入桥接文件名字，勾选`Targets`里面第一个复选框，点击`Create`。

![img](https://github.com/mxdios/notebook/blob/master/XDSQLiteOperate/fmdbswift/image/QQ20161012-1.png?raw=true)

指定桥接文件路径，双击路径在弹出的输入框框中输入`$(SRCROOT)/fmdbswift/fmdbswift-Brigding-Header.h`，设置相对路径。也有说直接把桥接文件拖到输入框中，这样产生的是绝对路径，虽然也可以访问成功，但是改变了项目目录会访问失败。

![img](https://github.com/mxdios/notebook/blob/master/XDSQLiteOperate/fmdbswift/image/QQ20161012-2.png?raw=true)

桥接文件中引入fmdb `#import "FMDB.h"`

在 `Linked Frameworks and Libraries` 里引入系统动态库`libsqlite3.tbd`。



## 创建数据库



## 创建表


## 插入数据


## 删除数据


## 更新数据



## 查询数据

