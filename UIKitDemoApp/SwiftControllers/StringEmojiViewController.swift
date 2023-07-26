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
        testSubstring()
    }
    
    func testSubstring(){
        debugPrint("1    ")
        debugPrint("1    ".suffix(from: "1    ".index(after: "1    ".startIndex)))
        debugPrint("1    ".prefix(upTo: "1    ".index(before: "1    ".endIndex)))
        let range = "|1|----".range(of: "|1|", options: .literal)
        
        if let range = range, !range.isEmpty {
            debugPrint("range?.lowerBound===>", range.lowerBound)
            debugPrint("|1|----".distance(from: "|1|----".startIndex, to: range.lowerBound))
        }
        
        let newStr = "|1|----"
        debugPrint("substring=====>", newStr.substring(from: newStr.index(newStr.startIndex, offsetBy: 3)))
        debugPrint("newStr===>", newStr)
        let newIdx = newStr.index(newStr.startIndex, offsetBy: 3)
        debugPrint("substring=====>", newStr[newIdx...])
        let newStr2 = "|1|"
        debugPrint("newStr===>", newStr2)
        let newIdx2 = newStr.index(newStr2.startIndex, offsetBy: 3)
        debugPrint("substring=====>", newStr2[newIdx2...])
    }
}

extension String {
    func testEmoji(){
        print("所有特殊字符如下：")
        print(unicodeScalars)
    }
}
