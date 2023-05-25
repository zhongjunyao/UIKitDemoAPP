//
//  UIAlertControllerViewController.swift
//  DemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/5/22.
//

import UIKit

class UIAlertControllerViewController: BaseViewController {

    var alert: UIAlertController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "UIAlertController-警告控制器-警告框风格"
        
        setupViews()
    }
    
    func setupViews() {
        alert = UIAlertController(title: "alert", message: "look me", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "cancel", style: .destructive, handler: { alertAction in
            print("cancel")
//            self.alert.textFields?[0].text = ""
//            self.alert.textFields?[1].text = ""
        }))
        alert.addAction(UIAlertAction(title: "sure", style: .default, handler: { alertAction in
            print("sure")
            print("username:", self.alert.textFields?[0].text ?? "")
            print("pasword:", self.alert.textFields?[1].text ?? "")
        }))
        alert.addAction(UIAlertAction(title: "other", style: .cancel, handler: { alertAction in
            print("other")
        }))
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Please input username"
        })
        
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Please input password"
            textField.isSecureTextEntry = true
        })
        
        present(alert, animated: true)
    }

}
