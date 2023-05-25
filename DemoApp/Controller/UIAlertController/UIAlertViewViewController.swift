//
//  UIAlertViewViewController.swift
//  DemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/5/22.
//

import UIKit

class UIAlertViewViewController: BaseViewController {
    
    var alertView: UIAlertView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "UIAlertView-警告框"
        
        setupViews()
    }
    
    func setupViews() {
        alertView = UIAlertView(title: "alert", message: "look me", delegate: self, cancelButtonTitle: "cancel", otherButtonTitles: "sure", "oters")
        // alertView 的风格
        alertView.alertViewStyle = .loginAndPasswordInput
        alertView.show()
    }
}

extension UIAlertViewViewController: UIAlertViewDelegate {
    
    func alertView(_ alertView: UIAlertView, clickedButtonAt buttonIndex: Int) {
        print("alertView clickedButtonAt invoked, buttonIndex==>", buttonIndex)
    }
}
