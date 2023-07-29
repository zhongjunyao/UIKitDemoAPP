//
//  LineHeightViewController.swift
//  UIKitDemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/7/26.
//

import UIKit

class LineHeightViewController: BaseViewController {
    lazy var style = LineHeightViewController.Style.defaultStyle
    
    lazy var content: String = "Swift 包含类型推断、可选类型和闭包等现代化特性，语法简明扼要，却又表现力强。Swift 确保你的代码快速且高效，而它的内存安全性和原生错误处理让这种语言从设计上保证安全。在 Swift Playgrounds、Xcode 的 Playground 和 REPL 中编写 Swift 代码的过程充满了乐趣和互动。"
    
    lazy var dataList: [(CellType, String, String)] = [
        (CellType.one, "无行高", content),
        (CellType.two, "有行高", content)
    ]

    private lazy var tableView: UITableView = {
        let tableV = UITableView.make()
        tableV.tableFooterView = UIView() // 目的是为了去除 plain 格式下，后面多出来的空行
        
        
        // 预先注册cell
        tableV.register(LineHeightOneMultipleTableCellView.self, forCellReuseIdentifier: LineHeightOneMultipleTableCellView.reusedIdentifier)
        tableV.register(LineHeightTableCellView.self, forCellReuseIdentifier: LineHeightTableCellView.reusedIdentifier)
        // 设置代理对象
        tableV.dataSource = self
        tableV.delegate = self
        return tableV
    }()
    
    var numberOfTableSections: Int {
        dataList.count
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "兼容AOS的行高方案"
        
        setupViews()
    }

    func setupViews(){
        view.addSubview(tableView)
     
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}


