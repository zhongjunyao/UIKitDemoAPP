//
//  CustomModalViewController.swift
//  UIKitDemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/6/30.
//

import UIKit

class CustomModalViewController: BaseViewController {

    var modal: Modal!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "自定义底部弹窗"

        setupUI()
    }
    
    func setupUI(){
        let button = UIButton(type: .system)
        button.setTitle("显示弹窗", for: .normal)
        button.backgroundColor = UIColor.primaryBgColor
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(doAction), for: .touchUpInside)
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            button.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func doAction(){
        modal = Modal(contentView: getContentView())
        modal.showInView(view: self.view)
    }
    
    //MARK: - 布局
    func getContentView() -> UIView {
        let contentView = UIView(frame: CGRectMake(0, 0, UIScreen.main.bounds.width, 200))
        let titleArr = ["京","沪","浙","苏","粤","鲁","晋","翼",
                             "豫","川","渝","辽","吉","黑","皖","鄂",
                             "湘","赣","闽","陕","甘","宁","蒙","津",
                             "贵","云","桂","琼","青","新","藏"]
         
        for (index,value) in titleArr.enumerated() {
            let button = createButton(title: value)
            let margin = (UIScreen.main.bounds.size.width - 8 * 39)/(8 + 1)
            let col  = CGFloat(index % Int(8))
            let row  = CGFloat(index / Int(8))
            let viewX = margin +  col * (39 + margin)
            let viewY = 7 + row * (39 + 7)
             
            button.frame = CGRect(x: viewX, y: viewY, width: 39, height: 39)
            contentView.addSubview(button)
        }
        
        return contentView
    }
     
    func createButton(title:String) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(UIColor.fontColor, for: .normal)
        button.backgroundColor = UIColor.primaryBgColor
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 5.0
         
        button.addTarget(self, action: #selector(buttonClickAction(button:)), for: .touchUpInside)
        return button
    }
     
    @objc func buttonClickAction(button:UIButton) -> Void {
        modal.dismissView()
    }

}
