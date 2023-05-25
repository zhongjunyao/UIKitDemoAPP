//
//  UISearchBarViewController2.swift
//  DemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/5/22.
//

import UIKit
import SnapKit

class UISearchBarViewController2: BaseViewController, UISearchBarDelegate {
    var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "UISearchBar-搜索框控件代理事件"
        
        searchBar = UISearchBar()
        // 默认提示语
        searchBar.placeholder = "请输入关键字"
        // 搜索框的风格
        searchBar.barStyle = .default
        // 搜索框背景文字
        searchBar.prompt = "背景"
        // 相应功能按钮的显示与否
//        searchBar.showsBookmarkButton = true
        searchBar.showsCancelButton = true
        searchBar.showsSearchResultsButton = true
        
        // 搜索框的附件视图
        searchBar.scopeButtonTitles = ["1", "2", "3", "4"]
        // 显示附件视图
        searchBar.showsScopeBar = true
        
        // 添加到视图并设置位置，尺寸
        view.addSubview(searchBar)
        searchBar.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
        }
        // 设置searchBar代理
        searchBar.delegate = self
    }
    
    // 不想搜索时收回软键盘的代理事件， 触发当前界面时，退出其他控件的响应
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        searchBar.resignFirstResponder()
    }
    
    // 点击附加控件时，回调
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        print("selectedScope==>\(selectedScope)")
//        selectedScope==>1
//        selectedScope==>2
    }
    
    // 文本将要改变时，回调
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        print("shouldChangeTextIn==>\(range.location), replacementText===>\(text)")
//        shouldChangeTextIn==>0, replacementText===>H
//        shouldChangeTextIn==>1, replacementText===>e
//        shouldChangeTextIn==>2, replacementText===>l
//        shouldChangeTextIn==>3, replacementText===>l
//        shouldChangeTextIn==>4, replacementText===>o
        return true // return false to not change text
    }
    
    // 文本已经改变时，回调
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("searchText===>\(searchText)")
//        searchText===>H
//        searchText===>He
//        searchText===>Hel
//        searchText===>Hell
//        searchText===>Hello
    }
    
    // 点击图书按钮时，回调
    func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
        print("bookmark button clicked")
//        bookmark button clicked
    }
    
    // 点击取消按钮时，回调
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print("cancel button clicked")
//        cancel button clicked
    }
    
    // 点击结果列表按钮时，回调
    func searchBarResultsListButtonClicked(_ searchBar: UISearchBar) {
        print("result list button clicked")
//        result list button clicked
    }
    
    // 点击搜索按钮时，回调
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("search button clicked")
//        search button clicked
    }
    
    // 将要进入编辑时，回调
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        print("will be starting editing")
//        will be starting editing
        return true // return false to not become first responder
    }
    
    // 将要结束编辑时，回调
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        print("will be finishing editing")
//        will be finishing editing
        return true // return false to not resign first responder
    }
    
    // 已经进入编辑时，回调
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        print("have started editing")
//        have started editing
    }
    
    // 已经结束编辑时，回调
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print("have finished editing")
//        have finished editing
    }
}
