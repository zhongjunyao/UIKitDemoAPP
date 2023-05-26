//
//  UIActivityIndicatorViewController.swift
//  UIKitDemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2022/11/27.
//

import UIKit
import SnapKit

class UIActivityIndicatorViewController : BaseViewController {
    var activity: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "UIActivityIndicatorView-提示器"
        
        // activity = UIActivityIndicatorView(frame: CGRectMake(self.view.frame.size.width/2-10, self.view.frame.size.height/2, 20, 20))
        activity = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
        activity.color = UIColor.gray
        self.view.addSubview(activity)
        
        activity.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        // 开始活动
        activity.startAnimating()
        
        // activity.hidesWhenStopped = false
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //停止活动
        activity.stopAnimating()
    }
}
