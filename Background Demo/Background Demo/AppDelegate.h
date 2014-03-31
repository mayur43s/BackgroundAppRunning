//
//  AppDelegate.h
//  Background Demo
//
//  Created by Canopus 4 on 28/02/14.
//  Copyright (c) 2014 Iftekhar. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MMPDeepSleepPreventer;

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    UIBackgroundTaskIdentifier taskIdentifier;
    MMPDeepSleepPreventer *deepSleepPreventer;
}

@property (strong, nonatomic) UIWindow *window;

@end
