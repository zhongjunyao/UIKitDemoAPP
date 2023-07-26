//
//  LineHeightViewController.swift
//  UIKitDemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/7/26.
//

import UIKit

class LineHeightViewController: BaseViewController {
    
    private var paragraphView: UILabel = {
        let labelV = UILabel()
        labelV.text = ""
        return labelV
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "设置行高"
        
        setupViews()
    }

    func setupViews(){
        
    }
}
