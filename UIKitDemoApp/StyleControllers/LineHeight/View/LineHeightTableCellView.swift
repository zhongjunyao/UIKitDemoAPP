//
//  LineHeightViewTableCellView.swift
//  UIKitDemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/7/29.
//

import UIKit

class LineHeightTableCellView: UITableViewCell {
    static var reusedIdentifier: String {
        String(describing: self)
    }
    
    var content: String = "" {
        didSet {
            updateViews()
        }
    }
    
    private lazy var paragraphView: UILabel = {
        print("style.lineHeightMultiple===>", style.lineHeightMultiple)
        return UILabel.make(text: content, textFont: style.textFont, lineHeightMultiple: style.lineHeightMultiple)
    }()
    private lazy var style = LineHeightViewController.Style.defaultStyle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(paragraphView)
        
        // 单个约束可以这样写
        // titleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: style.padding).isActive = ture
        // 多个约束：
        NSLayoutConstraint.activate([
            paragraphView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: style.padding),
            paragraphView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -style.padding),
            paragraphView.topAnchor.constraint(equalTo: topAnchor, constant: style.padding),
            paragraphView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -style.padding)
        ])
    }

    private func updateViews() {
        paragraphView.removeFromSuperview()
        
        print("content===>", content)
        
        paragraphView = UILabel.make(text: content, textFont: style.textFont, lineHeightMultiple: style.lineHeightMultiple)
        setupViews()
    }
}
