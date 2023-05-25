//
//  CommonCell.swift
//  UIKitDemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/5/22.
//

import Foundation
import UIKit
import SnapKit

class CommonCell: UIControl {
    var commonCellFlag: String?

    var title: String? {
        didSet {
            self.titleView.text = self.title
        }
    }
    
    var icon: UIImage? = UIImage(named: "icon_cal.png") {
        didSet {
            self.iconView.image = self.icon
        }
    }
    
    var titleView: UILabel
    var iconView: UIImageView
    var bottomLine: UIView
    var arrowView: UIImageView
    
    var highlightView: UIView
    
    override init(frame: CGRect) {
        titleView = UILabel()
        iconView = UIImageView(image: icon)
        bottomLine = UIView()
        arrowView = UIImageView(image: UIImage(named: "icon_right_arrow.png"))
        highlightView = UIView()
        super.init(frame: frame)
        setupViews()
        backgroundColor = .white
    }
    
    func setupViews(){
        addSubview(highlightView)
        highlightView.backgroundColor = UIColor(white: 0.9, alpha: 1)
        highlightView.isHidden = true
        highlightView.alpha = 0
        highlightView.snp.makeConstraints {make in
            make.edges.equalToSuperview()
        }
        
        addSubview(iconView)
        iconView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(32)
        }
        
        addSubview(titleView)
        titleView.textColor = UIColor.fontColor
        titleView.font = UIFont.systemFont(ofSize: 15)
        titleView.snp.makeConstraints {make in
            make.left.equalTo(iconView.snp.right).offset(10)
            make.right.equalToSuperview().offset(-40)
            make.centerY.equalToSuperview()
        }
        
        addSubview(arrowView)
        arrowView.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-20)
            make.centerY.equalToSuperview()
        }
        
        addSubview(bottomLine)
        bottomLine.backgroundColor = UIColor.hexColor(0xdddddd)
        bottomLine.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.width.equalToSuperview()
            // 设置一个像素
            make.height.equalTo(1 / UIScreen.main.scale)
        }
    }
    
    override var isHighlighted: Bool {
        didSet {
            super.isHighlighted = self.isHighlighted
            if self.isHighlighted {
                self.highlightView.alpha = 1
                self.highlightView.isHidden = false
            } else {
                UIView.animate(withDuration: 0.5, animations: {
                    self.highlightView.alpha = 0
                }, completion: { finished in
                    self.highlightView.isHidden = true
                })
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

