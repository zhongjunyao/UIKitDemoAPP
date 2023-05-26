//
//  AppDelegate.swift
//  UIKitDemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2022/11/20.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        setupWindow()
        return true
    }
    
    func setupWindow(){
        window = UIWindow(frame: UIScreen.main.bounds)
        let tabBarVC = CommonTabBar()
        tabBarVC.items = [
            CommonTabBarItemModel(
                vc: HomeViewController(),
                image: UIImage(named: "uikit"),
                selectedImage: UIImage(named: "uikit_selected"),
                title: "UIKit"
            ),
            CommonTabBarItemModel(
                vc: SeniorViewController(),
                image: UIImage(named: "senior"),
                selectedImage: UIImage(named: "senior_selected"),
                title: "Senior"
            ),
        ]
        tabBarVC.selectedIndex = 1
        window?.rootViewController = tabBarVC
        window?.makeKeyAndVisible()
    }
}

