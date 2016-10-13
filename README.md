# XDSQLiteOperate

SQLite数据库的几种操作方式

## 著名开源框架FMDB

FMDB是操作SQLite数据库的oc封装，可以直接创建连接数据库，并进行增删改查数据库操作。

FMDB三个重要的类

FMDatabase：一个FMDatabase对象就代表一个单独的SQLite数据库。

FMResultSet：查询数据库返回的结果集

FMDatabaseQueue：解决线程不安全的类，避免每个线程创建一个数据库，导致数据库冗余。

[使用FMDB访问SQLite数据库OC](https://github.com/mxdios/XDSQLiteOperate/tree/master/fmdboc)

[使用FMDB访问SQLite数据库Swift](https://github.com/mxdios/XDSQLiteOperate/tree/master/fmdbswift)

## 猿题库的YTKKeyValueStore框架

YTKKeyValueStore是对FMDB的封装，支持key-value形式操作数据库。不需要直接使用SQL语句，更接近移动端开发的习惯。

[使用YTKKeyValueStore访问SQLite数据库OC](https://github.com/mxdios/XDSQLiteOperate/tree/master/ytkkeyvalueoc)

使用YTKKeyValueStore访问SQLite数据库Swift

