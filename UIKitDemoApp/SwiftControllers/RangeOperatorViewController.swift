//
//  RangeOperatorViewController.swift
//  UIKitDemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/7/7.
//

import UIKit

class RangeOperatorViewController: BaseViewController {
    
    enum Operator: Equatable {
        case login
        case logout
        case loading
        
        func test(){
            if [.login, .logout].contains(where: { $0 == self }) {
                print("login or logout")
                return
            }
            print("Non login and logout")
        }
        
    }
    
    enum dir {
        case east(Int)
        case west(String)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Range-操作方法"
        setupUI()
        
        Operator.login.test()
        Operator.logout.test()
        Operator.loading.test()
        
        test(333, name: "kdkdk")
        
        
        
    }

    
    func test(_ num: Int, name: String) {
        print(name)
    }
    
    func setupUI(){
                
        requestData { item in
            switch item {
            case let .east(num):
                print("kdkkdkd")
            case let .west(stt):
                print("kdkkdkd")
            }
            
        }
        
//        let dir1 = dir.east(55)
        
//        var num: Int!
//        if case .east(num) = dir1 {
//            print(num)
//        }
//
//        let arr: [any Collection] = [
//            [44, 66,78],
//            1...4,
//            10...13
//        ]
//
//        let isContains2 = arr.contains(where: { $0.contains(where: { $0 as! Int == 11})})
//        print("isContains2===>", isContains2)
    }
    
    
    func requestData(complet: ((dir) -> ())) {
        
        complet(dir.east(55))
    }
    
}
