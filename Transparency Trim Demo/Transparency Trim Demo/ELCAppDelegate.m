//
//  ELCAppDelegate.m
//  Transparency Trim Demo
//
//  Created by Chris Stroud on 6/26/13.
//  Copyright (c) 2013 Chris Stroud. All rights reserved.
//

#import "ELCAppDelegate.h"

#import "ELCWhiteViewController.h"

@implementation ELCAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
	self.viewController = [[ELCWhiteViewController alloc] initWithNibName:@"ELCWhiteViewController" bundle:nil];
	self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
	
    return YES;
}

@end
