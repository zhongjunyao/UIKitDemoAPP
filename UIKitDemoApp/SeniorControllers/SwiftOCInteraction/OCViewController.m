//
//  OCViewController.m
//  UIKitDemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/5/26.
//

#import "OCViewController.h"
#import "UIKitDemoApp-Swift.h"

@interface OCViewController ()

@end

@implementation OCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"被Swift调用的OC界面";
    self.view.backgroundColor = UIColor.cyanColor;
    
    [self setupViews];
    
}

- (void)setupViews {
    // 设置label
    UILabel *label = [UILabel new];
    label.text = @"OC的标签";
    label.backgroundColor = UIColor.redColor;
    label.frame = CGRectMake(100, 100, 150, 50);
    [self.view addSubview:label];
    
    // 设置button
    UIButton *button = [UIButton new];
    button.frame = CGRectMake(100, 300, 150, 50);
    button.backgroundColor = UIColor.redColor;
    [button setTitle:@"跳转Swift页面" forState: UIControlStateNormal];
    [button setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    [button addTarget:self action:@selector(didOCButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)didOCButtonClicked:(UIButton *)sender {
    UIViewController *swiftVC = [SwiftViewController alloc];
    [self.navigationController pushViewController:swiftVC animated:true];
}

- (void)method1:(NSString *)message {
    NSLog(@"method1 invoked, get message \"%@\" from swift page", message);
    Position *pos = [[Position alloc]initWithX:100 y:100];
    NSLog(@"Position(x: %ld, y: %ld)", (long)pos.x, (long)pos.y);
}
- (void)method2 {
    NSLog(@"method2 invoked");
}

@end
