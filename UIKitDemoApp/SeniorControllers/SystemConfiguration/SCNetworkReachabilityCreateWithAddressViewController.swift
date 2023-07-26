//
//  SCNetworkReachabilityCreateWithAddressViewController.swift
//  UIKitDemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/7/3.
//

import UIKit
import SystemConfiguration
import SnapKit

class SCNetworkReachabilityCreateWithAddressViewController: BaseViewController {
    lazy var button1: UIButton = {
        return makeButton(title:"测试连接可行性", actionName: "startConnect")
    }()
    
    lazy var vStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [button1])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        return stackView
    }()
    func makeButton(title: String, actionName: String)-> UIButton{
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.tintColor = .white
        button.backgroundColor = UIColor.primaryBgColor
        button.layer.cornerRadius = 5
        button.addTarget(self, action: NSSelectorFromString(actionName), for: .touchUpInside)
        return button
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Network-可连接性检查"
        
        setupUI()
    }
    
    func setupUI(){
        view.addSubview(vStack)
        vStack.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalToSuperview().offset(20)
            make.height.equalTo(160)
        }
    }
    
    @objc func startConnect(){
        if (!self.connectedToNetwork()) {
            let alert: UIAlertView = UIAlertView(title: "Network Connection Error", message: "You need to be connected to the internet to use this feature.", delegate: nil, cancelButtonTitle: "OK")
            alert.show()
        } else {
            let alert: UIAlertView = UIAlertView(title: "Network Connection Success", message: "Congratulations !", delegate: nil, cancelButtonTitle: "OK")
            alert.show()
        }
    }
    
    func connectedToNetwork() -> Bool {
        // Create zero addy
        var zeroAddress = sockaddr()
        zeroAddress.sa_len = UInt8(MemoryLayout<sockaddr>.size(ofValue: zeroAddress)) // UInt8(MemoryLayout<sockaddr>.size);
        zeroAddress.sa_family = UInt8(AF_INET);

        // Recover reachability flags
        guard let defaultRouteReachability: SCNetworkReachability = SCNetworkReachabilityCreateWithAddress(nil, &zeroAddress) else {
            return false
        }
        
        var flags = SCNetworkReachabilityFlags()

        let didRetrieveFlags = SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags)
        
        if !didRetrieveFlags {
            return false
        }
        
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        
        return (isReachable && !needsConnection)
    }
}
