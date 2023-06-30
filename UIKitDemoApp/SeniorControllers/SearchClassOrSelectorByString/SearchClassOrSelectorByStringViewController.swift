//
//  SearchClassOrSelectorByStringViewController.swift
//  UIKitDemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/6/30.
//

import UIKit

class SearchClassOrSelectorByStringViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "通过字符串查找Class或者Selector"
        AlertMessage(title: "提示", message: "开始初始化").show(in: self)
        setupUI()
    }
    
    func setupUI(){
        let button = UIButton(type: .system)
        button.setTitle("确认", for: .normal)
        button.backgroundColor = UIColor.primaryBgColor
        button.accessibilityIdentifier = Accessibility.confirmButton
        button.addTarget(self, action: #selector(doAction(_:)), for: .touchUpInside)
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            button.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20)
        ])
        
        let cancelButton = UIButton(type: .system)
        cancelButton.setTitle("取消", for: .normal)
        cancelButton.layer.borderColor = UIColor.borderColor.cgColor
        cancelButton.layer.borderWidth = 1
        cancelButton.accessibilityIdentifier = Accessibility.cancelButton
        cancelButton.addTarget(self, action: #selector(doAction(_:)), for: .touchUpInside)
        view.addSubview(cancelButton)
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cancelButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            cancelButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            cancelButton.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 20)
        ])
    }
    
    @objc func doAction(_ sender: UIButton){
        let methodName = sender.accessibilityIdentifier == Accessibility.confirmButton ? "testA" : "testB"
        
        print("methodName===>", methodName)
        // 使用字符串查找方法
        // 因为是通过选择器查找，所以被查询的方法一定要带有 @objc 注解
        let method = NSSelectorFromString(methodName)
        debugPrint(method)
        // 判断方法是否有实现，可执行
        if responds(to: method) {
            perform(method, with: nil, afterDelay: 0)
        } else {
            print("未找到方法")
        }
    }
    
    // 因为是通过选择器查找，所以被查询的方法一定要带有 @objc 注解
    @objc func testA(){
        AlertMessage(title: "提示", message: "点击了确认按钮").show(in: self)
        print("confirm button clicked")
    }
    // 因为是通过选择器查找，所以被查询的方法一定要带有 @objc 注解
    @objc func testB(){
        AlertMessage(title: "提示", message: "点击了取消按钮").show(in: self)
        print("cancel button clicked")
    }
    
    
}

extension SearchClassOrSelectorByStringViewController {
    
    enum Accessibility {
        static let confirmButton = "SCOSS.button.confirm"
        static let cancelButton = "SCOSS.button.cancel"
    }
}
