//
//  UISegmentControl.swift
//  DemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2022/11/26.
//

import UIKit

class UISegmentedViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "UISegmentedControl-分段控制器"
        // Do any additional setup after loading the view.
        
        let seg: UISegmentedControl = UISegmentedControl(frame: CGRect(x:0, y:100, width: 280, height:40))
        
        self.view.addSubview(seg)
        
        // 设置分段控制器按钮
        seg.insertSegment(withTitle: "第一个按---------钮", at: 0, animated: true)
        seg.insertSegment(withTitle: "第二个按钮", at: 1, animated: true)
        seg.insertSegment(withTitle: "第三个按钮", at: 2, animated: true)
        
        
        // 设置事件
        seg.addTarget(self, action: #selector(didSegmentedControlClicked(_:)), for: .valueChanged)
        
        // 设置分段控制器是否保持选中状态，此属性的默认值为false。
        // 如果设置为true，则控件中的分段不会显示选定状态，并且在跟踪结束后不会更新selectedSegmentIndex的值。
//        seg.isMomentary = true
        // 设置宽度自适应内容
        seg.apportionsSegmentWidthsByContent = true
        // 手动设置某个item的宽度
        seg.setWidth(60, forSegmentAt: 1)
        // 设置内容区域的偏移量
        seg.setContentOffset(CGSizeMake(10, 10), forSegmentAt: 1)
        // 设置默认选中项
        seg.selectedSegmentIndex = 2 // 这里的值是索引并非我们设置的 at 值，0指向第一个，at:0
        // 设置渲染色, 针对边框选中的色彩
        seg.tintColor = UIColor.red
    
    }
    
    @objc func didSegmentedControlClicked(_ sender: UISegmentedControl){
        print("segmented control clicked, current selected ===> \(sender.selectedSegmentIndex)")
    }
}

