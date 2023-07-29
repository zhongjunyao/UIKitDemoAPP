//
//  AppDelegate.swift
//  UIKitDemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2022/11/20.
//

import UIKit
import CoreData

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
            CommonTabBarItemModel(
                vc: StyleViewController(),
                image: UIImage(named: "style"),
                selectedImage: UIImage(named: "style_selected"),
                title: "Style"
            ),
            CommonTabBarItemModel(
                vc: SwiftLanguageViewController(),
                image: UIImage(named: "swift"),
                selectedImage: UIImage(named: "swift_selected"),
                title: "Swift"
            ),
        ]
        tabBarVC.selectedIndex = 0
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
        self.perform(#selector(cancelLaunchWindow), with: nil, afterDelay: 1)
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
    
    
    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "UIKitDemoApp")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}

extension AppDelegate {
//    func makeAppController() -> AppController.AppControllerTemplate
}
