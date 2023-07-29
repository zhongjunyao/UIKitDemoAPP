//
//  LineHeight.swift
//  UIKitDemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/7/29.
//

import UIKit

extension LineHeightViewController {
    
    struct Style {
        var padding: CGFloat = 20
        var smallPadding: CGFloat = 5
        var textFont: UIFont = UIFont.preferredFont(forTextStyle: .body)
        var lineHeightMultiple: CGFloat = 1.5
        // 参考文档之后，为了适应 Accessibility 功能，我们只能使用 lineHeightMutiple
        // 行高参考：https://juejin.cn/post/6844903585025622024
        
        static let defaultStyle = Style()
    }
}
