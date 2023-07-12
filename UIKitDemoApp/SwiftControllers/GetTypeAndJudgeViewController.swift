//
//  GetTypeAndJudgeViewController.swift
//  UIKitDemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/7/12.
//

import UIKit

class GetTypeAndJudgeViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "获取对象类型并判断"
        
       
        
        print(object_getClass(false))
        print(object_getClass(1))
        print(object_getClass(1.34))
        
        let dic = ["hello": false]
        let dicType: AnyClass! = object_getClass(dic)
        print(object_getClass(dicType))
        
        let otherDicType = type(of:dic)
        print(otherDicType) // Dictionary<String, Bool>
        
        
        let aNum: Int? = nil
        if aNum != nil {
            print("dddd")
        }else {
            print("dddd-no ok")
        }
        
        let aNumWrap: Any = aNum
        if aNumWrap != nil {
            print("aNumWrap is nil")
        }else {
            print("aNumWrap is not nil")
        }
        
        if let ret = aNumWrap as? Int {
            print("ret==>", ret)
        }else {
            print("ret is nil==>")
        }
        
        switch aNumWrap {
        case is Int:
            print("aNumWrap is Int")
        default:
            print("default")
        }
        
    }

}
