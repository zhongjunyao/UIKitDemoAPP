//
//  UIApplicationExtension.swift
//  DemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/5/22.
//

import Foundation
import UIKit

extension UIApplication {
    class var statusBarBackgroundColor: UIColor? {
        get {
            if #available(iOS 13.0, *) {
                let tag = 987654321

                if let statusBar = UIApplication.shared.keyWindow?.viewWithTag(tag) {
                    return statusBar.backgroundColor
                }
                let statusBar = UIView(frame: UIApplication.shared.keyWindow?.windowScene?.statusBarManager?.statusBarFrame ?? CGRect.zero)
                return statusBar.backgroundColor
            } else {
                let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
                return statusBar.backgroundColor
            }
        }
        set {
            if #available(iOS 13.0, *) {
                let tag = 987654321

                if let statusBar = UIApplication.shared.keyWindow?.viewWithTag(tag) {
                    statusBar.backgroundColor = newValue
                } else {
                    let statusBar = UIView(frame: UIApplication.shared.keyWindow?.windowScene?.statusBarManager?.statusBarFrame ?? CGRect.zero)
                    if statusBar.responds(to:#selector(setter: UIView.backgroundColor)) {
                        statusBar.backgroundColor = newValue
                    }
                    statusBar.tag = tag
                    UIApplication.shared.keyWindow?.addSubview(statusBar)
                }
            } else {
                let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
                if statusBar.responds(to:#selector(setter: UIView.backgroundColor)) {
                    statusBar.backgroundColor = newValue
                }
            }
        }
    }

}

