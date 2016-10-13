//
//  ViewController.m
//  ytkkeyvalueoc
//
//  Created by miaoxiaodong on 16/10/13.
//  Copyright © 2016年 miaoxiaodong. All rights reserved.
//

#import "ViewController.h"
#import "YTKKeyValueStore.h"

@interface ViewController ()
@property (nonatomic, strong) YTKKeyValueStore *store;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    _store = [[YTKKeyValueStore alloc] initDBWithName:@"store.db"];
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
    [_store createTableWithName:@"userTable"];
    
}
- (void)addBtnClick {
    [_store putString:@"张三" withId:@"name" intoTable:@"userTable"];
}
- (void)selectBtnClick {
    NSString *str = [_store getStringById:@"name" fromTable:@"userTable"];
    NSLog(@"查询 str = %@", str);
}
- (void)deleteBtnClick {
    [_store deleteObjectById:@"name" fromTable:@"userTable"];
}
- (void)updataBtnClick {
    [_store putString:@"张三丰" withId:@"name" intoTable:@"userTable"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
