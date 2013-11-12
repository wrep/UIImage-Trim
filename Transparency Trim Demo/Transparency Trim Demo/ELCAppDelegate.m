//
//  ELCAppDelegate.m
//  Transparency Trim Demo
//
//  Created by Chris Stroud on 6/26/13.
//  Copyright (c) 2013 Chris Stroud. All rights reserved.
//

#import "ELCAppDelegate.h"

#import "ELCViewController.h"

@implementation ELCAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
	self.viewController = [[ELCViewController alloc] initWithNibName:@"ELCViewController" bundle:nil];
	self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
	
    return YES;
}

@end
