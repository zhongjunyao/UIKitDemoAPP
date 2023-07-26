//
//  LocalizableViewController.swift
//  UIKitDemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/6/28.
//

import UIKit

class LocalizableViewController: BaseViewController {

    var selectedID: Language = Language.en() {
        didSet {
            setupUI()
        }
    }
    
    private lazy var style = LocalizableViewController.Style.defaultStyle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "国际化-iOS自带方式"
        
        setupUI()
    }

    func setupUI(){
        let radioBtnSelector = #selector(radioButtonCallBack(_:))
        let radioBtn3 = RadioButton()
        radioBtn3.id = Language.zhHK()
        radioBtn3.selectedID = self.selectedID
        radioBtn3.addTarget(self, action: radioBtnSelector, for: .touchUpInside)
        radioBtn3.backgroundColor = style.bgColor
        let group = RadioGroup()
        group.items = [
            RadioButton(id: Language.en(), selectedID: self.selectedID, callback: radioBtnSelector),
            RadioButton(id: Language.zhCN(), selectedID: self.selectedID, callback: radioBtnSelector),
            radioBtn3
        ]
        self.view.addSubview(group)
//        view.addSubview(radioBtn3)
        NSLayoutConstraint.activate([
//            radioBtn3.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            radioBtn3.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            radioBtn3.heightAnchor.constraint(equalToConstant: style.radioButtonHeight),
            
            group.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            group.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    @objc func radioButtonCallBack(_ sender: RadioButton){
        self.selectedID = sender.id!
        print("radioButtonCallBack invoked", selectedID)
        // 更新视图
//        view.setNeedsLayout()
//        setNeedsLayout: 标记为需要重新布局，不立即刷新，但layoutSubviews一定会被调用
//        配合layoutIfNeeded立即更新
//        view.layoutIfNeeded()
//       layoutIfNeeded: 如果，有需要刷新的标记，立即调用layoutSubviews进行布局
    }
    
    override func viewWillLayoutSubviews() {
        print("viewWillLayoutSubviews invoked")
    }
    override func viewDidLayoutSubviews() {
        print("viewDidLayoutSubviews invoked")
    }
}

