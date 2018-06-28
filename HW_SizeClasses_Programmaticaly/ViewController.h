//
//  ViewController.h
//  HW_SizeClasses_Programmaticaly
//
//  Created by User on 6/28/18.
//  Copyright © 2018 BNR. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController+VCMethods.h"

@interface ViewController : UIViewController
@property(copy, nonatomic) NSArray<NSLayoutConstraint*> *sharedConstraintsForViews;
@property(copy, nonatomic) NSArray<NSLayoutConstraint*> *constraintsForButtons;
@property(copy, nonatomic) NSArray<NSLayoutConstraint*> *horizontalSizeClassCompactConstraints;
@property(strong, nonatomic) UIView *firstView;
@property(strong, nonatomic) UIView *sencondView;
@property(strong, nonatomic) UIButton *firstBttn;
@property(strong, nonatomic) UIButton *secondBttn;


@end

