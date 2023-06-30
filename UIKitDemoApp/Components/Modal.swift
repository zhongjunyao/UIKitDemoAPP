//
//  Modal.swift
//  UIKitDemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/6/30.
//

import UIKit

class Modal : UIView {
    
    var contentView: UIView! {
        didSet {
            setupUI()
        }
    }
    
    // 注意在init中设置值时，是不会触发 didSet 回调的
    init(contentView: UIView) {
        super.init(frame: .zero)
        self.contentView = contentView
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        backgroundColor = UIColor.modalBgColor
        alpha = 0
        isUserInteractionEnabled = true
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissView)))
        
        contentView.frame.origin.y = self.bounds.size.height
        contentView.backgroundColor = UIColor.white
        addSubview(contentView)
    }
    
    func setupConstraints(){
        setEdgeInsets(item: self, toItem: superview!, edgeInsets: .zero)
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            contentView.heightAnchor.constraint(equalToConstant: contentView.frame.height)
        ])
    }
    
    func setEdgeInsets(item: UIView, toItem: UIView, edgeInsets: UIEdgeInsets){
        item.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            item.leadingAnchor.constraint(equalTo: toItem.leadingAnchor, constant: +edgeInsets.left),
            item.trailingAnchor.constraint(equalTo: toItem.trailingAnchor, constant: -edgeInsets.right),
            item.topAnchor.constraint(equalTo: toItem.topAnchor, constant: +edgeInsets.top),
            item.bottomAnchor.constraint(equalTo: toItem.bottomAnchor, constant: -edgeInsets.bottom)
        ])
    }
    
    @objc func dismissView(){
        UIView.animate(withDuration: 0.3, animations: {
            self.alpha = 0
            self.contentView.frame.origin.y = self.frame.height
        }) { (true) in
            self.removeFromSuperview()
            self.contentView.removeFromSuperview()
        }
    }
    
//    func showInWindow(){
//        UIApplication.shared.keyWindow?.addSubview(self)
//        UIView.animate(withDuration: 0.3, animations: {
//            self.alpha = 1.0
//            self.contentView.frame.origin.y = self.bounds.size.height - self.contentView.bounds.size.height
//        }, completion: nil)
//    }
    
    func showInView(view: UIView){
        if (contentView == nil) {
            return
        }
        
        view.addSubview(self)
        setupConstraints()
        UIView.animate(withDuration: 0.3, animations: {
            self.contentView.frame.origin.y = self.bounds.size.height - self.contentView.frame.height
            self.alpha = 1.0
        }, completion: nil)
    }
}
