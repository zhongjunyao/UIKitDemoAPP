//
//  UIKitDemoAppTests.swift
//  UIKitDemoAppTests
//
//  Created by ROBIN.J.Y.ZHONG on 2023/5/27.
//

import XCTest
// 导入需要测试的模块名，这样模块的内容就可以应用了
@testable import UIKitDemoApp

final class UIKitDemoAppTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // 这里测 Model，test开头的函数都会被作为一个case来测试
    func testModel() throws {
        let testProduct = Product(imageUrl: "https://static001.geekbang.org/resource/image/87/ee/8778de4ccd67425a762cea15361639ee.jpg?x-oss-process=image/resize,m_fill,h_336,w_254", name: "MongoDB高手课", desc: "Tapdata CTO、MongoDB中文社区主席、前MongoDB大中华区首席架构师", price: 129, teacher: "唐建法", total: 47, update: 9, studentCount: 2205, detail: "MongoDB 是当前广受欢迎的 NoSQL 数据库，目前社...", courseList: "第一章：MongoDB再入门 (9讲)")
        let testDeal = Deal(product: testProduct, progress: 10)
        
        // 断言
        XCTAssertNotNil(testDeal)
        XCTAssertEqual(testProduct.imageUrl, "https://static001.geekbang.org/resource/image/87/ee/8778de4ccd67425a762cea15361639ee.jpg?x-oss-process=image/resize,m_fill,h_336,w_254")
        XCTAssertTrue(testDeal.progress == 10)
        XCTAssertFalse(testDeal.progress != 10)
        XCTAssertLessThan(testDeal.progress, 20)
        XCTAssertGreaterThanOrEqual(testDeal.progress, 1)
        // 还有更多断言相关内容
        // 通用断言
        // XCTAssert(expression, format...)当expression求值为TRUE时通过
        
    }
    
//    func testExample() throws {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//        // Any test you write for XCTest can be annotated as throws and async.
//        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
//        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
//    }
//
//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
    
}
