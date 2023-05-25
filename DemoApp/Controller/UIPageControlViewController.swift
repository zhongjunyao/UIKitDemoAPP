//
//  UIPageControlViewController.swift
//  DemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/5/22.
//

import UIKit
import SnapKit

class UIPageControlViewController: BaseViewController {
    
    var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "UIPageControl-分页控制器"
        
        setupViews()
    }
    
    func setupViews() {
        pageControl = UIPageControl(frame: .zero)
        // 分页控制器的页数
        pageControl.numberOfPages = 6
        // 设置当前的页码， 0开始
        pageControl.currentPage = 0
        // 只有一页时隐藏
        pageControl.hidesForSinglePage = true
        // 未选中的点颜色
        pageControl.pageIndicatorTintColor = UIColor.fontFourthColor
        // 选中的点颜色
        pageControl.currentPageIndicatorTintColor = UIColor.fontSecondaryColor
        // 设置事件
        pageControl.addTarget(self, action: #selector(willPageChange(_:)), for: .touchUpInside)
    
        // 添加到页面，设置约束
        view.addSubview(pageControl)
        pageControl.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(20)
            make.height.equalTo(100)
        }
    }
    
    // 即将修改时，回调
    @objc func willPageChange(_ sender: UIPageControl){
        print("current page ==>", pageControl.currentPage)
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { timer in
            print("current page in timer ==>", self.pageControl.currentPage)
            timer.invalidate()
        })
    }
}
