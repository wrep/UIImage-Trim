//
//  ELCWhiteViewController.m
//  Transparency Trim Demo
//
//  Created by Blazej Stanek on 28.02.2014.
//  Copyright (c) 2013 Chris Stroud. All rights reserved.
//

#import "ELCWhiteViewController.h"
#import "UIImage+Trim.h"

@implementation ELCWhiteViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	UIImage *originalImage = [UIImage imageNamed:@"demo_white_image"];
	UIImage *semiTransparentCrop = [originalImage imageByTrimmingWhitePixelsWithOpacity:24];
	UIImage *fullOpacityCrop = [originalImage imageByTrimmingWhitePixelsWithOpacity:64];
	
	[self.originalImageView setImage:originalImage];
	[self.semiTransparentImageView setImage:semiTransparentCrop];
	[self.fullyOpaqueImageView setImage:fullOpacityCrop];
}

@end
