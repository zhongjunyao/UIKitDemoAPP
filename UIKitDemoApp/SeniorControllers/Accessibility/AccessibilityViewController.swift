//
//  AccessibilityViewController.swift
//  UIKitDemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/6/25.
//

import UIKit
import SnapKit

protocol ValidatesPhoneNumber {
    func validatePhoneNumber(_ phoneNumber: String?) -> Bool
}
protocol ValidatesPassword{
    func validatePassword(_ password: String?) -> Bool
}

extension ValidatesPhoneNumber {
    func validatePhoneNumber(_ phoneNumber: String?) -> Bool {
        let phone = phoneNumber ?? ""
        if phone.count != 11 {
            return false
        }
        return true
    }
}

extension ValidatesPassword {
    func validatePassword(_ password: String?) -> Bool {
        let passwd = password ?? ""
        if passwd.count < 6 || passwd.count > 12 {
            return false
        }
        return true
    }
}

// 测试 Accessibility 需要用到真机，请在手机上测试
class AccessibilityViewController: BaseViewController, ValidatesPhoneNumber, ValidatesPassword, UITextFieldDelegate {
    
    var phoneTextField: UITextField!
    var passwordTextField: UITextField!
    
    var logoView: UIImageView!
    var loginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "登录"
        
        configUI()
        
        configAccessibility()
    }
    
    func configAccessibility(){
        // 设置accessibility
        logoView.accessibilityTraits = .image
        logoView.accessibilityLabel = "Image View"
        logoView.accessibilityHint = "This is a image view."
        
        // 设置accessibility
        phoneTextField.accessibilityTraits = .updatesFrequently
        phoneTextField.accessibilityLabel = "Text Field"
        phoneTextField.accessibilityHint = "This is a phone number input box."
        phoneTextField.font = UIFont.preferredFont(forTextStyle: .body)
        phoneTextField.adjustsFontForContentSizeCategory = true
        
        // 设置accessibility
        passwordTextField.accessibilityTraits = .updatesFrequently
        passwordTextField.accessibilityLabel = "Text Field"
        passwordTextField.accessibilityHint = "This is a password input box."
        passwordTextField.font = UIFont.preferredFont(forTextStyle: .body)
        passwordTextField.adjustsFontForContentSizeCategory = true
        
        // 设置accessibility
        loginButton.accessibilityTraits = .button
        loginButton.accessibilityLabel = "Button"
        loginButton.accessibilityHint = "This is a login submit button."
        loginButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        loginButton.titleLabel?.adjustsFontForContentSizeCategory = true
        
    }
    
    func configUI(){
        logoView = UIImageView(image: UIImage(named: "logo"))
        view.addSubview(logoView)
        logoView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(100)
            make.centerX.equalToSuperview()
        }
        
        let phoneIconView = UIView(frame: CGRect(x: 0, y: 0, width: 36, height: 50))
        let phoneIconImage = UIImageView(image: UIImage(named: "icon_phone"))
        phoneIconImage.frame = CGRect(x: 0, y: 0, width: 36, height: 50)
        phoneIconImage.contentMode = .center
        phoneIconView.addSubview(phoneIconImage)
        
        phoneTextField = UITextField()
        
        // 设置其他属性
        phoneTextField.leftView = phoneIconView
        phoneTextField.leftViewMode = .always
        phoneTextField.layer.borderColor = UIColor.borderColor.cgColor
        phoneTextField.layer.borderWidth = 1
        phoneTextField.textColor = UIColor.fontColor
        phoneTextField.layer.cornerRadius = 5
        phoneTextField.layer.masksToBounds = true
        phoneTextField.placeholder = "请输入手机号"
        view.addSubview(phoneTextField)
        phoneTextField.snp.makeConstraints{make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(logoView.snp.bottom).offset(20)
            make.height.equalTo(50)
        }
        phoneTextField.delegate = self

        let passwordIconView = UIView(frame: CGRect(x: 0, y: 0, width: 36, height: 50))
        let passwordIconImage = UIImageView(image: UIImage(named: "icon_pwd"))
        passwordIconImage.frame = CGRect(x: 0, y: 0, width: 36, height: 50)
        passwordIconImage.contentMode = .center
        passwordIconView.addSubview(passwordIconImage)
        
        passwordTextField = UITextField()
        
        // 设置其他属性
        passwordTextField.leftView = passwordIconView
        passwordTextField.leftViewMode = .always
        passwordTextField.layer.borderColor = UIColor.borderColor.cgColor
        passwordTextField.layer.borderWidth = 1
        passwordTextField.textColor = UIColor.fontColor
        passwordTextField.layer.cornerRadius = 5
        passwordTextField.layer.masksToBounds = true
        passwordTextField.placeholder = "请输入密码"
        // passwordTextField.textContentType = .password
        passwordTextField.isSecureTextEntry = true
        view.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints{make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(phoneTextField.snp.bottom).offset(15)
            make.height.equalTo(50)
        }
        
        // 设置custom，无预设样式
        loginButton = UIButton(type: .custom)
        
        loginButton.setTitle("登录", for: .normal)
        loginButton.setTitleColor(UIColor.white, for: .normal)
        loginButton.layer.cornerRadius = 5
        loginButton.layer.masksToBounds = true
        // loginButton.backgroundColor = UIColor.primaryBgColor
        loginButton.setBackgroundImage(UIColor.primaryBgColor.toImage(), for: .normal)

        view.addSubview(loginButton)
        loginButton.snp.makeConstraints{make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(passwordTextField.snp.bottom).offset(20)
            make.height.equalTo(50)
        }
        
        // 事件逻辑
        loginButton.addTarget(self, action: #selector(didClickLoginButton(_:)), for: .touchUpInside)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("----信息----", textField.text!, string)
        // 长度限制为11, string = 0  点击删除键盘
        let maxLen = 11
        if textField.text!.count > maxLen - 1 && string.count != 0 {
            return false
        }
        return true
    }
    
    @objc func didClickLoginButton(_ sender: UIButton){
        print("invoked didClickLoginButton")
        if validatePhoneNumber(phoneTextField.text) && validatePassword(passwordTextField.text){

        }else{
            showToast()
        }
    }
    func showToast(){
        print("invoked showToast")
        let alertVC = UIAlertController(title: "提示", message: "用户名或者密码错误", preferredStyle: .alert)
        present(alertVC, animated: true)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            alertVC.dismiss(animated: true, completion: nil)
        }
    }
}
