//
//  ELCViewController.h
//  Transparency Trim Demo
//
//  Created by Chris Stroud on 6/26/13.
//  Copyright (c) 2013 Chris Stroud. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ELCViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *semiTransparentImageView;
@property (weak, nonatomic) IBOutlet UIImageView *originalImageView;
@property (weak, nonatomic) IBOutlet UIImageView *fullyOpaqueImageView;

@end
