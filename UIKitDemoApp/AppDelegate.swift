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
    
    var launchWindow: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        setupWindow()
        
        setupLaunchWindow()
        
        return true
    }
    
//    func applicationDidBecomeActive(_ application: UIApplication) {
//        cancelLaunchWindow()
//    }
    
    func setupWindow(){
        self.window = UIWindow(frame: UIScreen.main.bounds)
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
        self.window?.rootViewController = tabBarVC
        self.window?.makeKeyAndVisible()
    }
    
    func setupLaunchWindow(){
        // 创建第二个window，遮挡住第一个window
        // 引导页的操作到 LaunchViewController 控制器里面做
        self.launchWindow = UIWindow(frame: UIScreen.main.bounds)
        self.launchWindow?.rootViewController = LaunchViewController()
        self.launchWindow?.makeKeyAndVisible()

        // 定时销毁， 这里不使用使用生命周期函数 func applicationDidBecomeActive(UIApplication) 来销毁
        // 为了方便查看效果，使用定时销毁
        self.perform(#selector(cancelLaunchWindow), with: nil, afterDelay: 5)
    }
    
    /**
     销毁引导页Window
     */
    @objc func cancelLaunchWindow() {
        print("cancelLaunchWindow invoked")
        if self.launchWindow != nil {
            self.launchWindow?.resignKey()
            self.launchWindow = nil
        }
    }
    
}

extension AppDelegate {
//    func makeAppController() -> AppController.AppControllerTemplate
}
