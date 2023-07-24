//
//  UnorderListViewController2.swift
//  UIKitDemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/7/24.
//

import UIKit

class UnorderListCell2: UIView {
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
    
    init(content: String) {
        super.init(frame: .zero)
        self.content = content
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        addSubview(dotView)
        addSubview(labelView)
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1
        
        dotView.font = UIFont.preferredFont(forTextStyle: .body)
        dotView.attributedText = NSMutableAttributedString(string: "·", attributes: [
            .paragraphStyle: paragraphStyle
        ])
        
        labelView.numberOfLines = 0
        labelView.lineBreakMode = .byClipping
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
            labelView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}


class UnorderListViewController2: BaseViewController {
    
    var orderList: [String] = [
        "hello1 hello2 hello3 hello4 hello5 hello6 hello7 hello8 hello9 hello10 hello11 hello12 hello13 hello14 hello15 hello16", "World", "APP"
    ]
    
    private var verticalStackView: UIStackView = {
        let stackV = UIStackView()
        stackV.axis = .vertical
        stackV.alignment = .fill
        stackV.translatesAutoresizingMaskIntoConstraints = false
        return stackV
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "无序列表2"
        
        setupViews()
    }

    private func setupViews() {
        view.addSubview(verticalStackView)
        NSLayoutConstraint.activate([
            verticalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            verticalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            verticalStackView.topAnchor.constraint(equalTo: view.topAnchor),
//            verticalStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        for item in orderList {
            let cell = UnorderListCell2(content: item)
            verticalStackView.addArrangedSubview(cell)
            NSLayoutConstraint.activate([
                cell.heightAnchor.constraint(greaterThanOrEqualToConstant: 30)
            ])
        }
        
        
    }
}
