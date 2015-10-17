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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self.view jxl_setDayMode:^(UIView *weakView) {
        weakView.backgroundColor = [UIColor whiteColor];
    } nightMode:^(UIView *weakView) {
        weakView.backgroundColor = [UIColor blackColor];
    }];
    
    [self.navigationController.navigationBar jxl_setDayMode:^(UIView *weakView) {
        UINavigationBar *bar = (UINavigationBar *)weakView;
        bar.barTintColor = [UIColor whiteColor];
    } nightMode:^(UIView *weakView) {
        UINavigationBar *bar = (UINavigationBar *)weakView;
        bar.barTintColor = [UIColor blackColor];
    }];
    
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 100, 100);
    [button jxl_setDayMode:^(UIView *weakView) {
        weakView.backgroundColor = [UIColor greenColor];
    } nightMode:^(UIView *weakView) {
        weakView.backgroundColor = [UIColor redColor];
    }];
    [button setTitle:@"touch" forState:UIControlStateNormal];
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
