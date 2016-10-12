//
//  ViewController.m
//  fmdboc
//
//  Created by miaoxiaodong on 16/10/12.
//  Copyright © 2016年 miaoxiaodong. All rights reserved.
//

#import "ViewController.h"
#import "FMDB.h"

@interface ViewController ()
{
    NSArray *_dataArray;
}
@property (nonatomic, strong) FMDatabase *db;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _dataArray = @[@{@"name":@"张三", @"age": @13, @"phone": @"13090909090"}, @{@"name":@"李四", @"age": @22, @"phone": @"13090922290"}, @{@"name":@"王五", @"age": @33, @"phone": @"13090909999"}, @{@"name":@"赵六", @"age": @23, @"phone": @"13090909090"}, @{@"name":@"谢七", @"age": @19, @"phone": @"13090909090"}, @{@"name":@"陆十", @"age": @53, @"phone": @"13090909090"}];
    
    NSString *documentDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *dbPath = [documentDirectory stringByAppendingPathComponent:@"database.db"];
    
    _db = [FMDatabase databaseWithPath:dbPath];
    if ([_db open]) {
        NSLog(@"开启数据库成功");
        
    } else {
        NSLog(@"开启数据库失败");
    }
    
    UIButton *foundBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, 70, 100, 30)];
    [foundBtn setTitle:@"新建表" forState:UIControlStateNormal];
    [foundBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [foundBtn addTarget:self action:@selector(foundBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:foundBtn];
    
    UIButton *addBtn = [[UIButton alloc] initWithFrame:CGRectMake(150, 70, 100, 30)];
    [addBtn setTitle:@"添加数据" forState:UIControlStateNormal];
    [addBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [addBtn addTarget:self action:@selector(addBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addBtn];
    
    UIButton *selectBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, 150, 100, 30)];
    [selectBtn setTitle:@"查询表" forState:UIControlStateNormal];
    [selectBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [selectBtn addTarget:self action:@selector(selectBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:selectBtn];
    
    UIButton *deleteBtn = [[UIButton alloc] initWithFrame:CGRectMake(150, 150, 100, 30)];
    [deleteBtn setTitle:@"删除数据" forState:UIControlStateNormal];
    [deleteBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [deleteBtn addTarget:self action:@selector(deleteBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:deleteBtn];
    
    UIButton *updataBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, 200, 100, 30)];
    [updataBtn setTitle:@"更新数据" forState:UIControlStateNormal];
    [updataBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [updataBtn addTarget:self action:@selector(updataBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:updataBtn];
}

- (void)foundBtnClick {
    if ([_db open]) {
        BOOL found =  [_db executeUpdate:@"create table if not exists userTable(id integer primary key autoincrement, name text, age integer, phone text)"];
        if (found) {
            NSLog(@"创建表成功");
        } else {
            NSLog(@"创建表失败");
        }
        [_db close];
    }
}
- (void)addBtnClick {
    if ([_db open]) {
        for (NSDictionary *dict in _dataArray) {
            BOOL add = [_db executeUpdate:[NSString stringWithFormat:@"insert into userTable (name, age, phone) values ('%@', '%@', '%@')", dict[@"name"], dict[@"age"], dict[@"phone"]]];
            if (add) {
                NSLog(@"添加成功");
            } else {
                NSLog(@"添加失败");
            }
        }
        [_db close];
    }
}
- (void)selectBtnClick {
    if ([_db open]) {
        FMResultSet *select = [_db executeQuery:@"select * from userTable"];
        while ([select next]) {
            NSString * name = [select stringForColumn:@"name"];
            NSString * age = [select stringForColumn:@"age"];
            NSString * phone = [select stringForColumn:@"phone"];
            NSLog(@"name = %@, age = %@  phone = %@", name, age, phone);
        }
        [_db close];
    }
    
}
- (void)deleteBtnClick {
    if ([_db open]) {
        BOOL delete = [_db executeUpdate:@"delete from userTable where name = '张三'"];
        
        if (delete) {
            NSLog(@"删除成功");
        } else {
            NSLog(@"删除失败");
        }
        [_db close];
        
    }
}
- (void)updataBtnClick {
    if ([_db open]) {
        BOOL update = [_db executeUpdate:@"update userTable set name = '张三丰'  where name = '张三'"];
        if (update) {
            NSLog(@"更新数据成功");
        }else{
            NSLog(@"更新数据失败");
        }
        [_db close];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
