//
//  UIStackViewViewController.swift
//  DemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/5/23.
//

import UIKit
import SnapKit

class UIStackViewViewController: BaseViewController {
    
    var stackView: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "UIStackView-栈视图"
        
        setupViews()
    }
    
    func setupViews(){
        
        stackView = UIStackView()
        
        stackView.backgroundColor = .gray
        
        let view1 = UIView(frame: CGRectMake(0, 0, 300, 100))
        view1.backgroundColor = .red
        let view2 = UIView(frame: CGRectMake(300, 0, 200, 200))
        view2.backgroundColor = .blue
        let view3 = UIView(frame: CGRectMake(500, 0, 100, 300))
        view3.backgroundColor = .green
        
        stackView.addArrangedSubview(view1)
        stackView.addArrangedSubview(view2)
        stackView.addArrangedSubview(view3)
        
        // 布局轴线方向
        stackView.axis = .horizontal
        // 对齐方式
        stackView.alignment = .fill
        // 分配子视图的沿着轴的占据宽度或高度, 设置等宽铺满
        stackView.distribution = .fillEqually
        // 设置间距
        stackView.spacing = 5
        
        view.addSubview(stackView)
        
        // 需要注意一点，如果stack view 设置了 frame，在设置 SnapKit 会两个都失效
        stackView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(100)
            make.right.equalToSuperview().offset(-100)
            make.centerY.equalToSuperview()
            make.height.equalTo(100)
        }
        
    }
}
