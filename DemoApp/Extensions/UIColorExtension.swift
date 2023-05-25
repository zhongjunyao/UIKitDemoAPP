//
//  UIColorExtension.swift
//  DemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/5/22.
//

import Foundation
import UIKit

extension UIColor {
    // color
    static let fontColor = UIColor.hexColor(0x333333)
    static let fontSecondaryColor = UIColor.hexColor(0x999999)
    static let fontThirdColor = UIColor.hexColor(0xd4d4d4)
    static let fontFourthColor = UIColor.hexColor(0xe2e4e7)
    static let fontPriceColor = UIColor.hexColor(0xe23b41)
    static let borderColor = UIColor.fontColor
    static let primaryBgColor = UIColor.hexColor(0xf8892e)
    static let activeBgColor = UIColor.hexColor(0xff0000)
    static let globalBgColor = UIColor.hexColor(0xf2f4f7)
    
    static func randomColor(alpha: CGFloat? = 1) -> UIColor {
        return UIColor(red: CGFloat(arc4random()%255)/255, green: CGFloat(arc4random()%255)/255, blue: CGFloat(arc4random()%255)/255, alpha: alpha!)
    }
    
    static func hexColor(_ hexValue: Int, alphaValue: Float) -> UIColor {
        return UIColor(red: CGFloat((hexValue & 0xFF0000) >> 16) / 255, green: CGFloat((hexValue & 0x00FF00) >> 8) / 255, blue: CGFloat(hexValue & 0x0000FF) / 255, alpha: CGFloat(alphaValue))
    }
    
    static func hexColor(_ hexValue: Int) -> UIColor {
        return hexColor(hexValue, alphaValue: 1)
    }
    
    convenience init(_ hexValue: Int, alphaValue: Float) {
        self.init(red: CGFloat((hexValue & 0xFF0000) >> 16) / 255, green: CGFloat((hexValue & 0x00FF00) >> 8) / 255, blue: CGFloat(hexValue & 0x0000FF) / 255, alpha: CGFloat(alphaValue))
    }
    
    convenience init(_ hexValue: Int) {
        self.init(hexValue, alphaValue: 1)
    }
    
    func toImage() -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(self.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
}



