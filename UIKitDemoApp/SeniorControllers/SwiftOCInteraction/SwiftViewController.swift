//
//  SwiftViewController.swift
//  UIKitDemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/5/27.
//

import UIKit


// Swift 的 struct 不能被OC调用，因为要在 Objective-C 里调用 Swift 代码的话，对象需要继承于 NSObject
class Position: NSObject{
    @objc var x: Int
    @objc var y: Int
    
    // 需要定义初始化器
    @objc init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    // 重载减操作， prefix 代表 @prefix 注解，也是swift 中的 Attributes 类似注解的存在
    static prefix func -(pt: Position) -> Position {
        return Position(x: -pt.x, y: -pt.y)
    }
}

class SwiftViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "被OC调用的Swift界面"

        let p = Point(x: 100, y: 100)
        
        print(-p)
        
        print(1-2)
    }
}

