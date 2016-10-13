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
        
        let foundBtn = UIButton(frame: CGRect(x: 10, y: 70, width: 100, height: 30))
        foundBtn.setTitle("创建表", for: .normal)
        foundBtn.setTitleColor(UIColor.blue, for: .normal)
        foundBtn.addTarget(self, action: #selector(self.foundBtnClick), for: .touchUpInside)
        self.view.addSubview(foundBtn)
        
        let addBtn = UIButton(frame: CGRect(x: 150, y: 70, width: 100, height: 30))
        addBtn.setTitle("添加数据", for: .normal)
        addBtn.setTitleColor(UIColor.blue, for: .normal)
        addBtn.addTarget(self, action: #selector(self.addBtnClick), for: .touchUpInside)
        self.view.addSubview(addBtn)
        
        let selectBtn = UIButton(frame: CGRect(x: 10, y: 150, width: 100, height: 30))
        selectBtn.setTitle("查询表", for: .normal)
        selectBtn.setTitleColor(UIColor.blue, for: .normal)
        selectBtn.addTarget(self, action: #selector(self.selectBtnClick), for: .touchUpInside)
        self.view.addSubview(selectBtn)
        
        let deleteBtn = UIButton(frame: CGRect(x: 150, y: 150, width: 100, height: 30))
        deleteBtn.setTitle("删除数据", for: .normal)
        deleteBtn.setTitleColor(UIColor.blue, for: .normal)
        deleteBtn.addTarget(self, action: #selector(self.deleteBtnClick), for: .touchUpInside)
        self.view.addSubview(deleteBtn)
        
        let updataBtn = UIButton(frame: CGRect(x: 10, y: 200, width: 100, height: 30))
        updataBtn.setTitle("更新数据", for: .normal)
        updataBtn.setTitleColor(UIColor.blue, for: .normal)
        updataBtn.addTarget(self, action: #selector(self.updataBtnClick), for: .touchUpInside)
        self.view.addSubview(updataBtn)
        
        
    }

    func foundBtnClick() {
        if db!.open(){
            do{
                try db!.executeUpdate("create table if not exists userTable(id integer primary key autoincrement, name text, age integer, phone text)", values: nil)
                print("创建表成功")
            } catch {
                print(db!.lastErrorMessage())
            }
            db!.close()
        }
    }
    
    func addBtnClick() {
        if db!.open(){
            let update = "insert into userTable (name,age,phone) values (?,?,?)"
            do{
                try db!.executeUpdate(update, values: ["张三", "13", "13099999999"])
                print("添加数据成功")
            } catch{
                print(db!.lastErrorMessage())
            }
            db!.close()
        }
    }
    
    func selectBtnClick() {
        if db!.open(){
            do{
                let rs = try db!.executeQuery("select * from userTable", values: nil)
                while rs.next() {
                    let name = rs.string(forColumn: "name")
                    let age = rs.string(forColumn: "age")
                    let phone = rs.string(forColumn: "phone")
                    print("name = \(name), age = \(age), phone = \(phone)")
                }
            } catch {
                print(db!.lastErrorMessage())
            }
            db!.close()
        }
    }
    func deleteBtnClick() {
        if db!.open() {
            do {
                try db!.executeUpdate("delete from userTable where name = ?", values:["张三"])
                print("删除成功")
            } catch {
                print(db!.lastErrorMessage())
            }
            db!.close()
        }
    }
    func updataBtnClick() {
        if db!.open() {
            do{
                try db!.executeUpdate("update userTable set name = ?  where name = '张三'", values:["张三丰"])
                print("更新成功")
            }catch{
                print(db!.lastErrorMessage())
            }
            db!.close()
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

