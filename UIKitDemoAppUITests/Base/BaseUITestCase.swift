//
//  BaseUITestCase.swift
//  UIKitDemoAppUITests
//
//  Created by ROBIN.J.Y.ZHONG on 2023/7/5.
//

import XCTest

class BaseUITestCase: XCTestCase {
    private(set) var app: XCUIApplication!
    
    var recordScreen: Bool = false
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try super.tearDownWithError()
    }
    
    func launchAPP(){
        app = XCUIApplication()
        // 实例化之后一定要启动
        app.launch()
    }
    
    // 保存截图
    func saveScreenshot(){
        
        // 需要通过 XCUIApplication().screenshot(), 传给附件对象再进行信息设置最后通过add保存
        let attachment = XCTAttachment(screenshot: app.screenshot())
        // 设置快照的截图
        attachment.name = "Launch Screen"
        // 设置快照的生命周期,keepAlways 一直保存，deleteOnSuccess 测试成功就删除
        attachment.lifetime = .keepAlways
        // 保存截图
        add(attachment)
    }
    
    // 对比截图
    func compareScreenshot(){
        guard recordScreen else {
            return saveScreenshot()
        }
        
        // 对当前内容截图，我还不知道截图对比的原理，所以这里没有代码
    }
}
