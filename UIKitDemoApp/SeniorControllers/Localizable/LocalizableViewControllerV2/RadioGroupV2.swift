//
//  RadioGroup.swift
//  UIKitDemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/7/26.
//

import UIKit


class RadioGroupV2: UIControl {
    var items: [RadioButtonV2] = [] {
        didSet {
            setupUI()
        }
    }
    
    var selectedID: LanguageV2? {
        didSet {
            updateUI()
        }
    }
    
    var didSelectChange: ((RadioGroupV2)->Void)?
    
    private lazy var vStack: UIStackView = {
        let vStack = UIStackView()
        vStack.axis = .vertical
        vStack.alignment = .fill
        vStack.translatesAutoresizingMaskIntoConstraints = false
        return vStack
    }()
    
    convenience init(items: [RadioButtonV2], selectedID: LanguageV2? = nil, didSelectChange: ((RadioGroupV2)->Void)? = nil){
        self.init(frame: .zero)
        self.items = items
        if selectedID == nil, let first = items.first {
            self.selectedID = first.id
        } else {
            self.selectedID = selectedID
        }
        self.didSelectChange = didSelectChange
        
        setupUI()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        print("RadioGroup setupUI invoked===>", self.selectedID)
        guard self.items.count > 0 else {
            return
        }
        
        self.items.forEach { radioButton in
            radioButton.selectedID = self.selectedID
            radioButton.addTarget(self, action: #selector(radioButtonClicked(_:)), for: .touchUpInside)
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
    
    func updateUI(){
        self.items.forEach { radioButton in
            radioButton.selectedID = self.selectedID
        }
    }
    
    @objc func radioButtonClicked(_ sender: RadioButtonV2){
        self.selectedID = sender.id
        print("radioButtonClicked invoked", selectedID)
        self.didSelectChange?(self)
    }
}
