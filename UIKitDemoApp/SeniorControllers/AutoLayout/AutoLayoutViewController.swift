//
//  AutoLayoutViewController.swift
//  UIKitDemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/6/30.
//

import UIKit

class AutoLayoutViewController: BaseViewController {

    var button: UIButton!
    var cancelButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "纯原生代码实现的自动布局"
        
        setupUI()
    }

    func setupUI(){
        // 确认按钮
        button = UIButton(type: .custom)
        button.setTitle("确认", for: .normal)
        button.tintColor = UIColor.fontColor
        button.backgroundColor = UIColor.primaryBgColor
        button.layer.cornerRadius = 5
        view.addSubview(button)
        // 默认为autoresizing布局，首先关闭autoresizing布局，启动自动布局
        button.translatesAutoresizingMaskIntoConstraints = false
        // NSLayoutConstraint.activate 激活每个约束并生效
        NSLayoutConstraint.activate([
            // NSLayoutConstraint 创建一个布局约束
            // NSLayoutConstraint(item: 当前的控件, attribute: 约束属性, relatedBy: 前后之间的关系, toItem: 相对的控件, attribute: 相对控件的某个属性, multiplier: 比例, constant: 常量)
            // item1.attribute1 = multiplier × item2.attribute2 + constant
            // 设置相对左右的各20pt, button.left = 1 × view.left + 20
            NSLayoutConstraint(item: button!, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 20),
            NSLayoutConstraint(item: button!, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1, constant: -20),
            NSLayoutConstraint(item: button!, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 20),
            button.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        // 取消按钮
        cancelButton = UIButton(type: .custom)
        cancelButton.setTitle("取消", for: .normal)
        cancelButton.tintColor = UIColor.fontColor
        cancelButton.backgroundColor = .red
        cancelButton.layer.borderColor = UIColor.borderColor.cgColor
        cancelButton.layer.borderWidth = 1
        cancelButton.layer.cornerRadius = 5
        view.addSubview(cancelButton)
        // 默认为autoresizing布局，首先关闭autoresizing布局，启动自动布局
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        // NSLayoutConstraint.activate 激活每个约束并生效
        NSLayoutConstraint.activate([
            cancelButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            cancelButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            cancelButton.topAnchor.constraint(equalTo: self.button.bottomAnchor, constant: 20),
            cancelButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
}
