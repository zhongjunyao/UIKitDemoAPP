//
//  UISliderController2.swift
//  UIKitDemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2022/11/26.
//

import UIKit
import SnapKit

class UISliderViewController2 : BaseViewController {
    var compSlider: UISlider!
    var compImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "UISlider-滑块控制图片大小"
        
        compSlider = UISlider()
        // 添加一个控制函数
        compSlider.addTarget(self, action: #selector(slider), for: UIControl.Event.valueChanged)
        // 设置取值范围
        compSlider.maximumValue = 2
        compSlider.minimumValue = 0.5
        // 设置初始值
        compSlider.value = 1
        
        view.addSubview(compSlider)
        compSlider.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(20)
        }
        
        // 将图片放在 Asserts 中，使用图片集的名字加载图片
        // compImage.image = UIImage(named: "Imgs")
        compImage = UIImageView(frame: CGRectMake(CommonUtil.screnWidth/4, 600/4 + 100, 150, 250))
        // 放在相对路径中
        compImage.image = UIImage(named: "截屏2022-11-26 19.39.13.png")
        view.addSubview(compImage)
//        compImage.snp.makeConstraints { make in
//            make.left.equalTo(compSlider.snp.left)
//            make.top.equalTo(compSlider).offset(100)
//        }
    }
    @objc func slider(slider:UISlider){
        let value:Float = slider.value
        compImage.bounds = CGRectMake(0, 0, 150 * CGFloat(value), 250 * CGFloat(value))
    }
    
    // 点击屏幕可以随机移动滑块
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let t = touches.first {
            // 获取点击的坐标位置
            let p: CGPoint = t.location(in: self.view)
            let radio = p.x / self.view.bounds.width
            
            var value = NSDecimalNumber(string: String(format: "%.2f", radio * 2)).floatValue
            
            if value < 0.5 {
                value = 0.5
            } else if value > 2 {
                value = 2
            }
            
            print("value===>\(value)")
            compSlider.setValue(value, animated: true)
            compImage.bounds = CGRectMake(0, 0, 150 * CGFloat(value), 250 * CGFloat(value))
        }
    }
}

