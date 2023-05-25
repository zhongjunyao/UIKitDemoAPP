//
//  AppDelegate.swift
//  DemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2022/11/20.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        let navVC = UINavigationController(rootViewController: HomeViewController())
        window?.rootViewController = navVC
        window?.makeKeyAndVisible()
        return true
    }
}

