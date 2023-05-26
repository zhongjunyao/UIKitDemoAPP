//
//  SwiftOCInteraction.swift
//  UIKitDemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/5/26.
//

import UIKit
import SnapKit

class SwiftOCInteraction: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Swift与OC交互"

        setupViews()
    }

    func setupViews(){
        let button = UIButton(type: .custom)
        button.setTitle("跳转OC页面", for: .normal)
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
    
    // 用于调用OC的函数需要使用 @objc 修饰
    @objc func didButtonClick(_ sender: UIButton) {
        // 创建OC目标页面
        let ocVC = OCViewController()
        // 调用OC方法
        ocVC.swiftMethod1(message: "你好")
        // 跳转到目标页面
        navigationController?.pushViewController(ocVC, animated: true)
        
    }

}
