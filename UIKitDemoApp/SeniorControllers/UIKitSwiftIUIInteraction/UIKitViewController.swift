//
//  UIKitViewController.swift
//  UIKitDemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/5/27.
//

import UIKit
import SwiftUI
import SnapKit

class UIKitViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "UIKit与SwiftUI交互"

        setupViews()
    }
    
    func setupViews(){
        let button = UIButton(type: .custom)
        button.setTitle("跳转SwiftUI页面", for: .normal)
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
        // 创建目标页面
        let swiftUIVC = UIHostingController(rootView: SwiftUIView())
        // 携带参数
        swiftUIVC.rootView.message = "UIKitPage's message"
        // 跳转到目标页面
        navigationController?.pushViewController(swiftUIVC, animated: true)
    }
}
