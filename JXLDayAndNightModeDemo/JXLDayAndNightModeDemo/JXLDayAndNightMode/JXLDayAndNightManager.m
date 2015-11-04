//
//  JXLDayAndNightMode.m
//  JXLDayAndNightMode
//
//  Created by Eiwodetianna on 10/17/15.
//  Copyright © 2015 jinxinliang. All rights reserved.
//

#import "JXLDayAndNightManager.h"
#import "UIView+JXLDAN.h"

@interface JXLDayAndNightManager ()

@property(nonatomic,readwrite,assign)JXLDayAndNightMode contentMode;

@end

@implementation JXLDayAndNightManager


+ (JXLDayAndNightManager *)shareManager {
    
    static JXLDayAndNightManager *dayAndNightManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dayAndNightManager = [[JXLDayAndNightManager alloc] init];
        dayAndNightManager.contentMode = JXLDayAndNightModeDay;
        
    });
    return dayAndNightManager;
}

- (void)dayMode {
    [self p_saveSettingWithNight:NO];
    [[NSNotificationCenter defaultCenter] postNotificationName:JXLChangeModeNotification object:nil];

}

- (void)nightMode {
    [self p_saveSettingWithNight:YES];
    [[NSNotificationCenter defaultCenter] postNotificationName:JXLChangeModeNotification object:nil];
}


- (JXLDayAndNightMode)contentMode {
    return [[NSUserDefaults standardUserDefaults] boolForKey:@"JXLDayAndNight"] ? JXLDayAndNightModeNight : JXLDayAndNightModeDay;
}


- (void)p_saveSettingWithNight:(BOOL)isNight {
    [[NSUserDefaults standardUserDefaults] setBool:isNight forKey:@"JXLDayAndNight"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
