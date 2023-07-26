//
//  LocalizableViewController.swift
//  UIKitDemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/6/28.
//

import UIKit

class LocalizableViewControllerV2: BaseViewController {

    private var selectedID: LanguageV2 = LanguageV2.en()
    
    private lazy var style = LocalizableViewControllerV2.StyleV2.defaultStyle
    
    private lazy var group: RadioGroupV2 = RadioGroupV2(
        items: [
            RadioButtonV2(id: LanguageV2.en()),
            RadioButtonV2(id: LanguageV2.zhCN()),
            RadioButtonV2(id: LanguageV2.zhHK())
        ],
        selectedID: self.selectedID,
        didSelectChange: self.radioGroupChange
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "国际化-iOS自带方式-2"
        
        setupUI()
    }

    func setupUI(){

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
    
    func radioGroupChange(_ sender: RadioGroupV2){
        self.selectedID = sender.selectedID!
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

