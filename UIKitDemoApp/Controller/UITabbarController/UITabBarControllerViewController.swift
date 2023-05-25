//
//  UITabBarControllerViewController.swift
//  UIKitDemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/5/23.
//

import UIKit

class UITabBarControllerViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置 Tab bar 的项
        setupTabbarItems()
        
    }
    
    func setupTabbarItems(){
        let tabBarList: [[String: Any?]] = [
            [
                "vc": TabOneViewController(),
                "image": UIImage(named: "home"),
                "selectedImage": UIImage(named: "home_selected"),
                "title": "首页",
            ],
            [
                "vc": TabTwoViewController(),
                "image": UIImage(named: "mine"),
                "selectedImage": UIImage(named: "mine_selected"),
                "title": "我的",
            ]
        ]
        for item in tabBarList {
            if let vc = item["vc"] as? UIViewController, let tabBarItem = vc.tabBarItem {
                tabBarItem.image = item["image"] as? UIImage
                tabBarItem.selectedImage = item["selectedImage"] as? UIImage
                tabBarItem.title = item["title"] as? String
                
                // 下行代码只改变文字颜色，建议使用 tabBar.tintColor = UIColor.fontColor
                // tabBarItem.setTitleTextAttributes([.foregroundColor: UIColor.fontColor], for: .selected)
                
                // 创建 UINavigationController
                let navigationVC = UINavigationController(rootViewController: vc)
                // 设置导航头背景色，两行代码一起用，防止不生效
                navigationVC.navigationBar.backgroundColor = UIColor.white
                navigationVC.navigationBar.setBackgroundImage(UIColor.white.toImage(), for: .default)
                // 隐藏tabbar的title
                navigationVC.isNavigationBarHidden = true
                
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
        debugPrint(tabBarList[selectedIndex]["title"]!!)
        title = String(describing: tabBarList[selectedIndex]["title"]!!)
        
        // 设置代理
        delegate = self
    }
    
}

extension UITabBarControllerViewController: UITabBarControllerDelegate {
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print("选中项：\(String(describing: item.title))", "， 类：\(String(describing: type(of: item)))")
        title = item.title!
    }
}


