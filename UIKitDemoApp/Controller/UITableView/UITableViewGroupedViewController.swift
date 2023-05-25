//
//  UITableViewGroupedViewController.swift
//  UIKitDemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/5/23.
//

import UIKit
import SnapKit

class UITableViewGroupedViewController: BaseViewController {

    var tableView: UITableView!
    lazy var dataArray: [String]! = [
        "one", "two", "three", "four", "five", "six", "seven", "eight", "night", "ten",
        "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen", "twenty"
    ]
    
    var reuseIdentifier: String = "cellId"
    var section: Int = 2
    var numberPerSection: Int = 15
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "UITableView-表格视图-分组风格"
        
        setupViews()
    }
    
    func setupViews(){
        // 风格：grouped(分组)、insetGrouped(插入分组)、plain(普通)
        tableView = UITableView(frame: .zero, style: .grouped)
        
        // 数据源和代理
        tableView.dataSource = self
        tableView.delegate = self
        
        // 添加到视图
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension UITableViewGroupedViewController: UITableViewDataSource, UITableViewDelegate {
    
    // 设置分区时，回调获取分区的数量. Default is 1 if not implemented
    func numberOfSections(in tableView: UITableView) -> Int {
        return section
    }
    
    // 设置一个分区有多少行
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberPerSection
    }

    // 当展示行时，回调返回cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: reuseIdentifier)
        }
        // indexPath.section 区, indexPath.row 行
        let idx = indexPath.section * numberPerSection + indexPath.row
        if idx < dataArray.count {
            cell?.textLabel?.text = dataArray[idx]
        } else {
            cell?.textLabel?.text = ""
        }
        cell?.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
        return cell!
    }
    
    // 当点击行时，回调
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let idx = indexPath.section * numberPerSection + indexPath.row
        if idx < dataArray.count {
            let item = dataArray[idx]
            let alertVC = UIAlertController(title: "提示", message: "您点击了项\"\(item)\"", preferredStyle: .alert)
            present(alertVC, animated: true)
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: {timer in
                alertVC.dismiss(animated: true)
                timer.invalidate()
            })
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
