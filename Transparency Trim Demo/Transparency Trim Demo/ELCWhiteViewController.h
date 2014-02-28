//
//  ELCWhiteViewController.h
//  Transparency Trim Demo
//
//  Created by Blazej Stanek on 28.02.2014.
//  Copyright (c) 2013 Chris Stroud. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ELCWhiteViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *semiTransparentImageView;
@property (weak, nonatomic) IBOutlet UIImageView *originalImageView;
@property (weak, nonatomic) IBOutlet UIImageView *fullyOpaqueImageView;

@end
