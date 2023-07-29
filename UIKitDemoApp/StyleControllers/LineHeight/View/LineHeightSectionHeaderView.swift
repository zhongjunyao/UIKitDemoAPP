//
//  LineHeightSectionHeaderView.swift
//  UIKitDemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/7/29.
//

import UIKit

class LineHeightSectionHeaderView: UIView {
    
    var content: String = "" {
        didSet {
            updateViews()
        }
    }
    
    private lazy var paragraphView: UILabel = UILabel.make(text: content, textFont: style.textFont, lineHeightMultiple: style.lineHeightMultiple)
    
    private lazy var style = LineHeightViewController.Style(lineHeightMultiple: 1)
    
    convenience init(content: String = "") {
        self.init(frame: .zero)
        self.content = content
        setupViews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(paragraphView)
        
        backgroundColor = .lightGray
        
        // 单个约束可以这样写
        // titleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: style.padding).isActive = ture
        // 多个约束：
        NSLayoutConstraint.activate([
            paragraphView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: style.padding),
            paragraphView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -style.padding),
            paragraphView.topAnchor.constraint(equalTo: topAnchor, constant: style.smallPadding),
            paragraphView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -style.smallPadding),
            paragraphView.heightAnchor.constraint(greaterThanOrEqualToConstant: 10)
        ])
    }

    private func updateViews() {
        paragraphView.removeFromSuperview()
        
        print("content===>", content)
        
        paragraphView = UILabel.make(text: content, textFont: style.textFont, lineHeightMultiple: style.lineHeightMultiple)
        setupViews()
    }
}
