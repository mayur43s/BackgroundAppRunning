//
//  AppDelegate.m
//  Background Demo
//
//  Created by Canopus 4 on 28/02/14.
//  Copyright (c) 2014 Iftekhar. All rights reserved.
//

#import "AppDelegate.h"
#import "MMPDeepSleepPreventer.h"
#import "ViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    deepSleepPreventer = [[MMPDeepSleepPreventer alloc] init];
	[deepSleepPreventer startPreventSleep];

    {
        taskIdentifier = [application beginBackgroundTaskWithExpirationHandler:^{
        }];
        
        // Start the long-running task and return immediately.
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            // Do the work associated with the task, preferably in chunks.
            
            while (1)
            {
                [NSThread sleepForTimeInterval:9*60];
            }
            
            [application endBackgroundTask:taskIdentifier];
            taskIdentifier = UIBackgroundTaskInvalid;
        });
    }

    if ([application respondsToSelector:@selector(setMinimumBackgroundFetchInterval:)])
    {
        NSLog(@"%f",UIApplicationBackgroundFetchIntervalMinimum);
        [application setMinimumBackgroundFetchInterval:UIApplicationBackgroundFetchIntervalMinimum];
    }
    
    // Override point for customization after application launch.
    return YES;
}

- (void)application:(UIApplication *)application performFetchWithCompletionHandler:(void (^)(UIBackgroundFetchResult result))completionHandler
{
    completionHandler(UIBackgroundFetchResultNoData);
    PostConsoleMessage(NSStringFromSelector(_cmd));
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
