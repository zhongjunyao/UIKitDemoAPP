//
//  RadioGroup.swift
//  UIKitDemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/7/26.
//

import UIKit


class RadioGroup: UIControl {
    var items: [RadioButton] = [] {
        didSet {
            self.setupUI()
        }
    }
    
    private lazy var vStack: UIStackView = {
        let vStack = UIStackView()
        vStack.axis = .vertical
        vStack.alignment = .fill
        vStack.translatesAutoresizingMaskIntoConstraints = false
        return vStack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    func setupUI(){
        print("RadioGroup setupUI invoked")
        guard self.items.count > 0 else {
            return
        }
        
        self.items.forEach { radioButton in
            vStack.addArrangedSubview(radioButton)
        }
        addSubview(vStack)
    
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            vStack.topAnchor.constraint(equalTo: topAnchor),
            vStack.widthAnchor.constraint(equalTo: widthAnchor),
            vStack.heightAnchor.constraint(equalTo: heightAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
