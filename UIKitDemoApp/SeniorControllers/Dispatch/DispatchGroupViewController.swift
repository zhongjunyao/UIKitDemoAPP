//
//  DispatchGroupViewController.swift
//  UIKitDemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/7/2.
//

import UIKit
import SnapKit

class DispatchGroupViewController: BaseViewController {

    lazy var globalQueue = DispatchQueue.global(qos: .background)
    
    lazy var button1: UIButton = {
        return makeButton(title:"notify(依赖任务)", actionName: "doAction1")
    }()
    
    lazy var button2: UIButton = {
        return makeButton(title:"wait(任务等待)", actionName: "doAction2")
    }()
    
    lazy var button3: UIButton = {
        return makeButton(title:"enter 和 leave 手动管理", actionName: "doAction3")
    }()
    
    lazy var vStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [button1, button2, button3])
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
        title = "DispatchGroup的用法"
        
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
    
    
    @objc func doAction1(){
        let group = DispatchGroup()
        globalQueue.async(group: group, qos: .default, flags: [], execute: {
            for idx in 0...10 {
               print("耗时任务一, index:", idx)
            }
        })
        globalQueue.async(group: group, qos: .default, flags: [], execute: {
            for idx in 0...10 {
                print("耗时任务二, index:", idx)
            }
        })
        // 执行完上面的两个耗时操作, 回到globalQueue队列中执行下一步的任务
        group.notify(queue: globalQueue) {
            print("回到该队列中执行")
        }
    }
    
    @objc func doAction2(){
        let group = DispatchGroup()
        globalQueue.async(group: group, qos: .default, flags: [], execute: {
            for idx in 0...10 {
                print("耗时任务一", idx)
            }
        })
        globalQueue.async(group: group, qos: .default, flags: [], execute: {
            for idx in 0...10 {
                print("耗时任务二", idx)
                sleep(UInt32(3))
            }
        })
        // 等待上面任务执行，会阻塞当前线程，超时就执行下面的，上面的继续执行。
        // 可以无限等待 .distantFuture
        let result = group.wait(timeout: .now() + 2.0)
        switch result {
        case .success:
            print("不超时, 上面的两个任务都执行完")
        case .timedOut:
            print("超时了, 上面的任务还没执行完执行这了")
        }

        print("接下来的操作")
    }
    
    @objc func doAction3(){
        let group = DispatchGroup()
        group.enter()//把该任务添加到组队列中执行
        globalQueue.async(group: group, qos: .default, flags: [], execute: {
            for idx in 0...10 {
                print("耗时任务一", idx)
            }
            group.leave()//执行完之后从组队列中移除
        })
        group.enter()//把该任务添加到组队列中执行
        globalQueue.async(group: group, qos: .default, flags: [], execute: {
            for idx in 0...10 {
                print("耗时任务二", idx)
                sleep(UInt32(1))
            }
            group.leave()//执行完之后从组队列中移除
        })

        //当上面所有的任务执行完之后通
        group.notify(queue: .main) {
            print("所有的任务执行完了")
        }
    }
}
