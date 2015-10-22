//
//  UIView+JXLDAN.h
//  JXLDayAndNightMode
//
//  Created by Eiwodetianna on 10/17/15.
//  Copyright © 2015 jinxinliang. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  日间模式和夜间模式的闭包函数类型
 *
 *  @param view 当前的控件
 */

typedef void(^DAY_AND_NIGHT_MODE_BLOCK)(UIView *view);

/**
 *  模式改变的监听事件
 */
extern NSString *const JXLChangeModeNotification;

@interface UIView (JXLDAN)

/**
 *  设置控件日间模式和夜间模式的内容
 *
 *  @param dayMode   日间模式设置内容
 *  @param nightMode 夜间模式设置内容
 */

- (void)jxl_setDayMode:(DAY_AND_NIGHT_MODE_BLOCK)dayMode nightMode:(DAY_AND_NIGHT_MODE_BLOCK)nightMode;

@end
