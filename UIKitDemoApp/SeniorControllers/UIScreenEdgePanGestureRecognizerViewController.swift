//
//  UIScreenEdgePanGestureRecognizer.swift
//  UIKitDemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/5/27.
//

import UIKit

class UIScreenEdgePanGestureRecognizerViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "页面添加侧滑手势"
        
        setupGestures()
    }
    
    func setupGestures(){
        // 添加侧滑手势
        let pan = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(slide(leftSide:)))
        pan.edges = .left
        view.addGestureRecognizer(pan)
    }
    
    ///手势左边侧滑关闭UI
    @objc func slide(leftSide: UIPanGestureRecognizer){
        navigationController?.popViewController(animated: true)
    }
}
