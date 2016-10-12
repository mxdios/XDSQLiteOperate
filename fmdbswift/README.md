# FMDBSWIFT

使用FMDB访问数据库 —— Swift

github上下载[fmdb开源框架](https://github.com/ccgus/fmdb)，工程中引入开源框架下 `src` 里的`fmdb`文件夹内的文件。

## 创建桥接文件

swift和oc混编需要桥接文件，xcode7之前引入或者创建oc文件会有是否创建桥接文件BridgeHeader的提醒，xcode8之后没有了提醒，需要手动创建。

command + n 选择创建 `Header File`。

![img](https://raw.githubusercontent.com/mxdios/XDSQLiteOperate/master/fmdbswift/image/QQ20161012-0.png)

点击`Next`，输入桥接文件名字，勾选`Targets`里面第一个复选框，点击`Create`。

![img](https://raw.githubusercontent.com/mxdios/XDSQLiteOperate/master/fmdbswift/image/QQ20161012-1.png)

指定桥接文件路径，双击路径在弹出的输入框框中输入`$(SRCROOT)/fmdbswift/fmdbswift-Brigding-Header.h`，设置相对路径。也有说直接把桥接文件拖到输入框中，这样产生的是绝对路径，虽然也可以访问成功，但是改变了项目目录会访问失败。

![img](https://raw.githubusercontent.com/mxdios/XDSQLiteOperate/master/fmdbswift/image/QQ20161012-2.png)

桥接文件中引入fmdb `#import "FMDB.h"`

导入fmdb提供的swift extensions，拷贝"src/extra/Swift extensions/"文件夹内的 `FMDatabaseVariadic.swift`。可以使用 `executeUpdate` 和 `executeQuery` 多参数了。

在 `Linked Frameworks and Libraries` 里引入系统动态库`libsqlite3.tbd`。

## 创建数据库

```Swift
let pathStr = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
db = FMDatabase(path: "\(pathStr)/database.db")
if db!.open() {
    print("数据库创建成功")
} else {
    print("数据库创建失败")
}
```

指定路径创建`database.db`数据库，并判断数据库是否创建成功。

## 创建表


## 插入数据


## 删除数据


## 更新数据



## 查询数据

