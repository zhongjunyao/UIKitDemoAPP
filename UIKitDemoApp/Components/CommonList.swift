//
//  CommonList.swift
//  iOS-Viper-Study
//
//  Created by ROBIN.J.Y.ZHONG on 2023/5/21.
//

import UIKit
import SnapKit

class CommonListCell<CommonListItem>: UITableViewCell {
    var item: CommonListItem?
    
    required override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

protocol CommonListDelegate: AnyObject {
    func didSelectItem<CommonListItem>(item: CommonListItem)
}

class CommonList<CommonListItem, Cell: CommonListCell<CommonListItem>>: UIView, UITableViewDataSource, UITableViewDelegate {
    var tableView: UITableView!
    var items: [CommonListItem]! = [] {
        didSet {
            print("data==>reload, \(items.count)")
            // 用这个刷新，当前屏幕上有多少个cell就会调cellforrow多少次
            
            self.tableView.reloadData()
        }
    }
    weak var delegate: CommonListDelegate?
    
    var reuseIdentifier: String = "commonListCellId"
    var heightForRowAt: CGFloat = 120
    
    
    // MARK: - UIView
    override init(frame: CGRect) {
        super.init(frame: frame)
        tableView = UITableView(frame: .zero, style: .plain)
        setupViews()
    }
    
    func setupViews(){
        tableView.dataSource = self
        tableView.delegate = self
        addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UITableViewDataSource, UITableViewDelegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) as? Cell
        if cell == nil {
            cell = Cell(style: .subtitle, reuseIdentifier: reuseIdentifier)
        }
        cell?.item = items[indexPath.row]
        return cell!
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelectItem(item: items[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.heightForRowAt
    }
}

