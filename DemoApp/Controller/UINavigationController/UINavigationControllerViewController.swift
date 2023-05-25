//
//  UINavigationControllerViewController.swift
//  DemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/5/23.
//

import UIKit
import SnapKit

class UINavigationControllerViewController: BaseViewController {
    // 开始加载页面
    override func loadView() {
        super.loadView()
        log("loadView invoked")
    }
    
    // 视图已经加载
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "UINavigationController-导航控制器"
        log("viewDidLoad invoked")
        
        setupViews()
    }
    
    func setupViews(){
        let button = UIButton(type: .custom)
        button.setTitle("跳转目标页面", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(didButtonClick(_:)), for: .touchUpInside)
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        button.titleLabel?.snp.makeConstraints { make in
            make.left.top.equalToSuperview().offset(10)
            make.right.bottom.equalToSuperview().offset(-10)
        }
    }
    
    @objc func didButtonClick(_ sender: UIButton) {
        // 由于已经在 AppDelegate.swift 中创建了 UINavigationController 的实例
        // 并将 HomeViewController 作为 rootViewController
        // 由 HomeViewController 跳转到当前页面，所以本页面自带 UINavigationController 的实例
        
        // 创建目标页面
        let destinationVC = DestinationViewController()
        // 携带参数
        destinationVC.info = "hello"
        // 跳转到目标页面
        navigationController?.pushViewController(destinationVC, animated: true)
        
        // 不使用navigationController, 从底部弹出，为 model 形式
//        present(destinationVC, animated: true)
    }
    
    // 视图将要展示
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        log("viewWillAppear invoked")
    }
    
    // 视图将要布局子视图
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        log("viewWillLayoutSubviews invoked")
    }
    
    // 视图已经布局子视图
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        log("viewDidLayoutSubviews invoked")
    }
    
    // 视图已经展示
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        log("viewDidAppear invoked")
    }
    
    // 视图将要隐藏
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        log("viewWillDisappear invoked")
    }
    
    // 视图已经隐藏
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        log("viewDidDisappear invoked")
        if self.navigationController == nil {
            viewDidClose()
        }
    }
    
    // 页面真正销毁
    open func viewDidClose() {
        log("viewDidClose, invoked")
    }
}
