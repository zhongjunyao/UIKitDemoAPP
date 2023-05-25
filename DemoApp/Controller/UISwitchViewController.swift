//
//  UISwitchViewController.swift
//  DemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/5/22.
//

import UIKit
import SnapKit

class UISwitchViewController: BaseViewController {
    
    lazy var switchControl: UISwitch = UISwitch()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "UISwitch-开关控件"
        
        // 事件
        switchControl.addTarget(self, action: #selector(didSwitchClicked(_:)), for: .touchUpInside)
        view.addSubview(switchControl)
        switchControl.snp.makeConstraints { make in
            make.left.top.equalTo(100)
        }
        
        // 自定义UI
        // 滑块的颜色
        switchControl.thumbTintColor = .orange
        // 开关开启的颜色
        switchControl.onTintColor = .blue
        // 关闭开关的颜色
        switchControl.tintColor = .systemPink
    }
    
    @objc func didSwitchClicked(_ sender: UISwitch){
        print("switch clicked, current is on ? ===>\(sender.isOn)")
        if sender.isOn {
            switchControl.backgroundColor = .gray
        } else {
            switchControl.backgroundColor = .white
        }
    }
}
