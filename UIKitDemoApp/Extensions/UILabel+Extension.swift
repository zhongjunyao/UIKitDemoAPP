//
//  UILabel+Extension.swift
//  UIKitDemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/7/29.
//

import UIKit

extension UILabel {
    static func make(text: String, textFont: UIFont, lineHeightMultiple: CGFloat = 1, lineSpacing: CGFloat = 0, numberOfLines: Int = 0) -> UILabel {
        let labelV = UILabel()
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 0
        paragraphStyle.lineBreakMode = .byWordWrapping
        paragraphStyle.lineHeightMultiple = lineHeightMultiple - (lineHeightMultiple - 1) / 4
        let baselineOffset = (lineHeightMultiple - 1) * textFont.lineHeight / 4
        labelV.font = textFont
        labelV.numberOfLines = numberOfLines
        labelV.attributedText = NSAttributedString(string: text, attributes: [.paragraphStyle: paragraphStyle, .baselineOffset: baselineOffset])
        // 设置字体跟随系统Accessibility字体大小
        labelV.adjustsFontForContentSizeCategory = true
        labelV.translatesAutoresizingMaskIntoConstraints = false
        return labelV
    }
}
