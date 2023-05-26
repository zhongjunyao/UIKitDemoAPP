//
//  UITableViewHeaderAndFooterViewController.swift
//  UIKitDemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/5/23.
//

import UIKit
import SnapKit

class UITableViewHeaderAndFooterViewController: BaseViewController {

    var tableView: UITableView!
    lazy var dataArray: [String]! = [
        "one", "two", "three", "four", "five", "six", "seven", "eight", "night", "ten",
        "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen", "twenty"
    ]
    
    var reuseIdentifier: String = "cellId"
    var section: Int = 4
    var numberPerSection: Int = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "UITableView-表格视图-头部尾部其他"
        
        setupViews()
    }
    
    func setupViews(){
        // 风格：grouped(分组)、insetGrouped(插入分组)、plain(普通)
        tableView = UITableView(frame: .zero, style: .grouped)
        
        // 可以通过字段直接设置table 的 header and footer，与section 的header and footer 是不一样的功能
        tableView.tableHeaderView = UIView(frame: CGRectMake(0, 0, 100, 20))
        tableView.tableHeaderView?.backgroundColor = .orange
        
        tableView.tableFooterView = UIView(frame: CGRectMake(0, 0, 100, 20))
        tableView.tableFooterView?.backgroundColor = .orange
        
        // 设置回弹效果
//        tableView.bounces = false
        
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

extension UITableViewHeaderAndFooterViewController: UITableViewDataSource, UITableViewDelegate {
    
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
        // 设置选项点击的风格
//        cell?.selectionStyle = .none
        
        return cell!
    }
    
    // 设置行的高度，默认是44
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    // 设置头视图的高度
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
    // 设置尾视图的高度
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 100
    }
    
    // 设置头视图
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        // 无论宽度设置为多少，最后都会占满整行
        let headerView = UIView(frame: CGRectMake(0, 0, 100, 100))
        headerView.backgroundColor = .red
        
        return headerView
    }
    // 设置尾视图
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        // 无论宽度设置为多少，最后都会占满整行
        let footerView = UIView(frame: CGRectMake(0, 0, 100, 100))
        footerView.backgroundColor = .blue
        
        return footerView
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
    
    // 当取消选中行时，回调
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print("tableView didDeselectRowAt invoked")
    }
    
    // 在行变成选中状态前，回调
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        print("tableView willSelectRowAt invoked,", "section:", indexPath.section, "row:", indexPath.row)
        return indexPath
    }
}
        
