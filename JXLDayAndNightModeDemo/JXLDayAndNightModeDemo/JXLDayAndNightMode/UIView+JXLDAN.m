//
//  UIView+JXLDAN.m
//  JXLDayAndNightMode
//
//  Created by Eiwodetianna on 10/17/15.
//  Copyright © 2015 jinxinliang. All rights reserved.
//

#import "UIView+JXLDAN.h"
#import "JXLDayAndNightManager.h"
#import <objc/runtime.h>

NSString *const JXLChangeModeNotification = @"JXLDNNotification";

static void *JXLViewDayKey = "JXLViewDayKey";
static void *JXLViewNightKey = "JXLViewNightKey";


@implementation UIView (JXLDAN)

- (void)jxl_dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:JXLChangeModeNotification object:nil];
    
    [self jxl_dealloc];
    
}

+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Method deallocMethod = class_getInstanceMethod([self class], NSSelectorFromString(@"dealloc"));
        Method jxl_deallocMethod = class_getInstanceMethod([self class], @selector(jxl_dealloc));
        method_exchangeImplementations(deallocMethod, jxl_deallocMethod);
    });
    
}


- (void)jxl_setDayMode:(DAY_AND_NIGHT_MODE_BLOCK)dayMode nightMode:(DAY_AND_NIGHT_MODE_BLOCK)nightMode {
    objc_setAssociatedObject(self, JXLViewDayKey, dayMode, OBJC_ASSOCIATION_COPY)
    ;
    objc_setAssociatedObject(self, JXLViewNightKey, nightMode, OBJC_ASSOCIATION_COPY)
    ;
    
    
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
