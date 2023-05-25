//
//  UITextFieldController.swift
//  DemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2022/11/26.
//

import UIKit

class UITextFieldController : BaseViewController, UITextFieldDelegate {
    var textField:UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "UITextField-输入框"
        
        textField = UITextField(frame: CGRectMake(20, 100, UIScreen.main.bounds.width - 20*2, 40))
        // 设置内嵌凹的边框 line, none, bezel
//        textField.borderStyle = UITextField.BorderStyle.line
        textField.borderStyle = UITextField.BorderStyle.bezel
        textField.layer.borderWidth = 1 / UIScreen.main.scale
        textField.layer.borderColor = UIColor.lightGray.cgColor
//        textField.backgroundColor = .red
        // 提示文字
        textField.placeholder = "Please input your name"
        // 字体颜色
        textField.textColor = UIColor.fontColor
        // 字体
        textField.font = UIFont.italicSystemFont(ofSize: 15)
        // 对齐方式
        textField.textAlignment = NSTextAlignment.center
        // 每次进入编辑都清空值
        // textField.clearsOnBeginEditing = true
        // 字体大小自适应
        textField.adjustsFontSizeToFitWidth = true
        // 设置输入框不可编辑
        // textField.isEnabled = false
        
//        // 设置 左视图/右视图
//        let viewLeft:UIView = UIView(frame: CGRectMake(0, 0, 40, 40))
//        // let viewRight:UIView = UIView(frame: CGRectMake(0, 0, 40, 40))
//        textField.leftView = viewLeft
//        // textField.rightView = viewRight
//        // 设置左右视图的显示模式
//        textField.leftViewMode = UITextField.ViewMode.always
//        // textField.rightViewMode = UITextField.ViewMode.always
//        viewLeft.backgroundColor = UIColor.blue
//        // viewRight.backgroundColor = UIColor.red
        
//        // 设置输入聚焦时弹出自定义的控件，而不是键盘
//        // let viewBoard:UIView = UIView(frame: CGRectMake(0, 0, UIScreen.main.bounds.width, 200))
//        // textField.inputView = viewBoard
//        // 设置副键盘视图
//        let viewBoard2:UIView = UIView(frame: CGRectMake(0, 0, UIScreen.main.bounds.width, 50))
//        viewBoard2.backgroundColor = UIColor.orange
//        textField.inputAccessoryView = viewBoard2
//        // textField.backgroundColor = UIColor.red
        
        // 显示清除按钮 always, unlessEditing, whileEditing
        textField.clearButtonMode = UITextField.ViewMode.always
    
        // 设置代理
        textField.delegate = self
        self.view.addSubview(textField)
    }
    
    // 当输入改变时调用的方法
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("\(range)==>\(string)")
        return true
    }
    // textField 已经进入编辑状态时调用的方法
    func textFieldDidBeginEditing(_ textField: UITextField) {
       print("DidBegin")
    }
    // textField 结束编辑状态时调用的方法
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("DidEnd")
    }
    // textField 将要进入编辑状态时调用的方法
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("ShouldBegin")
        return true
    }
    // textField 将要结束编辑状态时调用的方法
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("ShouldEnd")
        return true
    }
    // 点击return 退出编辑
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    // 点击屏幕退出编辑
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textField.resignFirstResponder()
    }
}
