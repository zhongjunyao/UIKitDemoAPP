//
//  UICollectionViewCustomLayoutViewController.swift
//  DemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/5/24.
//

import UIKit

// 自定义布局 - 实现两列布局，两列的cell的宽度相等且高度不一的瀑布流布局
// 这里采用继承 UICollectionViewFlowLayout
class CustomFlowLayout: UICollectionViewFlowLayout {
    
    // cell的数量
    var itemCount: Int?
    // 布局属性
    lazy var attributedArray: [UICollectionViewLayoutAttributes] = []
    
    // Step-1: 重写 prepare, 必须调用 super.prepare()
    override func prepare() {
        super.prepare()
        
        createCells()
    }
    
    // Step-2: 创建带有布局属性(LayoutAttributes)和索引路径(IndexPath)的cell
    // 使用 UICollectionViewLayoutAttributes(forCellWith: IndexPath)
    func createCells(){
        let Width = (UIScreen.main.bounds.size.width - minimumInteritemSpacing) / 2
        
        var l = 0
        var r = 0
        for i in 0..<itemCount! {
            let indexPath = IndexPath(item: i, section: 0)
            let attrCell = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            
            // 高度在 50 - 190 之间
            let height = Int(arc4random()%140) + 50
            // 用变量记录item放在了哪一列下
            var tmp = 0
            var H = 0
            if l<=r {
                // 将 item 放在左边一列
                H = l + Int(minimumLineSpacing)
                l = l + height + Int(minimumLineSpacing)
                tmp = 0
            } else {
                // 将 item 放在右边一列
                H = r + Int(minimumLineSpacing)
                r = r + height + Int(minimumLineSpacing)
                tmp = 1
            }
            attrCell.frame = CGRectMake(CGFloat(tmp) * (Width + minimumInteritemSpacing), CGFloat(H), Width, CGFloat(height))
            attributedArray.append(attrCell)
        }
        if l <= r {
            itemSize = CGSizeMake(Width, CGFloat((r * 2 / itemCount!)) - minimumLineSpacing)
        } else {
            itemSize = CGSizeMake(Width, CGFloat((l * 2 / itemCount!)) - minimumLineSpacing)
        }
    }
    
    // Step-3: 将创建的带有布局属性的cell，通过代理方法返回给布局使用
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return attributedArray
    }
}

// 调用自定义布局类
class UICollectionViewCustomLayoutViewController: BaseViewController {
    
    var collectionView: UICollectionView!
    lazy var dataArray: [String]! = [
        "one", "two", "three", "four", "five", "six", "seven", "eight", "night", "ten"
    ]
    var section: Int = 1
    var numberPerSection: Int = 100
    var reuseIdentifier: String = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "UICollectionView-自定义布局"
        
        setupViews()
    }
    
    func setupViews(){
        let customFlowLayout = CustomFlowLayout()
        // 布局方向， 设置在垂直方向可扩展，默认 vertical
        customFlowLayout.scrollDirection = UICollectionView.ScrollDirection.vertical
        // 设置需要布局的数量
        customFlowLayout.itemCount = numberPerSection
        // 设置元素间间距
        customFlowLayout.minimumInteritemSpacing = 10
        // 设置元素行间距
        customFlowLayout.minimumLineSpacing = 10
        // 以布局创建视图, 内容超出时默认可滚动
        collectionView = UICollectionView(frame: CGRectMake(0, 0, view.frame.width, view.frame.height - CommonUtil.getAvalableAreaInsets(self).top), collectionViewLayout: customFlowLayout)
        
        view.addSubview(collectionView)
        
        // 设置代理
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // 设置 Cell step 1：注册Cell 类
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }

}


extension UICollectionViewCustomLayoutViewController: UICollectionViewDataSource {
    
    // 分区数量
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return section
    }
    // 每个分区的item数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberPerSection
    }

}

extension UICollectionViewCustomLayoutViewController: UICollectionViewDelegateFlowLayout {
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
        cell.backgroundColor = UIColor.randomColor()
        return cell
    }
    
}
