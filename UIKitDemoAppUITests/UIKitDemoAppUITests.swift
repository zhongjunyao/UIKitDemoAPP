//
//  UIKitDemoAppUITests.swift
//  UIKitDemoAppUITests
//
//  Created by ROBIN.J.Y.ZHONG on 2023/5/27.
//

import XCTest
// 引入要测试的内容模块
@testable import UIKitDemoApp

final class UIKitDemoAppUITests: BaseUITestCase {
    
    func testLoginJourney() throws {
        // UI测试时，经常需要使用到指定元素，这时用到了一个类 XCUIElementQuery 的脚本方法，脚本的subscript支持的key值类型如下：
        // identifier, title, label, value, or placeholderValue.
        // 这里的演示代码只使用title，label和identifier
        // 这里不可以使用 CommonTabBar.Accessibility.identifier ，而要直接用字符串作为
        let tabBar = app.tabBars["CommonTabBar"]
        
        // 使用title获取
        let seniorButton = tabBar.buttons["Senior"]
        seniorButton.tap()
        tabBar.buttons["UIKit"].tap()
        seniorButton.tap()
        
        // 这里需要注意，因为嵌套的比较深
        app.scrollViews.otherElements.staticTexts["Accessibility的使用"].tap()
        // 使用 placeholderValue 来定位元素， 并tap点击
        let phoneTextField = app.textFields["请输入手机号"]
        phoneTextField.tap()
        phoneTextField.typeText("15914468806")
        let passwordTextField = app.secureTextFields["请输入密码"]
        passwordTextField.tap()
        passwordTextField.typeText("123456")
        app.buttons["Button"].staticTexts["登录"].tap()
        app.navigationBars["登录"].buttons["返回"].tap()
        
    }
    
    // MARK: - UIKitDemoAppUITestsLaunchTests

    // 快照
    func testLaunchScreenshot() throws {
        launchAPP()
        
        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app
        recordScreen = true
        compareScreenshot()
    }
    
//    func testLaunchPerformance() throws {
//        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
//            // This measures how long it takes to launch your application.
//            measure(metrics: [XCTApplicationLaunchMetric()]) {
//               app.launch()
//            }
//        }
//    }
}
