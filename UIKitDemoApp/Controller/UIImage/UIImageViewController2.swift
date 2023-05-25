//
//  UIImageViewController2.swift
//  UIKitDemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/5/22.
//

import UIKit

class UIImageViewController2: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "UIImageView-图片控件属性"
        
        let imageView: UIImageView = UIImageView(frame: CGRectMake(100, 100, 100, 100))
        imageView.backgroundColor = .red
        view.addSubview(imageView)
        // 圆角
        imageView.layer.cornerRadius = 50
//        imageView.layer.masksToBounds = true
        
        // 边框
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.green.cgColor
        
        // 阴影, 需要注意一点，如果设置阴影，要避免设置边界切割属性 masksToBounds 为 true
        imageView.layer.shadowColor = UIColor.purple.cgColor
        imageView.layer.shadowOffset = CGSizeMake(20, 20)
        imageView.layer.shadowOpacity = 1
        
    }

}
