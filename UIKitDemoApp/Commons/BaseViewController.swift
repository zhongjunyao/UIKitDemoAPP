//
//  BaseViewController.swift
//  UIKitDemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/5/22.
//

class BaseViewController: UIViewController {
    
    func log(_ items: Any..., separator: String = " ", terminator: String = "\n") {
        let newItems = [[String(describing: type(of: self)), "===>"].joined(separator: separator)] + items
        print(newItems, separator: separator, terminator: terminator)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置状态栏背景色
        UIApplication.statusBarBackgroundColor = .white
        setNeedsStatusBarAppearanceUpdate()
        
        // 设置背景色
        view.backgroundColor = UIColor.globalBgColor

        // 设置默认返回按钮文字、颜色
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "返回", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.tintColor = .black
        
        // 设置导航栏的背景色
        navigationController?.navigationBar.backgroundColor = .white
        // 滚动界面下的导航栏背景色不使用透明
        navigationController?.navigationBar.isTranslucent = false
        
        // 设置布局的延伸边界
        edgesForExtendedLayout = UIRectEdge(rawValue: 0)
    }
}
