//
//  Table+Extension.swift
//  UIKitDemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/7/29.
//

import UIKit

extension UITableView {
    static func make(frame: CGRect = .zero, style: UITableView.Style = .plain) -> UITableView {
        // 风格：grouped(分组)、insetGrouped(插入分组)、plain(普通)
        let tableV = UITableView(frame: frame, style: style)
        if #available(iOS 15, *) {
            tableV.sectionHeaderTopPadding = 0
            // 参考：https://juejin.cn/post/6998783472043032613
        }
        // 去掉默认的分割线
        tableV.separatorStyle = .none
        tableV.translatesAutoresizingMaskIntoConstraints = false
        return tableV
    }
    
}
