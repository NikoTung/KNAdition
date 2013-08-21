//
//  AppDelegate.m
//  KNAdition
//
//  Created by Niko on 13-8-21.
//  Copyright (c) 2013年 Niko. All rights reserved.
//

#import "AppDelegate.h"
#import "NSDictionaryAdditions.h"
#import "UIImage+RoundedCorner.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor blueColor];
    [self.window makeKeyAndVisible];
    
//    NSDictionary *d = [NSDictionary dictionaryWithObject:@"Wed Aug 21 11:26:35 +0800 2013" forKey:@"created_at"];
//    
//    time_t time = [d getTimeValueForKey:@"created_at" defaultValue:12345678];
//    NSLog(@"time %ld",time);
    
    UIImage *image = [UIImage imageNamed:@"ios.png"];
    UIImage *imageP = [image imageWithRadius:50.0 width:image.size.width height:image.size.height];
    NSLog(@"size:%@  imagep:%@",NSStringFromCGSize(image.size),NSStringFromCGSize(imageP.size));
    UIImageView *vi = [[UIImageView alloc] initWithImage:imageP];
    [vi setFrame:CGRectMake(50, 50, imageP.size.width, imageP.size.height)];
    [self.window addSubview:vi];
    
    return YES;
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
