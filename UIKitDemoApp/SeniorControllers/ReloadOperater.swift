//
//  ReloadOperaterViewController.swift
//  UIKitDemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/5/26.
//
// Swift 中的注解：Attributes
// Attributes 文档：https://docs.swift.org/swift-book/documentation/the-swift-programming-language/attributes/

import UIKit

struct Point {
    var x: Int
    var y: Int
    
    // 重载减操作， prefix 代表 @prefix 注解，也是swift 中的 Attributes 类似注解的存在
    static prefix func -(pt: Point) -> Point {
        return Point(x: -pt.x, y: -pt.y)
    }
}

class ReloadOperater: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "重载操作符"

        let p = Point(x: 100, y: 100)
        
        print(-p)
        
        print(1-2)
    }
}
