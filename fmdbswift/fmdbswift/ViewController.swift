//
//  ViewController.swift
//  fmdbswift
//
//  Created by miaoxiaodong on 16/10/12.
//  Copyright © 2016年 miaoxiaodong. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    var db : FMDatabase?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let pathStr = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        db = FMDatabase(path: "\(pathStr)/database.db")
        
        if db!.open() {
            print("数据库创建成功")
        } else {
            print("数据库创建失败")
        }
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

