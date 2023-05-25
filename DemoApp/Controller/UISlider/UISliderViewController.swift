//
//  UISliderController.swift
//  DemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2022/11/26.
//

import UIKit

class UISliderViewController : BaseViewController {
    var compSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "UISlider-滑块控件属性"
        // 创建一个滑块实例对象
        compSlider = UISlider()
        // 添加一个控制函数
        compSlider.addTarget(self, action: #selector(slider), for: UIControl.Event.valueChanged)
        // 设置取值范围
        compSlider.maximumValue = 100
        compSlider.minimumValue = 1
        // 设置是否连续触发事件，false在停止才触发
        compSlider.isContinuous = false
        // 设置圆形滑块的颜色
        compSlider.thumbTintColor = UIColor.orange
        // 设置背景色
        compSlider.backgroundColor = UIColor.green
        // 设置滑动块与最小值方向的轴颜色，与最大值方向的轴颜色
        compSlider.minimumTrackTintColor = UIColor.orange
        compSlider.maximumTrackTintColor = UIColor.red
        
        view.addSubview(compSlider)
        compSlider.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(200)
        }
    }
    @objc func slider(slider:UISlider){
        print("Current value is : \(slider.value)")
    }
    
    // 点击屏幕可以随机移动滑块
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let t = touches.first {
            // 获取点击的坐标位置
            let p: CGPoint = t.location(in: self.view)
            let radio = p.x / self.view.bounds.width
            
            let value = NSDecimalNumber(string: String(format: "%.1f", radio * 100)).floatValue
            print("value===>\(value)")
            compSlider.setValue(value, animated: true)
        }
    }
}
