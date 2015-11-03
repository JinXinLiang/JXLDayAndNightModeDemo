//
//  UIView+JXLDAN.m
//  JXLDayAndNightMode
//
//  Created by Eiwodetianna on 10/17/15.
//  Copyright © 2015 jinxinliang. All rights reserved.
//

#import "UIView+JXLDAN.h"
#import "JXLDayAndNightManager.h"
#import <objc/objc-runtime.h>

NSString *const JXLChangeModeNotification = @"JXLDNNotification";

static void *JXLViewDayKey = "JXLViewDayKey";
static void *JXLViewNightKey = "JXLViewNightKey";


@implementation UIView (JXLDAN)




- (void)jxl_setDayMode:(DAY_AND_NIGHT_MODE_BLOCK)dayMode nightMode:(DAY_AND_NIGHT_MODE_BLOCK)nightMode {
    objc_setAssociatedObject(self, JXLViewDayKey, dayMode, OBJC_ASSOCIATION_COPY)
    ;
    objc_setAssociatedObject(self, JXLViewNightKey, nightMode, OBJC_ASSOCIATION_COPY)
    ;
    
//    Method originalMethod = class_getInstanceMethod([NSString class], @selector(dealloc));
//    Method swapMethod = class_getInstanceMethod([NSString class], @selector(myLowerString));
//    method_exchangeImplementations(originalMethod, swapMethod);
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(p_changeMode) name:JXLChangeModeNotification object:nil];
    [self p_changeMode];
    
}

- (void)p_changeMode {
    DAY_AND_NIGHT_MODE_BLOCK dayModeBlock = objc_getAssociatedObject(self, JXLViewDayKey);
    DAY_AND_NIGHT_MODE_BLOCK nightModeBlock = objc_getAssociatedObject(self, JXLViewNightKey);
    
    if (JXLDayAndNightModeDay == [[JXLDayAndNightManager shareManager] contentMode]) {
        dayModeBlock(self);
    } else {
        nightModeBlock(self);
    }
    
}


@end
