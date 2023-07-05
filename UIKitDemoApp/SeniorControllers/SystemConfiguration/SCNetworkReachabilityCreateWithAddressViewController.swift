//
//  SCNetworkReachabilityCreateWithAddressViewController.swift
//  UIKitDemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/7/3.
//

import UIKit
import SystemConfiguration
import SnapKit

class SCNetworkReachabilityCreateWithAddressViewController: BaseViewController {
    lazy var button1: UIButton = {
        return makeButton(title:"notify(依赖任务)", actionName: "doAction1")
    }()
    
    lazy var vStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [button1])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        return stackView
    }()
    func makeButton(title: String, actionName: String)-> UIButton{
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.tintColor = .white
        button.backgroundColor = UIColor.primaryBgColor
        button.layer.cornerRadius = 5
        button.addTarget(self, action: NSSelectorFromString(actionName), for: .touchUpInside)
        return button
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Network-连接"
        
        setupUI()
    }
    
    func setupUI(){
        view.addSubview(vStack)
        vStack.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalToSuperview().offset(20)
            make.height.equalTo(160)
        }
    }
    
    func doAction(){
//        kSCNetworkFlagsReachable
    }
}
