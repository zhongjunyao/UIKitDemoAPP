//
//  UIStepperViewController.swift
//  UIKitDemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/5/22.
//

import UIKit
import SnapKit

class UIStepperViewController: BaseViewController {

    var stepper: UIStepper!
    var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "UIStepperView-步进控制器"
        
        setupViews()
    }
    
    func setupViews() {
        stepper = UIStepper()
        stepper.backgroundColor = .orange
        // 设置最大、最小值
        stepper.maximumValue = 20
        stepper.minimumValue = 5
        // 设置步长
        stepper.stepValue = 2
        // 设置按住按钮连续触发step 增长
        stepper.isContinuous = false
        // 值是否持续改变
        stepper.autorepeat = false
        // 是否可以循环触发, true 循环
        stepper.wraps = true
        // 设置控件的颜色
        stepper.tintColor = .red
        
        // 设置事件
        stepper.addTarget(self, action: #selector(change(_:)), for: .touchUpInside)
        view.addSubview(stepper)
        stepper.snp.makeConstraints { make in
            make.left.top.equalTo(100)
            make.width.equalTo(200)
            make.height.equalTo(100)
        }
        
        label = UILabel(frame: .zero)
        print(stepper.value)
        label.text = String(format: "%.0f", stepper.value)
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.left.equalTo(stepper.snp.left)
            make.top.equalTo(stepper.snp.bottom).offset(20)
        }
    }
    
    @objc func change(_ sender: UIStepper){
        label.text = String(format: "%.0f", sender.value)
    }
}
