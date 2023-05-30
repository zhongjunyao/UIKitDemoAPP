//
//  AsyncAwaitViewController.swift
//  UIKitDemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/5/27.
//

import UIKit
import SwiftUI
import SnapKit

class AsyncAwaitViewController: BaseViewController {
    
    var bankAccount: BankAccount!
    var bankAcctountActor: BankAccountActor!
    
    var label: UILabel!
    var labelActor: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "async与await使用"
        
        configUI()
        excuteTask()
    }
    
    func configUI(){
        label = UILabel()
        label.text = "不使用Actor, 期望输出：1100.0， 实际输出：0"
        label.numberOfLines = 0
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.centerY.equalToSuperview().offset(-30)
            make.height.equalTo(50)
        }
        
        labelActor = UILabel()
        labelActor.text = "使用Actor, 期望输出：1100.0， 实际输出：0"
        labelActor.numberOfLines = 0
        view.addSubview(labelActor)
        labelActor.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.centerY.equalToSuperview().offset(30)
            make.height.equalTo(50)
        }
    }
    
    func excuteTask(){
        // 不使用
        bankAccount = BankAccount(accountNumber: 10, initialDeposit: 100)
        let backgroundQueue = DispatchQueue.global(qos: .background)
        for _ in 0..<100 {
            backgroundQueue.async {
                self.bankAccount.deposit(amount: 10)
            }
        }
        backgroundQueue.async {
            let ret = self.bankAccount.balance
            print(ret) // 期望输出：1100.0， 实际输出：不是1100.0
            DispatchQueue.main.async {
                self.label.text = "不使用Actor, 期望输出：1100.0， 实际输出：\(ret)"
            }
        }
        
        // 使用actor
        bankAcctountActor = BankAccountActor(accountNumber: 20, initialDeposit: 100)
            for _ in 0..<100 {
                Task {
                    await bankAcctountActor.deposit(amount: 10)
                }
            }
        Task {
            let retActor = await bankAcctountActor.balance
            print(retActor) // 期望输出：1100.0， 实际输出：1100.0
            DispatchQueue.main.async {
                self.labelActor.text = "使用Actor, 期望输出：1100.0， 实际输出：\(retActor)"
            }
        }
    }
}

class BankAccount: CustomStringConvertible {
    var description: String {
        return "BankAccount(accountNumber: \(accountNumber), balance: \(balance))"
    }
    
    let accountNumber: Int
    var balance: Double

    enum BankAccountError: Error {
        case insufficientBalance(Double)
        case authorizeFailed
    }

    init(accountNumber: Int, initialDeposit: Double) {
        self.accountNumber = accountNumber
        self.balance = initialDeposit
    }

    func deposit(amount: Double) {
        assert(amount >= 0)
        balance = balance + amount
    }
}

actor BankAccountActor {
// : CustomStringConvertible {
    // 下面的访问方式水有问题的
//    // Actor-isolated property 'description' cannot be used to satisfy nonisolated protocol requirement
//    var description: String {
//        return "BankAccountActor(accountNumber: \(accountNumber), balance: \(balance))"
//    }
//
    let accountNumber: Int
    var balance: Double

    enum BankAccountError: Error {
        case insufficientBalance(Double)
        case authorizeFailed
    }

    init(accountNumber: Int, initialDeposit: Double) {
        self.accountNumber = accountNumber
        self.balance = initialDeposit
    }

    func deposit(amount: Double) {
        assert(amount >= 0)
        balance = balance + amount
    }
}
