//
//  DestinationViewController.swift
//  UIKitDemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/5/24.
//

import UIKit
import SnapKit

class DestinationViewController: BaseViewController {
    
    // 定义变量用于接收信息
    lazy var info: String = ""
    
    // 开始加载页面
    override func loadView() {
        super.loadView()
        log("loadView invoked")
    }
    
    // 视图已经加载
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "UINavigationController-目标页面"
        
        log("viewDidLoad invoked")
        
        setupViews()
        
        // 设置导航栏
        setupNavigationBar()
    }
    
    func setupNavigationBar(){
        // 设置返回按钮和事件
        let backButtonItem = UIBarButtonItem(title: "返回", style: .plain, target: self, action: #selector(didBackButtonClicked))
        backButtonItem.tintColor = .black
        // 部分自定义，还是带有返回图标，点击立即返回上一页
//        navigationItem.backBarButtonItem = backButtonItem
        
        // 或者完全自定义，没有返回图标了，可以拦截返回上一页
        navigationItem.leftBarButtonItem = backButtonItem
//        let backImage = UIImage(named: "back")
//        backButtonItem.image = backImage
//        backButtonItem.imageInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
//        backButtonItem.customView?.bounds = CGRectMake(0, 0, 100, CommonUtil.getNavHeight(self))
        
        // 设置右边按钮
        let barButton1 = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.camera, target: self, action: #selector(action1))
        let barButton2 = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.bookmarks, target: self, action: #selector(action2))
//        navigationItem.rightBarButtonItems = [barButton1, barButton2]
        
        // 设置工具栏
        navigationController?.isToolbarHidden = false
        navigationController?.toolbar.backgroundColor = .white
        // 添加按钮到工具栏
        self.toolbarItems = [barButton1, barButton2]
    }
    
    @objc func didBackButtonClicked(){
        let alertVC = UIAlertController(title: "提醒", message: "确认退出当前页面？", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "确认", style: .destructive, handler: { _ in
            self.navigationController?.popViewController(animated: true)
        }))
        alertVC.addAction(UIAlertAction(title: "取消", style: .cancel))
        present(alertVC, animated: true)
    }
    
    @objc func action1(){
        let alertVC = UIAlertController(title: "提醒", message: "点击了按钮1", preferredStyle: .alert)
        present(alertVC, animated: true)
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: {timer in
            alertVC.dismiss(animated: true)
            timer.invalidate()
        })
    }
    
    @objc func action2(){
        let alertVC = UIAlertController(title: "提醒", message: "点击了按钮2", preferredStyle: .alert)
        present(alertVC, animated: true)
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: {timer in
            alertVC.dismiss(animated: true)
            timer.invalidate()
        })
    }
    
    func setupViews(){
        let label = UILabel()
        label.text = "当前是目标页面，接收信息：\(info)"
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-50)
        }
        
        let button = UIButton(type: .custom)
        button.setTitle("返回上一页面", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(didButtonClick(_:)), for: .touchUpInside)
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(label.snp.bottom).offset(10)
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
        
        // 回退到上一页面
        navigationController?.popViewController(animated: true)
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
    
    // 视图将要销毁
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        log("viewWillDisappear invoked")
    }
    
    // 视图已经销毁
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
