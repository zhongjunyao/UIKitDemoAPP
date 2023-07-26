//
//  RadioButton.swift
//  UIKitDemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/7/26.
//

import UIKit

// 参考文章： https://blog.csdn.net/qq_36924683/article/details/121894676
@MainActor class RadioButtonV2: UIControl {
    var id: LanguageV2!
    var selectedID: LanguageV2? {
        didSet {
            updateUI()
        }
    }
    
    private lazy var style = LocalizableViewControllerV2.StyleV2.defaultStyle
    
    private lazy var labelView: UILabel = {
        let labelV = UILabel()
        print("RadioButton self.id?.rawValue===>", self.id.description)
        labelV.text = self.id.desc
        labelV.textColor = style.primaryFontColor
        labelV.font = style.primaryFont
        labelV.translatesAutoresizingMaskIntoConstraints = false
        return labelV
    }()
    
    private lazy var iconView: UIImageView = {
        let iconV = UIImageView(image: UIImage(named: self.selectedID == self.id ? "radio_button_select" : "radio_button_unselect"))
        iconV.translatesAutoresizingMaskIntoConstraints = false
        return iconV
    }()

    private lazy var bottomLine: UIView = {
        let bottomLineV = UIView()
        bottomLineV.backgroundColor = UIColor.hexColor(0xdddddd)
        bottomLineV.translatesAutoresizingMaskIntoConstraints = false
        return bottomLineV
    }()
    
    private lazy var highlightView: UIView = {
        let highlightV = UIView()
        highlightV.backgroundColor = UIColor.hexColor(0xdfdfdf, alphaValue: 0.5)
        highlightV.isHidden = true
        highlightV.alpha = 0
        highlightV.translatesAutoresizingMaskIntoConstraints = false
        return highlightV
    }()
    
    override var isHighlighted: Bool {
        didSet {
            super.isHighlighted = self.isHighlighted
            if self.isHighlighted {
                self.highlightView.alpha = 1
                self.highlightView.isHidden = false
            } else {
                UIView.animate(withDuration: 0.5, animations: {
                    self.highlightView.alpha = 0
                    self.layoutIfNeeded()
                }, completion: { finished in
                    self.highlightView.isHidden = true
                })
            }
        }
    }
    
    convenience init(id: LanguageV2, selectedID: LanguageV2? = nil, callback: Selector? = nil) {
        print("RadioButton id===>", id)
        self.init(frame: .zero)
        self.id = id
        self.selectedID = selectedID
        if let cb = callback {
            addTarget(nil, action: cb, for: .touchUpInside)
        }
        
        backgroundColor = style.bgColor
        setupUI()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        print("RadioButton setupUI invoked", selectedID, id)
        addSubview(labelView)
        addSubview(iconView)
        addSubview(bottomLine)
        addSubview(highlightView)
        
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: ConstantsV2.padding),
            labelView.rightAnchor.constraint(equalTo: rightAnchor, constant: -ConstantsV2.padding),
            labelView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            iconView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -ConstantsV2.padding),
            iconView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconView.widthAnchor.constraint(equalToConstant: ConstantsV2.iconSize),
            iconView.heightAnchor.constraint(equalToConstant: ConstantsV2.iconSize),
            
            bottomLine.bottomAnchor.constraint(equalTo: bottomAnchor),
            bottomLine.widthAnchor.constraint(equalTo: widthAnchor),
            bottomLine.heightAnchor.constraint(equalToConstant: ConstantsV2.onePx),
            
            highlightView.leadingAnchor.constraint(equalTo: leadingAnchor),
            highlightView.trailingAnchor.constraint(equalTo: trailingAnchor),
            highlightView.topAnchor.constraint(equalTo: topAnchor),
            highlightView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            heightAnchor.constraint(equalToConstant: style.radioButtonHeight)
        ])
        
    }
    
    func updateUI(){
        iconView.image = UIImage(named: self.selectedID == self.id ? "radio_button_select" : "radio_button_unselect")
    }
}

extension RadioButtonV2 {
    private enum ConstantsV2 {
        static let padding = 20.0
        static let iconSize = 32.0
        static let onePx = 1 / UIScreen.main.scale
    }
}
