# FMDBOC

使用FMDB访问数据库 —— Objective-C

github上下载[fmdb开源框架](https://github.com/ccgus/fmdb)，工程中引入开源框架下 `src` 里的`fmdb`文件夹内的文件。

`Linked Frameworks and Libraries` 里引入系统动态库`libsqlite3.tbd`。

## 创建数据库

```Objective-c
_db = [FMDatabase databaseWithPath:dbPath];
```

在指定路径`dbPath`下创建一个数据库文件，如果不存在这个数据库文件会创建，如果存在则打开。该方法一般会放在控制器的`- (void)viewDidLoad`方法，执行一次即可。

如果这个`dbPath`是空字符串`@""`时，会在临时文件目录下创建数据库，数据库断开连接时被删除。如果是`NULL`空时，会在内存中创建数据库，数据库断开连接时被删除。

开启数据库，任何数据库操作，都需要先开启数据库。

```Objective-c
[_db open];
```

## 创建表

```Objective-c
BOOL found =  [_db executeUpdate:@"create table if not exists userTable(id integer primary key autoincrement, name text, age integer, phone text)"];
```

数据库操作除了查询，增删改都会调用这个方法`executeUpdate`，返回BOOL类型。`executeUpdate:`后面的字符串是SQL语句，上述代码是创建了一个表，有姓名name，年龄age，手机号phone。

关闭数据库

```Objective-c
[_db close];
```

## 插入数据

```Objective-c
BOOL add = [_db executeUpdate:[NSString stringWithFormat:@"insert into userTable (name, age, phone) values ('%@', '%@', '%@')", dict[@"name"], dict[@"age"], dict[@"phone"]]];
```

插入 `userTable` 表中 key `(name, age, phone)` 对应的 value `dict[@"name"],dict[@"age"],dict[@"phone"]` 。

## 删除数据

```Objective-c
BOOL delete = [_db executeUpdate:@"delete from userTable where name = '张三'"];
```

删除 `name` = `'张三'`

## 更新数据

```Objective-c
BOOL update = [_db executeUpdate:@"update userTable set name = '张三丰'  where name = '张三'"];
```

所有 `name` = `'张三'` 的 改为 `name` = `'张三丰'`

## 查询数据

```Objective-c
FMResultSet *select = [_db executeQuery:@"select * from userTable"];
while ([select next]) {
    NSString * name = [select stringForColumn:@"name"];
    NSString * age = [select stringForColumn:@"age"];
    NSString * phone = [select stringForColumn:@"phone"];
    NSLog(@"name = %@, age = %@  phone = %@", name, age, phone);
}
```









