//
//  UITableViewViewController.swift
//  UIKitDemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/5/23.
//

import UIKit
import SnapKit

class UITableViewPlainViewController: BaseViewController {

    var tableView: UITableView!
    lazy var dataArray: [String]! = [
        "one", "two", "three", "four", "five", "six", "seven", "eight", "night", "ten",
        "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen", "twenty"
    ]
    
    var reuseIdentifier: String = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "UITableView-表格视图-普通风格"
        
        setupViews()
    }
    
    func setupViews(){
        // 风格：grouped(分组)、insetGrouped(插入分组)、plain(普通)
        tableView = UITableView(frame: .zero, style: .plain)
        tableView.tableFooterView = UIView()
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

extension UITableViewPlainViewController: UITableViewDataSource, UITableViewDelegate {
    
    // 设置分区时，回调获取分区的数量. Default is 1 if not implemented
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // 设置一个分区有多少行
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }

    // 当展示行时，回调返回cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: reuseIdentifier)
        }
        // indexPath.section 区, indexPath.row 行
        cell?.textLabel?.text = dataArray[indexPath.row]
        cell?.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
        return cell!
    }
    
    // 当点击行时，回调
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = dataArray[indexPath.row]
        let alertVC = UIAlertController(title: "提示", message: "您点击了项\"\(item)\"", preferredStyle: .alert)
        present(alertVC, animated: true)
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: {timer in
            alertVC.dismiss(animated: true)
            timer.invalidate()
        })
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
