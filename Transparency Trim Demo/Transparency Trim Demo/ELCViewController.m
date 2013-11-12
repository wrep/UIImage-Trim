//
//  ELCViewController.m
//  Transparency Trim Demo
//
//  Created by Chris Stroud on 6/26/13.
//  Copyright (c) 2013 Chris Stroud. All rights reserved.
//

#import "ELCViewController.h"
#import "UIImage+Trim.h"

@implementation ELCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	UIImage *originalImage = [UIImage imageNamed:@"demo_image"];
	UIImage *semiTransparentCrop = [originalImage imageByTrimmingTransparentPixelsRequiringFullOpacity:NO];
	UIImage *fullOpacityCrop = [originalImage imageByTrimmingTransparentPixelsRequiringFullOpacity:YES];
	
	[self.originalImageView setImage:originalImage];
	[self.semiTransparentImageView setImage:semiTransparentCrop];
	[self.fullyOpaqueImageView setImage:fullOpacityCrop];
}

@end
