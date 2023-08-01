//
//  CodableViewController.swift
//  UIKitDemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/8/1.
//

import UIKit

class CodableViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Codable解析协议(重点)"
        
        // 编码、解码
        parseJSON()
    }
    
    func parseJSON() {
        do {
            //解码 JSON 数据
            let json = #" {"name":"Tom", "age": 2} "#
            let person = try JSONDecoder().decode(Person.self, from: json.data(using: .utf8)!)
            print(person) // Person(name: "Tom", age: 2)
            
            //编码导出为 JSON 数据
            let data0 = try? JSONEncoder().encode(person)
            let dataObject = try? JSONSerialization.jsonObject(with: data0!, options: [])
            print(dataObject ?? "nil") //{ age = 2; name = Tom; }
            
            let data1 = try? JSONSerialization.data(withJSONObject: ["name": person.name, "age": person.age], options: [])
            print(String(data: data1!, encoding: .utf8)!) //{"name":"Tom","age":2}

        } catch let err {
            debugPrint("解析json出错：", err)
        }
        // 扩展学习：https://juejin.cn/post/6971997599725256734
    }
}
