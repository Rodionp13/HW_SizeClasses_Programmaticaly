//
//  ViewController+VCMethods.h
//  HW_SizeClasses_Programmaticaly
//
//  Created by User on 6/28/18.
//  Copyright © 2018 BNR. All rights reserved.
//

#import "ViewController.h"

@interface UIViewController (VCMethods)
- (void)sizeClassDidChange;
- (void) increaseConstantHeightOrWidthConstraint;
- (void) resetProperties;
@end
