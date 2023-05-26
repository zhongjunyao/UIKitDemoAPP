//
//  UICollectionViewViewController.swift
//  UIKitDemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/5/23.
//

import UIKit

class UICollectionViewFlowLayoutViewController: BaseViewController {

    var collectionView: UICollectionView!
    lazy var dataArray: [String]! = [
        "one", "two", "three", "four", "five", "six", "seven", "eight", "night", "ten"
    ]
    var section: Int = 1
    var numberPerSection: Int = 100
    var reuseIdentifier: String = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "UICollectionViewFlowLayout-瀑布流视图"
        
        setupViews()
    }
    
    func setupViews(){
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        // 布局方向， 设置在垂直方向可扩展，默认 vertical
        layout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        // 设置元素的大小
        layout.itemSize = CGSizeMake(80, 80)
        // 设置元素间间距
        layout.minimumInteritemSpacing = 10
        // 设置元素行间距
        layout.minimumLineSpacing = 30
        // 以布局创建视图, 内容超出时默认可滚动
        collectionView = UICollectionView(frame: CGRectMake(0, 0, view.frame.width, view.frame.height - CommonUtil.getAvalableAreaInsets(self).top), collectionViewLayout: layout)
        
        view.addSubview(collectionView)
        
        // 设置代理
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // 设置 Cell step 1：注册Cell 类
//        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.register(NSClassFromString("UICollectionViewCell"), forCellWithReuseIdentifier: reuseIdentifier)
        
    }

}


extension UICollectionViewFlowLayoutViewController: UICollectionViewDataSource {
    
    // 分区数量
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return section
    }
    // 每个分区的item数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberPerSection
    }

}

extension UICollectionViewFlowLayoutViewController: UICollectionViewDelegate {
    // item被选中时，回调
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("collectionView didSelectItemAt invoked, section: ", indexPath.section,  ", row: ", indexPath.row)
        let idx = indexPath.section * numberPerSection + indexPath.row
        print("section:", indexPath.section, "row:", indexPath.row, "idx:", idx)
        if idx < dataArray.count {
            let item = dataArray[idx]
            let alertVC = UIAlertController(title: "提示", message: "您点击了项\"\(item)\"", preferredStyle: .alert)
            present(alertVC, animated: true)
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: {timer in
                alertVC.dismiss(animated: true)
                timer.invalidate()
            })
        }
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
    // 设置 Cell step 2：代理事件，设置每个item的内容
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
    
}
