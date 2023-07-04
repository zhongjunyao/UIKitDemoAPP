//
//  BannerView.swift
//  UIKitDemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/7/4.
//

import UIKit
import SnapKit

// MARK: - 创建BannerCell相关代理
protocol BannerViewDataSource: AnyObject {
    func numberOfBanners(_ bannerView: BannerView) -> Int
    func viewForBanner(_ bannerView: BannerView, index: Int, convertView: UIView?) -> UIView
}

// MARK: - 代理回调对象
protocol BannerViewDelegate: AnyObject {
    func didSelectBanner(_ bannerView: BannerView, index: Int)
}

// MARK: - 创建BannerView
class BannerView: UIView {
    /// 创建集合容器
    var collectionView: UICollectionView
    /// 创建布局对象
    var flowLayout: UICollectionViewFlowLayout
    
    /// 页面控制器（白点）
    var pageControl: UIPageControl
    
    /// 数据源，需要注意一点避免产生循环饮用，需要使用 weak 修饰
    weak var dataSource: BannerViewDataSource! {
        didSet {
            pageControl.numberOfPages = dataSource.numberOfBanners(self)
            collectionView.reloadData()
            if isInfinite {
                // 上一个动画如果还没执行完，我们就需要等待执行完后再执行此操作
                DispatchQueue.main.async {
                    self.collectionView.setContentOffset(CGPoint(x: self.collectionView.frame.width, y: 0), animated: false)
                }
            }
        }
    }
    /// 代理对象，需要注意一点避免产生循环饮用，需要使用 weak 修饰
    weak var delegate: BannerViewDelegate?
    
    /// 自动循环播放
    var autoScrollInternal: Float = 0 {
        didSet {
            if autoScrollInternal > 0 {
                startAutoScroll()
            } else {
                stopAutoScroll()
            }
        }
    }
    /// 无限轮播
    var isInfinite: Bool = true
    /// 定时器
    var timer: Timer?
    
    /// 常量定义
    static var cellId = "bannerViewCellId"
    static var convertViewTag = 10086
    
    override init(frame: CGRect) {
        flowLayout = UICollectionViewFlowLayout()
        // 首部大小
        flowLayout.headerReferenceSize = .zero
        // 尾部大小
        flowLayout.footerReferenceSize = .zero
        // 行间距
        flowLayout.minimumLineSpacing = 0
        // 行内项间距
        flowLayout.minimumInteritemSpacing = 0
        // Section 间的 margins
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        // 滚动方向
        flowLayout.scrollDirection = .horizontal
        
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height), collectionViewLayout: flowLayout)
        pageControl = UIPageControl()
        
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        /// 背景色为白色
        collectionView.backgroundColor = .white
        /// 设置当用户滚动时，滚动视图将停止在滚动视图边界的倍数上
        collectionView.isPagingEnabled = true
        /// 不显示水平滚动指示器
        collectionView.showsHorizontalScrollIndicator = false
        /// 用于确定调整后的内容偏移的行为
        collectionView.contentInsetAdjustmentBehavior = .never
        /// 先注册元素再使用，不需要在元素复用中判定元素是否为nil
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: BannerView.cellId)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        addSubview(collectionView)
        addSubview(pageControl)
        
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        pageControl.snp.makeConstraints {make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}

extension BannerView {
    
    func startAutoScroll(){
        guard autoScrollInternal > 0 && timer == nil else {
            return
        }
        timer = Timer.scheduledTimer(timeInterval: TimeInterval(autoScrollInternal), target: self, selector: #selector(flipNext), userInfo: nil, repeats: true)
        RunLoop.current.add(timer!, forMode: .common)
    }

    func stopAutoScroll(){
        if let t = timer {
            t.invalidate()
            timer = nil
        }
    }

    @objc func flipNext(){
        guard let _ = superview, let _ = window else {
            return
        }
        
        let totalPageNumber = dataSource.numberOfBanners(self)
        guard totalPageNumber > 1 else {
            return
        }
        
        let currentPageNumber = Int(round(collectionView.contentOffset.x / collectionView.frame.width))
        
        if isInfinite {
            let nextPageNumber = currentPageNumber + 1
            collectionView.setContentOffset(CGPoint(x: collectionView.frame.width * CGFloat(nextPageNumber), y: 0), animated: true)
            if nextPageNumber >= totalPageNumber + 1 {
                pageControl.currentPage = 0
            } else {
                pageControl.currentPage = nextPageNumber - 1
            }
        } else {
            var nextPageNumber = currentPageNumber + 1
            if nextPageNumber >= totalPageNumber {
                nextPageNumber = 0
            }
            collectionView.setContentOffset(CGPoint(x: collectionView.frame.width * CGFloat(nextPageNumber), y: 0), animated: true)
            pageControl.currentPage = nextPageNumber
        }
    }
}

// MARK: - UICollectionViewDataSource
extension BannerView: UICollectionViewDataSource {
    // 定义展示的Section的个数, 类似多少行
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // 定义展示的 UICollectionViewCell 的个数，类似一行显示多少个或者显示多少列
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let pageNumber = dataSource.numberOfBanners(self)
        if isInfinite {
            if pageNumber == 1 {
                return 1
            } else {
                return pageNumber + 2
            }
        } else {
            return pageNumber
        }
    }
    
    // 定义 UICollectionView 展示的内容: UICollectionViewCell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerView.cellId, for: indexPath)
        
        var index = indexPath.row
        if isInfinite {
            let pageNumber = dataSource.numberOfBanners(self)
            if pageNumber > 1 {
                if indexPath.row == 0 {
                    index = pageNumber - 1
                } else if indexPath.row == pageNumber + 1 {
                    index = 0
                } else {
                    index = indexPath.row - 1
                }
            }
        }
        
        if let view = cell.contentView.viewWithTag(BannerView.convertViewTag) {
            let _ = dataSource.viewForBanner(self, index: index, convertView: view)
        } else {
            let newView = dataSource.viewForBanner(self, index: index, convertView: nil)
            newView.tag = BannerView.convertViewTag
            cell.contentView.addSubview(newView)
            newView.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
        }
        return cell
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout
extension BannerView: UICollectionViewDelegateFlowLayout {
    
    // 定义每个UICollectionView 的大小
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return self.bounds.size
    }
    
    // 定义每个UICollectionView 的 margin
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        let total = dataSource.numberOfBanners(self)
        let current = Int(round(collectionView.contentOffset.x / collectionView.frame.width))
        if current >= total + 1 {
            collectionView.setContentOffset(CGPoint(x: collectionView.frame.width, y: 0), animated: false)
        }
    }
}

// MARK: - UICollectionViewDelegate
extension BannerView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("BannerView.didSelectItemAt invoked, indexPath.row:", indexPath.row, ", indexPath.section", indexPath.section)
        delegate?.didSelectBanner(self, index: indexPath.row)
    }
}
