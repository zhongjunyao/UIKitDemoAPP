//
//  UIAlertControllerViewController2.swift
//  UIKitDemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/5/22.
//

import UIKit

class UIAlertControllerViewController2: BaseViewController {

    var actionSheet: UIAlertController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "UIAlertController-警告控制器-活动列表风格"
        
        setupViews()
    }
    
    func setupViews() {
        actionSheet = UIAlertController(title: "alert", message: "look me", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "delete", style: .destructive, handler: { alertAction in
            print("delete")
        }))
        actionSheet.addAction(UIAlertAction(title: "sure", style: .default, handler: { alertAction in
            print("sure")
        }))
        actionSheet.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: { alertAction in
            print("cancel")
        }))
        
        present(actionSheet, animated: true)
    }

}
