//
//  UIScrollViewViewController2.swift
//  DemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/5/23.
//


import UIKit
import SnapKit

class UIScrollViewViewController2: BaseViewController {

    var scrollView: UIScrollView!
    var scrollToTopButton: UIButton!
    var rectViewLeftTop: UIView!
    var rectViewLeftBottom: UIView!
    var rectViewRightTop: UIView!
    var rectViewRightBottom: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "UIScrollView-滚动视图代理事件"
        
        setupViews()
    }
    
    func setupViews() {
        scrollView = UIScrollView(frame: view.frame)
        
        // 添加scrollView到视图
        view.addSubview(scrollView)
        
        rectViewLeftTop = UIView(frame: CGRectMake(100, 0, 100, 100))
        rectViewLeftTop.backgroundColor = .blue
        scrollView.addSubview(rectViewLeftTop)
        
        rectViewLeftBottom = UIView(frame: CGRectMake(100, view.frame.height + 100, 100, 100))
        rectViewLeftBottom.backgroundColor = .red
        scrollView.addSubview(rectViewLeftBottom)
        
        rectViewRightTop = UIView(frame: CGRectMake(view.frame.width + 100, 0, 100, 100))
        rectViewRightTop.backgroundColor = .yellow
        scrollView.addSubview(rectViewRightTop)
        
        rectViewRightBottom = UIView(frame: CGRectMake(view.frame.width + 100, view.frame.height + 100, 100, 100))
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
        scrollToTopButton.isHidden = scrollView.contentOffset.y <= view.frame.height / 2
        // 添加事件，滚动回顶部
        scrollToTopButton.addTarget(self, action: #selector(didScrollToTopClicked(_:)), for: .touchUpInside)
        // 添加scrollToTop到视图
        view.addSubview(scrollToTopButton)
        scrollToTopButton.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(-50)
            make.width.height.equalTo(50)
        }
        
        // MARK: - 代理事件修改代码
        // 设置拉伸和缩放的比值
        scrollView.minimumZoomScale = 0.5
        scrollView.maximumZoomScale = 50
        
        // 缩放回弹效果, default is true
        scrollView.bounces = true
        
        // 滚动到顶部，default is true, 当点击状态栏时会回到顶部
        scrollView.scrollsToTop = true
        
        // 设置代理
        scrollView.delegate = self
    }

    @objc func didScrollToTopClicked(_ sender: UIImageView) {
        print(scrollView.contentOffset.x, view.frame.width)
        let x = scrollView.contentOffset.x >= view.frame.width ? view.frame.width : 0
        // 动画方式滚动到顶部，需要width和height不为0
//        scrollView.scrollRectToVisible(CGRectMake(x, 0, 10, 10), animated: true)
        scrollView.setContentOffset(CGPoint(x: x, y: 0), animated: true)
    }
    
    
}

// MARK: - 代理事件修改代码
extension UIScrollViewViewController2: UIScrollViewDelegate {
    // MARK: - 缩放代理事件
    // 缩放将开始，回调
    func scrollViewWillBeginZooming(_ scrollView: UIScrollView, with view: UIView?) {
        print("scrollViewWillBeginZooming invoked")
    }
    // 缩放已结束，回调
    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        print("scrollViewDidEndZooming invoked", scale)
    }

    // 返回需要缩放的view， 进行缩放之后，滚动的范围将根据缩放的view 的大小进行，view超过界面才会滚动
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        print("viewForZooming invoked")
        return rectViewLeftTop
    }

    // 任何缩放change，回调，viewForZooming 中有view 返回作为缩放对象，此时会回调下面这个函数
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        print("scrollViewDidZoom invoked")
    }
    
    // MARK: - 拖拽代理事件
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        print("scrollViewWillBeginDragging invoked")
    }
    
    // scrollView 将要停止拖拽的时候触发的代理方法
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        print("scrollViewWillEndDragging invoked")
    }
    
    // scrollView 停止拖拽的时候触发的代理方法
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        print("scrollViewDidEndDragging invoked")
    }
    
    // MARK: - 滚动代理方法
    // scrollView 停止动画的时候触发的代理方法
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        print("scrollViewDidEndScrollingAnimation invoked")
    }
    
    // scrollView 将要滑动到顶部时触发的方法
    func scrollViewShouldScrollToTop(_ scrollView: UIScrollView) -> Bool {
        print("scrollViewShouldScrollToTop invoked")
        // 设置了 scrollView.scrollsToTop = true
        // 返回false，拦截状态栏的点击并且不滚动到顶部
        return false
    }
    
    // scrollView 滑动到顶部时触发的方法
    func scrollViewDidScrollToTop(_ scrollView: UIScrollView) {
        print("scrollViewDidScrollToTop invoked")
    }
    
    // scrollView 内容滚动时调用
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("scrollViewDidScroll invoked")
        scrollToTopButton.isHidden = scrollView.contentOffset.y <= view.frame.height / 2
    }
    
    // MARK: - 减速回调事件
    // scrollView 将要减速结束时，回调
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        print("scrollViewWillBeginDecelerating invoked")
    }
    // scrollView 减速结束时，回调
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print("scrollViewDidEndDecelerating invoked")
        
//        viewForZooming invoked
//        viewForZooming invoked
//        scrollViewWillBeginZooming invoked
//        scrollViewDidZoom invoked
//        scrollViewDidZoom invoked
//        scrollViewDidZoom invoked
//        scrollViewDidEndZooming invoked 10.245701228902423
//        scrollViewDidEndDecelerating invoked
//        scrollViewDidEndDecelerating invoked
    }
}
