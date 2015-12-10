//
//  JXLRootViewController.m
//  JXLDayAndNightMode
//
//  Created by Eiwodetianna on 10/17/15.
//  Copyright © 2015 jinxinliang. All rights reserved.
//

#import "JXLRootViewController.h"
#import "JXLDayAndNightMode.h"
#import "JXLSecondViewController.h"

@interface JXLRootViewController ()

@end

@implementation JXLRootViewController

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:JXLChangeModeNotification object:nil];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 设置日间和夜间两种状态
    [self.view jxl_setDayMode:^(UIView *view) {

        // 设置日间模式状态
        view.backgroundColor = [UIColor whiteColor]; // view为当前设置的视图
        
    } nightMode:^(UIView *view) {
        
        // 设置夜间模式状态
        view.backgroundColor = [UIColor blackColor]; // view为当前设置的视图
        
    }];
    
    [self.navigationController.navigationBar jxl_setDayMode:^(UIView *view) {
        UINavigationBar *bar = (UINavigationBar *)view;
        // 改变状态栏前景色为黑色
        bar.barStyle = UIBarStyleDefault;
        bar.barTintColor = [UIColor whiteColor];
    } nightMode:^(UIView *view) {
        
        UINavigationBar *bar = (UINavigationBar *)view;
        // 改变状态栏前景色为白色
        bar.barStyle = UIBarStyleBlack;
        bar.barTintColor = [UIColor blackColor];
    }];
    
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 100, 100);
    [button setTitle:@"touch" forState:UIControlStateNormal];
    [button jxl_setDayMode:^(UIView *view) {
        
        UIButton *setButton = (UIButton *)view;
        setButton.backgroundColor = [UIColor blackColor];
        [setButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
    } nightMode:^(UIView *view) {
        
        UIButton *setButton = (UIButton *)view;
        setButton.backgroundColor = [UIColor whiteColor];
        [setButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
    }];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
}



- (void)buttonAction:(UIButton *)button {
    JXLSecondViewController *secondViewController = [JXLSecondViewController new];
    [self.navigationController pushViewController:secondViewController animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
