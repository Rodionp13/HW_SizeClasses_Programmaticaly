//
//  ViewController.m
//  HW_SizeClasses_Programmaticaly
//
//  Created by User on 6/28/18.
//  Copyright © 2018 BNR. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.firstView = [[UIView alloc] initWithFrame: CGRectZero];
    [self.firstView setBackgroundColor:UIColor.orangeColor];
    self.sencondView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.sencondView setBackgroundColor:UIColor.greenColor];
    self.firstBttn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.firstBttn setBackgroundColor:UIColor.blueColor];
    [self.firstBttn setTitle:@"First" forState:UIControlStateNormal];
    self.secondBttn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.secondBttn setBackgroundColor:UIColor.blueColor];
    [self.secondBttn setTitle:@"Second" forState:UIControlStateNormal];
    [self setFirstBttnIsTapped:NO];
    [self setSecondBttnIsTapped:NO];
    
    [self.view addSubview:self.firstView];
    [self.view addSubview:self.sencondView];
    [self.view addSubview:self.firstBttn];
    [self.view addSubview:self.secondBttn];
    
    [self.firstView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.sencondView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.firstBttn setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.secondBttn setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    //Common Constraints
    self.sharedConstraintsForViews = @{@"equalHeight":[NSLayoutConstraint constraintWithItem:self.firstView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.sencondView attribute:NSLayoutAttributeHeight multiplier:1.f constant:0],
                                       @"equalWidth":[NSLayoutConstraint constraintWithItem:self.firstView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.sencondView attribute:NSLayoutAttributeWidth multiplier:1.f constant:0],
                                       @"topFirstView":[NSLayoutConstraint constraintWithItem:self.firstView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view.safeAreaLayoutGuide attribute:NSLayoutAttributeTop multiplier:1.f constant:10.f],
                                       @"leadingFirstView":[NSLayoutConstraint constraintWithItem:self.firstView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view.safeAreaLayoutGuide attribute:NSLayoutAttributeLeading multiplier:1.f constant:10.f],
                                       @"leadingFirstToSecond":[NSLayoutConstraint constraintWithItem:self.firstView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.sencondView attribute:NSLayoutAttributeLeading multiplier:1.f constant:0],
                                       @"bottomFirstView":[NSLayoutConstraint constraintWithItem:self.firstView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.sencondView attribute:NSLayoutAttributeTop multiplier:1.f constant:-10.f],
                                       @"trailingSecondView":[NSLayoutConstraint constraintWithItem:self.sencondView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view.safeAreaLayoutGuide attribute:NSLayoutAttributeTrailing multiplier:1.f constant:-10.f],
                                       @"bottomSecondView":[NSLayoutConstraint constraintWithItem:self.sencondView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view.safeAreaLayoutGuide attribute:NSLayoutAttributeBottom multiplier:1.f constant:-10.f]
                                       };
    [NSLayoutConstraint activateConstraints:[self.sharedConstraintsForViews allValues]];
    
    //Constarints for horizontal sizeClass:Regular
    self.horizontalSizeClassRegularConstraints = @{@"leadingSecondView":[NSLayoutConstraint constraintWithItem:self.sencondView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.firstView attribute:NSLayoutAttributeTrailing multiplier:1.f constant:10.f],
                                                   @"topSecondToFirst":[NSLayoutConstraint constraintWithItem:self.sencondView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.firstView attribute:NSLayoutAttributeTop multiplier:1.f constant:0]
                                                   };
    
    
    [self setConstraintsForButtons:@[[self.firstBttn.centerXAnchor       constraintEqualToAnchor:self.firstView.centerXAnchor]
        ,[self.firstBttn.centerYAnchor constraintEqualToAnchor:self.firstView.centerYAnchor],[self.secondBttn.centerXAnchor constraintEqualToAnchor:self.sencondView.centerXAnchor]
                ,[self.secondBttn.centerYAnchor constraintEqualToAnchor:self.sencondView.centerYAnchor]]];
    [NSLayoutConstraint activateConstraints:self.constraintsForButtons];
    
    [self.firstBttn addTarget:self action:@selector(firstTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.secondBttn addTarget:self action:@selector(secondBttnTapped:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    [self sizeClassDidChange];
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];//NSLog(@"Old UI");
    
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        [self resetProperties];//NSLog(@"UI Will Change");
    } completion:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
//        NSLog(@"UI Did Change");
    }];
}
    
    
- (void)firstTapped:(id)sender {
    [self setFirstBttnIsTapped:YES];
    [self increaseConstantHeightOrWidthConstraint];//NSLog(@"Tapped");
}

- (void)secondBttnTapped:(id)sender {
    [self setSecondBttnIsTapped:YES];
    [self increaseConstantHeightOrWidthConstraint];//NSLog(@"Tapped2");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
