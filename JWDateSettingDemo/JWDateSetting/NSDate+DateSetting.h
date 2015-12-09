//
//  NSDate+DateSetting.h
//  JWDateSetting
//
//  Created by jianwei.chen on 15/9/12.
//  Copyright (c) 2015年 jianwei.chen. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const JWDateSettingChangedNotification;

@interface NSDate (DateSetting)

+ (BOOL)isDaySetting24Hours;

@end
