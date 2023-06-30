//
//  AnimationViewController.swift
//  UIKitDemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/7/1.
//

import UIKit
import SnapKit

class AnimationViewController: BaseViewController {

    var animateBlock: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "简单动画"
        // 参考文档：https://www.jianshu.com/p/71f2fa270b9c
        setupUI()
    }
    
    func setupUI(){
        // 添加动画操作块
        animateBlock = UIView(frame: CGRect(x: 20, y: 0, width: 50, height: 50))
        animateBlock.alpha = 1
        animateBlock.backgroundColor = .red
        view.addSubview(animateBlock)

        
        let colorButton = UIButton(type: .system)
        colorButton.setTitle("开始动画", for: .normal)
        colorButton.backgroundColor = UIColor.primaryBgColor
        colorButton.layer.cornerRadius = 5
        colorButton.addTarget(self, action: #selector(doAnimation), for: .touchUpInside)
        view.addSubview(colorButton)
        colorButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(-20)
            make.height.equalTo(50)
        }
        
    }
    
    @objc func doAnimation(){
        UIView.animate(withDuration: 2, animations: {
            self.animateBlock.alpha = 0.5
            self.animateBlock.backgroundColor = .blue
        })
        UIView.animate(withDuration: 2, delay: 2, animations: {
            self.animateBlock.center.y = self.view.center.y
            self.animateBlock.frame.size.width = 100
        })
    }
    
}
