//
//  LaunchViewController.swift
//  UIKitDemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/6/25.
//

import UIKit
import SnapKit

class LaunchViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
    }
    
    //隐藏状态栏
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func configUI(){
        let landing = UIImageView(image: UIImage(named: "landing"))
        landing.contentMode = .scaleAspectFill
        self.view.addSubview(landing)
        landing.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
