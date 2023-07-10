//
//  StringEmojiViewController.swift
//  UIKitDemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/7/7.
//

import UIKit
import Swift

class StringEmojiViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "String-特殊字符"
        
        setupUI()
    }

    func setupUI(){
        "".testEmoji()
    }
}

extension String {
    func testEmoji(){
        print("所有特殊字符如下：")
        print(unicodeScalars)
    }
}
