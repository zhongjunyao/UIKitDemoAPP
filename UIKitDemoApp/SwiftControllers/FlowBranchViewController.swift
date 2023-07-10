//
//  FlowBranchViewController.swift
//  UIKitDemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/7/10.
//

import UIKit

class FlowBranchViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "流程控制"
        
        // switch-case
        // var val = "hello"
        // let val: [String : Any] = ["hello": "wold", "hi": 11]
        // let val = 11
        let val: [String : Any]? = nil
        switch val {
        case is String:
            print("val is String")
            break;
        case is [String : Any]:
            print("val is Dictionary [String : Any]")
            break;
        default:
            print("val is other type")
            break;
        }
    }

}
