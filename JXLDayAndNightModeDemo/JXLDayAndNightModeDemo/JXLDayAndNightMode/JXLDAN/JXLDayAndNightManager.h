//
//  JXLDayAndNightMode.h
//  JXLDayAndNightMode
//
//  Created by Eiwodetianna on 10/17/15.
//  Copyright © 2015 jinxinliang. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    JXLDayAndNightModeDay, // 日间模式
    JXLDayAndNightModeNight, // 夜间模式
} JXLDayAndNightMode;

@interface JXLDayAndNightManager : NSObject

/**
 *  获取当前的模式
 */

@property (nonatomic,readonly,assign) JXLDayAndNightMode contentMode;

/**
 *  单例
 *
 */
+ (JXLDayAndNightManager *)shareManager;

/**
 *  开启日间模式
 */
- (void)dayMode;
/**
 *  开启夜间模式
 */
- (void)nightMode;

@end
