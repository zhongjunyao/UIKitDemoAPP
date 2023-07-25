//
//  UnorderListViewController.swift
//  UIKitDemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/7/24.
//

import UIKit

class UnorderListCell: UITableViewCell {
    static var reuseIdentifier = "UnorderListCell"
    
    var content: String? {
        didSet {
            setupViews()
        }
    }
    
    private lazy var dotView: UILabel = {
        let dot = UILabel(frame: .zero)
        dot.translatesAutoresizingMaskIntoConstraints = false
        return dot
    }()
    
    private lazy var labelView: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        contentView.addSubview(dotView)
        contentView.addSubview(labelView)
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1
        
        dotView.font = UIFont.preferredFont(forTextStyle: .body)
        dotView.attributedText = NSMutableAttributedString(string: "·", attributes: [
            .paragraphStyle: paragraphStyle
        ])
        
        labelView.numberOfLines = 0
        
        labelView.lineBreakMode = .byWordWrapping
        labelView.font = UIFont.preferredFont(forTextStyle: .body)
        labelView.attributedText = NSMutableAttributedString(string: content!, attributes: [
            .paragraphStyle: paragraphStyle
        ])
        
        
        NSLayoutConstraint.activate([
            dotView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            dotView.topAnchor.constraint(equalTo: topAnchor),
            
            
            labelView.leadingAnchor.constraint(equalTo: dotView.trailingAnchor, constant: 10),
            labelView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            labelView.topAnchor.constraint(equalTo: dotView.topAnchor),
//            labelView.bottomAnchor.constraint(equalTo: bottomAnchor),
//            labelView.centerYAnchor.constraint(equalTo: centerYAnchor),
            labelView.heightAnchor.constraint(greaterThanOrEqualToConstant: 30),
            
//            contentView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}


class UnorderListViewController: BaseViewController {
    
    var orderList: [String] = [
        "hello hello hello hello hello hello hello hellohello hello hello hellohello hello hello hello", "World", "APP"
    ]
    
    var tableView: UITableView!
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "无序列表"
        
        setupViews()
    }

    private func setupViews() {
        tableView = UITableView(frame: .zero, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
//        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 15, *) {
            tableView.sectionHeaderTopPadding = 0
        }
        tableView.tableFooterView = UIView()
        view.addSubview(tableView)
        // 自适应高度
        // 1.任意给定一个高度
//        tableView.estimatedRowHeight = 10
//        tableView.rowHeight = UITableView.automaticDimension  //重点

        // 2.创建自定义Cell并为子控件设置合适的约束.
        tableView.register(UnorderListCell.self, forCellReuseIdentifier: UnorderListCell.reuseIdentifier)
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension UnorderListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // do nothing
    }
}

extension UnorderListViewController: UITableViewDataSource {
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UnorderListCell.reuseIdentifier, for: indexPath) as? UnorderListCell else {
            fatalError("You never regist a cell class for UITableView")
        }
        
        cell.content = orderList[indexPath.row]
        
//      iOS TableView设置不可点击的两种方法:
//      1.这行代码能实现效果并保证字体颜色不变
//        cell.selectionStyle = .none;
        
//      2.但这句代码虽然能实现效果但是会改变字体颜色
//        cell.userInteractionEnabled = NO;
        
        return cell
    }

}
