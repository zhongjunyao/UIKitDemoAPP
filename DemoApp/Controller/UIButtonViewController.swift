//
//  UIButtonViewController.swift
//  DemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/5/22.
//

import UIKit

class UIButtonViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "UIButton-按钮"

        let button:UIButton = UIButton(type: .custom)
        // 不设置的话大小根据字体变化
        button.frame = CGRectMake(100, 100, 200, 100)
        button.backgroundColor = .red
        
        view.addSubview(button)
        
        // 添加事件
        button.addTarget(self, action: #selector(didClickButton(_:)), for: .touchUpInside)
        
        // 按钮常态(UIControl.State.normal)下标题
        button.setTitle("按钮", for: .normal)
        // 点击态下的字体颜色
        button.setTitle("按钮-clicked", for: .highlighted)
        // 设置背景图片
        button.setBackgroundImage(UIImage(named: "home.png"), for: .normal)
        button.setBackgroundImage(UIImage(named: "home_selected.png"), for: .highlighted)
        // 设置图片
//        button.setImage(UIImage(named: "icon_pwd.png"), for: .normal)
        
        // 内容区域的偏移量
        button.contentEdgeInsets = UIEdgeInsets(top: -50, left: -50, bottom: 0, right:0)
//        button.imageEdgeInsets
//        button.titleEdgeInsets
        
        // 开启按钮的点击视觉效果
        button.showsTouchWhenHighlighted = true
    }

    @objc func didClickButton(_ sender: UIButton){
        print("按钮被点击了")
        sender.backgroundColor = UIColor.hexColor(0xff0000)
    }
}
