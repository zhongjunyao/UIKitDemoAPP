//
//  AlertMessage.swift
//  UIKitDemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/6/30.
//

import Foundation

class AlertMessage {
    
    var alertVC: UIAlertController!
    
    init(title: String, message: String) {
        self.alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
    }
    
    func show(in vc: UIViewController){
        vc.present(self.alertVC, animated: true, completion: {
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: {timer in
                self.alertVC.dismiss(animated: true)
                timer.invalidate()
            })
        })
    }
    
}
