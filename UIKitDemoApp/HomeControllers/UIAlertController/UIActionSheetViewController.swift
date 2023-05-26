//
//  UIActionSheetViewController.swift
//  UIKitDemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/5/23.
//

import UIKit

class UIActionSheetViewController: BaseViewController {
    
    var actionSheet: UIActionSheet!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "UIActionSheet-活动列表"
        
        setupViews()
    }
    
    func setupViews() {
        actionSheet = UIActionSheet(title: "action sheet", delegate: self, cancelButtonTitle: "cancel", destructiveButtonTitle: "delete", otherButtonTitles: "one", "two")

        actionSheet.show(in: view)
    }
    
}

extension UIActionSheetViewController: UIActionSheetDelegate {
    
    func actionSheet(_ actionSheet: UIActionSheet, clickedButtonAt buttonIndex: Int) {
        print("actionSheet clickedButtonAt invoked, buttonIndex==>", buttonIndex)
        
//        actionSheet clickedButtonAt invoked, buttonIndex==> 1 // cancel
//        actionSheet clickedButtonAt invoked, buttonIndex==> 3 // two
//        actionSheet clickedButtonAt invoked, buttonIndex==> 2 // one
//        actionSheet clickedButtonAt invoked, buttonIndex==> 0 // delete
    }
}
