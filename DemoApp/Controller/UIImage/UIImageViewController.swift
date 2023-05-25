//
//  UIImageViewController.swift
//  DemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/5/22.
//

import UIKit

class UIImageViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "UIImageView-图片动画"

        let imageView: UIImageView = UIImageView(frame: CGRectMake(100, 100, 100, 100))
        // 设置图片
        imageView.image = UIImage(named: "home.png")
        // 设置背景色
        imageView.backgroundColor = .gray
        // 设置高亮图片
        imageView.highlightedImage = UIImage(named: "home_selected.png")
        // 设置当前为高亮状态
        // imageView.isHighlighted = true
        
        view.addSubview(imageView)
        
        // 设置imageView的图片动画
        var animationImages:[UIImage] = []
        for idx in 1...8 {
            let image: UIImage? = UIImage(named: "run-\(idx).png")
            animationImages.append(image!)
        }
        // 设置动画数组
        imageView.animationImages = animationImages
        // 设置播放次数, 0 表示无限
        imageView.animationRepeatCount = 0
        // 设置播放一轮的时间, 单位：秒
        imageView.animationDuration = 1
        // 动画开始
        imageView.startAnimating()
        // 动画结束
        // imageView.stopAnimating()
    }
    

}
