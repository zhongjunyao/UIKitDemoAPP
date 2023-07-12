//
//  StructViewController.swift
//  UIKitDemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/7/12.
//

import UIKit

class StructViewController: BaseViewController {

    struct Model {
        // 定义为let，代表在初始化init 执行完之后就不能修改
        // 给了title 默认值，即使没有初始化器，也可以不传这个值
        // 如果想让带有初始化值的参数可以继续传值，需要改成var
        var title: String = "标题初始化默认值"
        let font: UIFont
        let color: UIColor
        let desc: String
        let price: Double
        let progress: Int
        
        // 注意 struct 可以不写init 函数
//        init(title: String, font: UIFont, color: UIColor, desc: String, price: Double, progress: Int) {
//            self.title = title
//            self.font = font
//            self.color = color
//            self.desc = desc
//            self.price = price
//            self.progress = progress
//        }
    }
    
    struct Model2 {
        // 定义为let，代表在初始化init 执行完之后就不能修改
        let title: String
        let font: UIFont
        let color: UIColor
        let desc: String
        let price: Double
        let progress: Int
        
        // title 如果给了初始值，在初始化时可以不传改值
        init(title: String = "biaoti", font: UIFont, color: UIColor, desc: String, price: Double, progress: Int) {
            self.title = title
            self.font = font
            self.color = color
            self.desc = desc
            self.price = price
            self.progress = progress
            
        }
       
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Struct使用"
        
        let model1 = Model(title: "标题改变默认值", font: UIFont.systemFont(ofSize: 10), color: UIColor.black, desc: "描述", price: 12.8, progress: 10)
        // cannot assign to property: 'font' is a 'let' constant
        // model1.font = UIFont.systemFont(ofSize: 15)
        
        let model12 = Model(font: UIFont.systemFont(ofSize: 10), color: UIColor.black, desc: "描述", price: 12.8, progress: 10)
        
        
        debugPrint(model12)
        debugPrint(model1)
        
        // title 如果给了初始值，在初始化时可以不传改值
        let model2 = Model2(font: UIFont.systemFont(ofSize: 10), color: UIColor.black, desc: "描述", price: 12.8, progress: 10)
        
        debugPrint(model2)
    }
    

}
