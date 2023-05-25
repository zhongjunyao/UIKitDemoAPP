//
//  UITextViewViewController.swift
//  DemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/5/23.
//

import UIKit
import SnapKit

class UITextViewViewController: BaseViewController {

    var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "UITextView-文本视图"
        
        setupViews()
    }
    
    func setupViews(){
        textView = UITextView()
        textView.backgroundColor = .white
        view.addSubview(textView)
        textView.snp.makeConstraints {make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalToSuperview().offset(20)
            make.height.equalTo(120)
        }
        
        // 设置圆角、边框
        textView.layer.cornerRadius = 5
        textView.clipsToBounds = true
        textView.layer.borderColor = UIColor.fontSecondaryColor.cgColor
        textView.layer.borderWidth = 1
        
        // 设置字体、颜色、对齐方式
        textView.font = UIFont.systemFont(ofSize: 20)
        textView.textColor = .fontColor
        textView.textAlignment = .center

//        // 设置是否可编辑
//        textView.isEditable = false
//        textView.text = "不可编辑"
//
//        // 设置不可编辑下超链接的识别类型
//        textView.dataDetectorTypes = UIDataDetectorTypes.link
//        textView.text = "你好，我是text view\n网址：www.toutiao.com"
        
        // 设置代理
        textView.delegate = self
    }
}

extension UITextViewViewController: UITextViewDelegate {
    
    // 输入字符时，回调
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        print("textView shouldChangeTextIn invoked, range:", range, "text:", text)
        return true
    }
    
    // 输入改变时，回调
    func textViewDidChange(_ textView: UITextView) {
        print("textViewDidChange invoked")
    }
    
    // 改变选中文字时，回调
    func textViewDidChangeSelection(_ textView: UITextView) {
        print("textViewDidChangeSelection invoked")
    }
    
    // 将要开始编辑时，回调
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        print("textViewShouldBeginEditing invoked")
        return true
    }
    
    // 开始编辑时，回调
    func textViewDidBeginEditing(_ textView: UITextView) {
        print("textViewDidBeginEditing invoked")
    }
    
    // 将要结束编辑时，回调
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        print("textViewShouldEndEditing invoked")
        return true
    }
    
    // 结束编辑时，回调
    func textViewDidEndEditing(_ textView: UITextView) {
        print("textViewDidEndEditing invoked")
    }
    
    
    
}
