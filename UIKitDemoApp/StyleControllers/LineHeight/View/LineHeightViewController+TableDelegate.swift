//
//  Line.swift
//  UIKitDemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/7/29.
//

import UIKit

extension LineHeightViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return numberOfTableSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellType = dataList[indexPath.section].0
        switch cellType {
        case .one:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: LineHeightOneMultipleTableCellView.reusedIdentifier, for: indexPath) as? LineHeightOneMultipleTableCellView else {
                fatalError("Please register cell class, before you use it.")
            }
            cell.content = dataList[indexPath.section].2
            return cell
        case .two:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: LineHeightTableCellView.reusedIdentifier, for: indexPath) as? LineHeightTableCellView else {
                fatalError("Please register cell class, before you use it.")
            }
            cell.content = dataList[indexPath.section].2
            return cell
        }
    }
}

extension LineHeightViewController: UITableViewDelegate {
    // 为了自适应高度，不实现这个方法
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }
    
    
    // 设置section 头的部分
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionEle = dataList[section]
        let view = LineHeightSectionHeaderView(content: sectionEle.1)
        return view
    }
    
    // 设置footer
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let sectionEle = dataList[section]
//        let view = LineHeightSectionHeaderView(content: sectionEle.1)
//        return view
//    }
}

extension LineHeightViewController {
    enum CellType {
        case one
        case two
    }
}
