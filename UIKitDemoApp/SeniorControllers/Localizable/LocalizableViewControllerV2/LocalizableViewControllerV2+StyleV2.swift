//
//  LocalizableViewController+Style.swift
//  UIKitDemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/7/26.
//

import UIKit

extension LocalizableViewControllerV2 {
    struct StyleV2 {
        let primaryFont: UIFont
        let primaryFontColor: UIColor
        let radioButtonHeight: CGFloat
        let bgColor: UIColor
        
        static var defaultStyle = StyleV2(
            primaryFont: UIFont.preferredFont(forTextStyle: .body),
            primaryFontColor: UIColor.fontColor,
            radioButtonHeight: 55.0,
            bgColor: .white
        )
    }
}
