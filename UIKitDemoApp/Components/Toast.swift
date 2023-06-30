//
//  AlertMessage.swift
//  UIKitDemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/6/30.
//

import Foundation

class Toast {
    
    var alertVC: UIAlertController!
    
    init(title: String, message: String) {
        self.alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
    }
    
    func show(in vc: UIViewController, wait seconds: Double = 0.5, auto hide: Bool? = true){
        vc.present(self.alertVC, animated: true, completion: hide! ? {
            Timer.scheduledTimer(withTimeInterval: seconds, repeats: false, block: {timer in
                self.alertVC.dismiss(animated: true)
                timer.invalidate()
            })
        } : nil)
    }
    
}
