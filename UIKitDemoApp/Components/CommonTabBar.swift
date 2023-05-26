//
//  CommonTabBar.swift
//  UIKitDemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/5/26.
//

import UIKit

class CommonTabBar: UITabBarController {
    
    var items: [CommonTabBarItemModel]! = [] {
        didSet {
            // 设置 Tab bar 的项
            if items != nil, items.count > 0 {
                setupTabbarItems(items)
            } else {
                print("The count of tab bar items can not be zero. Please set variable: \"items\"")
            }
        }
    }
    
    func setupTabbarItems(_ list: [CommonTabBarItemModel], isTabBarNavBarHidden: Bool = false) {
        for item in list {
            if let vc = item.vc, let tabBarItem = vc.tabBarItem {
                tabBarItem.image = item.image
                tabBarItem.selectedImage = item.selectedImage
                tabBarItem.title = item.title
                
                // 下行代码只改变文字颜色，建议使用 tabBar.tintColor = UIColor.fontColor
                // tabBarItem.setTitleTextAttributes([.foregroundColor: UIColor.fontColor], for: .selected)
                
                // 创建 BaseNavigationController
                let navigationVC = BaseNavigationController(rootViewController: vc)
                // 设置导航头背景色，两行代码一起用，防止不生效
                navigationVC.navigationBar.backgroundColor = UIColor.white
                navigationVC.navigationBar.setBackgroundImage(UIColor.white.toImage(), for: .default)
                // 隐藏tabbar的title
                navigationVC.isNavigationBarHidden = isTabBarNavBarHidden
                
                // 添加到主 VC 中
                addChild(navigationVC)
            }
        }
        
        // 图片文字一起变色
        tabBar.tintColor = UIColor.fontColor
        
        // 设置背景色，两行代码一起用，防止不生效
        UITabBar.appearance().backgroundColor = UIColor.white
        UITabBar.appearance().backgroundImage = UIColor.white.toImage()
        
        //默认选中的是第1个视图
        selectedIndex = 0
        title = String(describing: items?[selectedIndex].title!)
        
        // 设置代理
        delegate = self
    }
    
}

extension CommonTabBar: UITabBarControllerDelegate {
    // no op
}
