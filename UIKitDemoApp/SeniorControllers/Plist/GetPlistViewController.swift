//
//  GetPlistViewController.swift
//  UIKitDemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/5/31.
//

import UIKit

class GetPlistViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Step-1: 创建 Property List 文件（plist文件）
        // Step-2: 找到 plist 文件
        do {
            
//            try method1()
            
            try method2()
            
        } catch {
            // catch 中默认有error字段
            print(error)
        }
    }

    // 方式一：在新文件上创建
    func method1() throws {
        let documentDirectories = NSSearchPathForDirectoriesInDomains(
            FileManager.SearchPathDirectory.documentDirectory,
            FileManager.SearchPathDomainMask.userDomainMask,
            true
        )
        debugPrint("documentDirectories====>", documentDirectories)
        // ["/Users/robin.j.y.zhong/Library/Developer/CoreSimulator/Devices/01B740F3-3692-4E6F-86A1-C0D7565FEE7B/data/Containers/Data/Application/16E595AD-0D42-45AC-A937-C71CC949F0B6/Documents"]
        let plistPath = "\(documentDirectories[0])/Property List.plist"
        debugPrint("plistPath====>", plistPath)
        // "/Users/robin.j.y.zhong/Library/Developer/CoreSimulator/Devices/01B740F3-3692-4E6F-86A1-C0D7565FEE7B/data/Containers/Data/Application/B7AC7CB9-BDE5-45F5-BA2E-BC10E7405752/Documents/Property List.plist"
        let data:[String:String] = ["key1" : "value1", "key2":"value2", "key3":"value3"]
        let dict = NSDictionary(dictionary: data)
        let isWritten = dict.write(toFile: plistPath, atomically: true)
        let dict1 = NSDictionary(contentsOfFile: plistPath)
        debugPrint("dict1====>", dict1)
        debugPrint("file created: \(isWritten)")
        
        // 通过字符串获取内容
        let text = try String(contentsOfFile: plistPath, encoding: String.Encoding.utf8)
        debugPrint("text====>",text)
        
        // 通过字典获取内容
//        let dict2 = try String(contentsOfFile: plistPath, encoding: String.Encoding.utf8)
//        debugPrint("dict2====>",dict2)
        var error: ()
        let dict2 = try NSMutableDictionary(contentsOf: URL(filePath: plistPath), error: error)
        debugPrint("dict2====>",dict2)
        debugPrint("dict2=>error====>",error)
//        "dict2====>" {
//            key1 = value1;
//            key2 = value2;
//            key3 = value3;
//        }
//        "dict2=>error====>" ()
    }
    
    // 方式二：
    func method2() throws {
        // 方式二：
        // 生成文件的存储路径, plist
        let plistPath = Bundle.main.path(forResource: "Property List", ofType: "plist")
        // let plistPath = Bundle.main.path(forResource: "plist file name", ofType: "plist")
        // let plistPath = Bundle.main.path(forResource: "1", ofType: "plist")
        debugPrint(plistPath)
        // Optional("/Users/robin.j.y.zhong/Library/Developer/CoreSimulator/Devices/01B740F3-3692-4E6F-86A1-C0D7565FEE7B/data/Containers/Bundle/Application/BC829AB2-6272-41D1-8BC6-1D65FEBADCD7/UIKitDemoApp.app/Property List.plist")
        //读取属性列表文件，并转化为可变字典对象
        let data: NSMutableDictionary = NSMutableDictionary(contentsOfFile: plistPath!)!
        debugPrint("data===>", data)
//        "data===>" {
//            ceshi = "hello world";
//            number = 12;
//        }
    
       // let marr: NSMutableArray = NSMutableArray(contentsOfFile: plistPath!)!
       // print(marr)
        let nameArr:[String] = data.allKeys as! [String]
        debugPrint("nameArr===>", nameArr)
//        "nameArr===>" ["ceshi", "number"]
    }
}
