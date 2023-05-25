//
//  util.swift
//  UIKitDemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/5/22.
//

import UIKit

class CommonUtil {
    static var screenBounds: CGRect {
        get {
            UIScreen.main.bounds
        }
    }
    
    static var screnWidth: CGFloat {
        get {
            screenBounds.width
        }
    }
    
    static var screnHeight: CGFloat {
        get {
            screenBounds.height
        }
    }
    
    // 底部安全区域的safeAreaInsets.bottom，安全区域外的底部高度
    static func getSafeAreaInsertsBottom(_ vc: UIViewController) -> CGFloat {
        if #available(iOS 11.0, *) {
            return vc.view.safeAreaInsets.bottom
        }
        return 0
    }
    
    
    // 获取状态栏的高度
    static var statusBarHeight: CGFloat {
        get {
            UIApplication.shared.statusBarFrame.size.height
        }
    }
    
    // 获取导航栏的高度
    static func getNavHeight(_ vc: UIViewController) -> CGFloat {
        return vc.navigationController?.navigationBar.frame.size.height ?? 0
    }
    
    // 获取可布局区域的边界对象，排除navigationBar，statusBar，底部不可用区域， 目前只针对竖屏
    static func getAvalableAreaInsets(_ vc: UIViewController) -> UIEdgeInsets {
        return UIEdgeInsets(top: getNavHeight(vc) + statusBarHeight, left: 0, bottom: getSafeAreaInsertsBottom(vc), right: 0)
    }
    // 获取tabBar的高度
    // 1.在tabBarController中使用（你的继承自UITabBarController的VC）
    static func getTabBarHeight(_ tabBarVC: UITabBarController) -> CGFloat {
        return tabBarVC.tabBar.frame.size.height
    }
}

