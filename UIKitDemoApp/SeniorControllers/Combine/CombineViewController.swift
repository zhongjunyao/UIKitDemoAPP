//
//  CombineViewController.swift
//  UIKitDemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/5/29.
//

import UIKit
import Combine

class CombineViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Combine使用"
        
        // 创建发布者
//        createPublisherByJust()
//        createPublisherByFuture()
//        createPublisherByPassthroughSubject()
//        createPublisherByCurrentValueSubject()
        
        // 创建订阅者
//        createSubscriberBySink()
//        createSubscriberByAssign()
    }
    // MARK: - 创建订阅者
    // sink
    func createSubscriberBySink() -> AnyCancellable{
        let publisher = Just("Hello, world!")

        let subscriber = publisher
            .sink(receiveCompletion: { print("Received completion: \($0)") },
                  receiveValue: { print("Received value: \($0)") })
        return subscriber
    }
    // assign
    func createSubscriberByAssign() -> Set<AnyCancellable>{
        return MyViewModel2().cancellables
    }
    

    // MARK: - 创建发布者
    // Just
    func createPublisherByJust() -> Just<Int>{
        let publisher = Just(42)
        return publisher
    }
    
    // Future
    func createPublisherByFuture() async -> Future<String, Error> {
        let publisher = Future<String, Error> { promise in
            // Perform an asynchronous task
            DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
                // When the task completes, fulfill the promise
                promise(.success("Hello, world!"))
            }
        }
        
        // 使用 async-await 语法来获取 Future 中的值（或错误）
        do {
            let value = try await publisher.value
            print("Received value: \(value)")
        } catch {
            print("Error occurred with info: \(error.localizedDescription)")
        }
        return publisher
    }
    
    // PassthroughSubject
    func createPublisherByPassthroughSubject() -> AnyPublisher<String, Never>{
        return MyViewModel().usernamePublisher
    }
    
    // CurrentValueSubject
    func createPublisherByCurrentValueSubject() -> CurrentValueSubject<Int, Never>{
        // Define a CurrentValueSubject with an initial value of 0
        let subject = CurrentValueSubject<Int, Never>(0)

        // Subscribe to the subject and print out each emitted value
        let cancellable = subject.sink { value in
            print("Value: \(value)")
        }

        // Update the value of the subject
        subject.send(1)
        subject.send(2)

        // Print out the current value of the subject
        print("Current value: \(subject.value)")

        // Cancel the subscription
        cancellable.cancel()
        /* output:
        Value: 0
        Value: 1
        Value: 2
        Current value: 2
        */
        
        return subject
    }
}

// PassthroughSubject
class MyViewModel {
    private let usernameSubject = PassthroughSubject<String, Never>()

    var usernamePublisher: AnyPublisher<String, Never> {
        return usernameSubject.eraseToAnyPublisher()
    }

    // 通过修改用户名事件来触发PassthroughSubject发布器
    func updateUsername(_ username: String) {
        usernameSubject.send(username)
    }
}

// assign
class MyViewModel2 {
    let username = CurrentValueSubject<String, Never>("")
    
    var usernameLabelText: String = "" {
        didSet {
            print(usernameLabelText)
        }
    }
    
    var cancellables = Set<AnyCancellable>()
    
    init() {
        username
            .assign(to: \.usernameLabelText, on: self)
            .store(in: &cancellables)
    }

    deinit {
        cancellables.forEach { $0.cancel() }
    }
}
