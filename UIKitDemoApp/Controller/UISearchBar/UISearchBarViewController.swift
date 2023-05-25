//
//  UISearchBarViewController.swift
//  UIKitDemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/5/22.
//

import UIKit
import SnapKit

class UISearchBarViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "UISearchBar-搜索框控件属性"
        
        let searchBar = UISearchBar()
        // 默认提示语
        searchBar.placeholder = "请输入关键字"
        // 显示的默认文字，就是输入框的内容
        // searchBar.text = "剑圣"
        // 搜索框的风格
        searchBar.barStyle = .default
        // 边框
//        searchBar.layer.borderWidth = 5
//        searchBar.layer.borderColor = UIColor.red.cgColor
        // 搜索框背景文字
        searchBar.prompt = "背景"
        // 相应功能按钮的显示与否
//        searchBar.showsBookmarkButton = true
        searchBar.showsCancelButton = true
        searchBar.showsSearchResultsButton = true
        // 字体、颜色
        searchBar.searchTextField.textColor = .green
        searchBar.searchTextField.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        // 渲染的游标颜色
        searchBar.tintColor = .red
        // 搜索栏的背景色
//        searchBar.barTintColor = .white
        
        // 搜索框的附件视图
        searchBar.scopeButtonTitles = ["1", "2", "3", "4"]
        // 显示附件视图
        searchBar.showsScopeBar = true
        
        // 添加到视图并设置位置，尺寸
        view.addSubview(searchBar)
        searchBar.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
//            make.height.equalTo(200)
        }
    }

}
