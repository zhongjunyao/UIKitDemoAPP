//
//  OCViewController.h
//  UIKitDemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/5/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface OCViewController : UIViewController

// 将method1方法在Swift中替换成swiftMethod1()
- (void)method1:(NSString *)message NS_SWIFT_NAME(swiftMethod1(message:));

// 将method2方法在Swift中隐藏
- (void)method2 NS_SWIFT_UNAVAILABLE("Swift中该方法不可调用");

@end

NS_ASSUME_NONNULL_END
