//
//  NotificationViewController.swift
//  UIKitDemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/6/1.
//

import UIKit
import SnapKit

class NotificationViewController: BaseViewController {

    init() {
        super.init(nibName: nil, bundle: nil)
        print("NotificationViewController.init invoked")
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        // 在销毁前注销所有此页面相关的通知
        NotificationCenter.default.removeObserver(self)
        print("NotificationViewController.deinit invoked")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Notification-消息通知"
        print("NotificationViewController.viewDidLoad invoked")
        
        // 注册一个消息通知, 注意：object: nil 这个值本来应该填需要监听的对象，这里不传
        NotificationCenter.default.addObserver(self, selector: #selector(notificationCallback(_:)), name: Constants.name, object: nil)
        introduceNotification()
        setupUI()
    }
    // MARK: - Notification 的参数和方法介绍
    func introduceNotification() {
        // 由消息的名字创建消息
        let notification = Notification.init(name: NotificationViewController.Constants.name)
        
        // 另一种创建消息的方式
        // 消息协带的数据
        let address = "北京市朝阳区"
        let persons = ["Z":"张飞","G":"宫本","X":"小乔"]
        let notificationOther =
        Notification.init(name: NotificationViewController.Constants.name, object: address, userInfo: persons)
        // 消息的名字
        print("消息的名字===>", notification.name)
        print("消息的名字other===>", notificationOther.name)
        // 获取消息携带的对象信息
        print("获取消息携带的对象信息===>", notificationOther.object!)
        // 获取消息携带的用户数据信息
        print("获取消息携带的用户数据信息===>", notificationOther.userInfo!)
        // 获取消息的描述
        print("获取消息的描述===>", notificationOther.description)
        // 获取消息的哈希值
        print("获取消息的哈希值===>", notificationOther.hashValue)
        // 比较两个消息是否相等
        let IsEqual = notificationOther == notification
        print("比较两个消息是否相等===>", IsEqual)
//        结果如下：
//        消息的名字===> NSNotificationName(_rawValue: Notification.Robin)
//        消息的名字other===> NSNotificationName(_rawValue: Notification.Robin)
//        获取消息携带的对象信息===> 北京市朝阳区
//        获取消息携带的用户数据信息===> [AnyHashable("G"): "宫本", AnyHashable("X"): "小乔", AnyHashable("Z"): "张飞"]
//        获取消息的描述===> name = Notification.Robin, object = Optional("北京市朝阳区"), userInfo = Optional([AnyHashable("G"): "宫本", AnyHashable("X"): "小乔", AnyHashable("Z"): "张飞"])
//        获取消息的哈希值===> 1723169345775150442
//        比较两个消息是否相等===> false
    }
    // MARK: - NotificationCenter 的介绍
//    func introduceNotificationCenter(){
//        // 创建一个对象
//        let DefaultNotification = NotificationCenter.default
//        // 注册一个消息通知
//        DefaultNotification.addObserver(self, selector: #selector(notificationMethod(_:)), name: NSNotification.Name(rawValue: "NetWork小贱"), object: nil)
//        // 发送消息 1 ，不携带任何消息的消息发送
//        let notification = Notification.init(name: Notification.Name(rawValue: "NetWork小贱"))
//        DefaultNotification.post(notification)
//
//        // 发送消息 2 ， 携带对象消息的消息发送
//        DefaultNotification.post(name: Notification.Name(rawValue: "NetWork小贱"), object: "成功QQ吧！")
//
//        // 发送消息 3 ， 携带对象又携带用户信息的消息发送
//        DefaultNotification.post(name: Notification.Name(rawValue: "NetWork小贱"), object: "成功QQ吧", userInfo: ["Z":"张明","X":"吓人"])
//
//        // 移除注册的消息通知
//        DefaultNotification.removeObserver(self)
//        DefaultNotification.removeObserver(self, name: Notification.Name(rawValue: "NetWork小贱"), object: nil)
//
//    }
    func setupUI(){
        let startButton = UIButton(type: .system)
        startButton.setTitle("发送通知", for: .normal)
        startButton.backgroundColor = UIColor.primaryBgColor
        startButton.layer.cornerRadius = 5
        startButton.addTarget(self, action: #selector(postNotification(_:)), for: .touchUpInside)
        view.addSubview(startButton)
        startButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalToSuperview().offset(20)
            make.height.equalTo(50)
        }
    }
    
    @objc func postNotification(_ sender: UIButton){
        print("postNotification invoked")
        // 发送消息 1 ，不携带任何消息的消息发送
        let notification = Notification.init(name: Constants.name)
        NotificationCenter.default.post(notification)
        
        // 发送消息 2 ， 携带对象消息的消息发送
        NotificationCenter.default.post(name: Constants.name, object: "成功Q1吧！")

        // 发送消息 3 ， 携带对象又携带用户信息的消息发送
        NotificationCenter.default.post(name: Constants.name, object: "成功Q2吧", userInfo: ["Z":"张明","X":"吓人"])
    }
    
    @objc func notificationCallback(_ notification: Notification){
        debugPrint(notification)
//        结果如下：
//        name = Notification.Robin, object = nil, userInfo = nil
//        name = Notification.Robin, object = Optional(成功Q1吧！), userInfo = nil
//        name = Notification.Robin, object = Optional(成功Q2吧), userInfo = Optional([AnyHashable("Z"): "张明", AnyHashable("X"): "吓人"])
    }
}

extension NotificationViewController {
    enum Constants {
        static let name = NSNotification.Name(rawValue: "Notification.Robin")
    }
}
