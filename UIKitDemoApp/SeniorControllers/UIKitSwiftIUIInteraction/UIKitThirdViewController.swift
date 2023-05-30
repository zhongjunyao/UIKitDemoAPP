//
//  UIKitThirdViewController.swift
//  UIKitDemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/5/27.
//

import UIKit
import SwiftUI

class UIKitThirdViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 此处设置的title，处于被SwiftUI调用时不生效，需要在SwiftUI调用UIKitThird()时额外设置
        title = "被SwiftUI调用的页面"
    }

}

// 如果UIKitThirdViewController页面需要被SwiftUI 调用，需要用遵循协议 UIViewControllerRepresentable 的Struct 来包装
struct UIKitThird: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = UIKitThirdViewController
    
    func makeUIViewController(context: Context) -> UIKitThirdViewController {
        return UIKitThirdViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIKitThirdViewController, context: Context) {
        print("updateUIViewController invoked")
    }
}
