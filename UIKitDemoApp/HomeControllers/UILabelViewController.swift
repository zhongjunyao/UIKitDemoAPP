//
//  UILabelViewController.swift
//  UIKitDemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/5/22.
//

import UIKit

class UILabelViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "UILabel-标签"

        // 创建一个 Label
        let label: UILabel = UILabel(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        // 设置文本
        label.text = "I am a label"
        // 字体
        label.font = UIFont.boldSystemFont(ofSize: 25)
//        // 字体行间距，因为iphone可调节字体大小所以一般不设置行高
//        label.lineSpacing = 1.4
        
        // 字体颜色
        label.textColor = UIColor.red
        // 背景色
        label.backgroundColor = .blue
        
        // 对齐方式
        label.textAlignment = NSTextAlignment.center
        // 阴影范围、颜色
        label.shadowColor = UIColor.green
        label.shadowOffset = CGSizeMake(-2, -2) // CGSizeMake(10, 10)
        // 行数, 0 为无限行
        label.numberOfLines = 0
        // 添加到view
        view.addSubview(label)
        
    }

}
