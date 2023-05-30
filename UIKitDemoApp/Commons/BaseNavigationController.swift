//
//  BaseNavigationController.swift
//  UIKitDemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/5/26.
//

class BaseNavigationController: UINavigationController {
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            print("BaseNavigationController ==> pushViewController invoked, hide bortom bar")
        }
        super.pushViewController(viewController, animated: animated)
    }
}
