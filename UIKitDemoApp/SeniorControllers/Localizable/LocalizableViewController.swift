//
//  LocalizableViewController.swift
//  UIKitDemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/6/28.
//

import UIKit
import SnapKit

enum Language: String {
    case en = "English"
    case zhCN = "简体中文"
    case zhHK = "繁体中文"
}

class LocalizableViewController: BaseViewController {

    var selectedID: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "国际化-iOS自带方式"
        
        setupUI()
    }

    func setupUI(){
        let radioBtn3 = RadioButton()
        radioBtn3.id = Language.zhHK.rawValue
        radioBtn3.selectedID = self.selectedID
        radioBtn3.addTarget(self, action: #selector(radioButtonCallBack(_:)), for: .touchUpInside)
//        let group = RadioGroup()
//        group.items = [
//            RadioButton(id: Language.en.rawValue, selectedID: self.selectedID, callBack: self.radioButtonCallBack),
//            RadioButton(id: Language.zhCN.rawValue, selectedID: self.selectedID, callBack: self.radioButtonCallBack),
//            radioBtn3
//        ]
//        self.view.addSubview(group)
        self.view.addSubview(radioBtn3)
        radioBtn3.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.height.equalTo(55)
        }
    }
    
    @objc func radioButtonCallBack(_ sender: RadioButton){
        self.selectedID = sender.id!
        print("radioButtonCallBack invoked")
    }
}

class RadioGroup: UIControl {
    var items: [RadioButton] = [] {
        didSet {
            self.setupUI()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    func setupUI(){
        guard self.items.count > 0 else {
            return
        }
        print("setupUI invoked")
        let vStack = UIStackView()
        vStack.axis = .vertical
        self.items.forEach { radioButton in
            vStack.addArrangedSubview(radioButton)
        }
        addSubview(vStack)
        vStack.backgroundColor = .orange
        vStack.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.top.equalToSuperview()
            make.height.equalTo(50)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// 参考文章： https://blog.csdn.net/qq_36924683/article/details/121894676
class RadioButton: UIControl {
    var id: String?
    var selectedID: String? {
        didSet {
            setupUI()
        }
    }
    
    var labelView: UILabel!
    var iconVIew: UIImageView!
    var bottomLine: UIView!
    var highlightView: UIView!
    
    override var isHighlighted: Bool {
        didSet {
            super.isHighlighted = self.isHighlighted
            if self.isHighlighted {
                self.highlightView.alpha = 1
                self.highlightView.isHidden = false
            } else {
                UIView.animate(withDuration: 0.5, animations: {
                    self.highlightView.alpha = 0
                }, completion: { finished in
                    self.highlightView.isHidden = true
                })
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        highlightView = UIView()
        highlightView.backgroundColor = UIColor(white: 0.9, alpha: 1)
        highlightView.isHidden = true
        highlightView.alpha = 0
        addSubview(highlightView)
        highlightView.snp.makeConstraints {make in
            make.edges.equalToSuperview()
        }
        
        labelView = UILabel()
        labelView.text = self.id
        labelView.textColor = UIColor.fontColor
        labelView.font = .preferredFont(forTextStyle: .body)
        addSubview(labelView)
        labelView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-72)
            make.centerY.equalToSuperview()
        }
        
        iconVIew = UIImageView(image: UIImage(named: self.selectedID == self.id ? "radio_button_select" : "radio_button_unselect"))
        addSubview(iconVIew)
        iconVIew.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-20)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(32)
        }
        
        bottomLine = UIView()
        bottomLine.backgroundColor = UIColor.hexColor(0xdddddd)
        addSubview(bottomLine)
        bottomLine.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.width.equalToSuperview()
            // 设置一个像素
            make.height.equalTo(1 / UIScreen.main.scale)
        }
    }
}
