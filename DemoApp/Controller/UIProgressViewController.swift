//
//  UIProgressViewController.swift
//  DemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2022/11/27.
//

import UIKit

class UIProgressViewController : BaseViewController {
    
    var progress:UIProgressView! = UIProgressView(progressViewStyle: UIProgressView.Style.default)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "UIProgressView-进度条"
        
        // 样式 default, bar(used in toolbar)
        progress = UIProgressView(progressViewStyle: UIProgressView.Style.default)
        progress.frame = CGRectMake(20, 100, self.view.frame.width, 20)
        
        self.view.addSubview(progress)
        // 设置进度条的初始值, 范围: 0.0 - 1.0
        progress.progress = 0.5
        
        // 设置走过的进度颜色
        progress.progressTintColor = UIColor.green
        // 没走过的轨迹颜色
        progress.trackTintColor = UIColor.red
    }
}
