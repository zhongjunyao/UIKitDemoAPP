//
//  UIScrollViewViewController.swift
//  DemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/5/23.
//

import UIKit
import SnapKit

class UIScrollViewViewController: BaseViewController {

    var scrollView: UIScrollView!
    var scrollToTopButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "UIScrollView-滚动视图控件属性"
        
        setupViews()
    }
    
    func setupViews() {
        scrollView = UIScrollView(frame: view.frame)
        
        // 添加scrollView到视图
        view.addSubview(scrollView)
        
        let rectViewLeftTop = UIView(frame: CGRectMake(100, 0, 100, 100))
        rectViewLeftTop.backgroundColor = .blue
        scrollView.addSubview(rectViewLeftTop)
        
        let rectViewLeftBottom = UIView(frame: CGRectMake(100, view.frame.height + 100, 100, 100))
        rectViewLeftBottom.backgroundColor = .red
        scrollView.addSubview(rectViewLeftBottom)
        
        let rectViewRightTop = UIView(frame: CGRectMake(view.frame.width + 100, 0, 100, 100))
        rectViewRightTop.backgroundColor = .yellow
        scrollView.addSubview(rectViewRightTop)
        
        let rectViewRightBottom = UIView(frame: CGRectMake(view.frame.width + 100, view.frame.height + 100, 100, 100))
        rectViewRightBottom.backgroundColor = .green
        scrollView.addSubview(rectViewRightBottom)

        // 设置可滚动，且需要响应用户的交互事件(触摸，滑动等)，
        // 并需要让内容大小的 宽度/高度 大于 scroll view 的 frame.width/frame.height
        scrollView.isScrollEnabled = true // default is true
        scrollView.isUserInteractionEnabled = true // default is true
        scrollView.contentSize = CGSizeMake(view.frame.width * 2, view.frame.height * 2)

        // 滚动到底部
        scrollView.contentOffset =  CGPoint(x: 0, y: view.frame.height * 2)
        
        // 设置回弹效果，default is true，有回弹
        scrollView.bounces = false
        
        // 设置指示条的位置
//        scrollView.scrollIndicatorInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        scrollView.horizontalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        // 设置指示条显示
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = true
        // 设置滚动方向锁，true 在水平和垂直只有一个可滚动，默认 false, 不锁住
//        scrollView.isDirectionalLockEnabled = false
        // 设置是否翻页效果， 只要水平和垂直的内容大小是 frame.height 的倍数，就有翻页效果, default is false
        scrollView.isPagingEnabled = true
        
        // 置顶按钮
        scrollToTopButton = UIButton(type: .custom)
        scrollToTopButton.setBackgroundImage(UIImage(named: "scrollToTop"), for: .normal)
        scrollToTopButton.setBackgroundImage(UIImage(named: "scrollToTopHighlighted"), for: .highlighted)
        // 添加事件，滚动回顶部
        scrollToTopButton.addTarget(self, action: #selector(didScrollToTopClicked(_:)), for: .touchUpInside)
        // 添加scrollToTop到视图
        view.addSubview(scrollToTopButton)
        scrollToTopButton.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(-50)
            make.width.height.equalTo(50)
        }
    }

    @objc func didScrollToTopClicked(_ sender: UIImageView) {
        print(scrollView.contentOffset.x, view.frame.width)
        let x = scrollView.contentOffset.x >= view.frame.width ? view.frame.width : 0
        // 动画方式滚动到顶部，需要width和height不为0
//        scrollView.scrollRectToVisible(CGRectMake(x, 0, 10, 10), animated: true)
        scrollView.setContentOffset(CGPoint(x: x, y: 0), animated: true)
    }
}
