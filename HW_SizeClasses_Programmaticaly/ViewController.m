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
@synthesize firstView = _firstView, sencondView = _secondView;

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
    
    [self.view addSubview:self.firstView];
    [self.view addSubview:self.sencondView];
    [self.view addSubview:self.firstBttn];
    [self.view addSubview:self.secondBttn];
    
    [self.firstView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.sencondView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.firstBttn setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.secondBttn setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    //Example
    NSLayoutConstraint *equalHeight = [NSLayoutConstraint constraintWithItem:self.sencondView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.firstView attribute:NSLayoutAttributeHeight multiplier:1.f constant:0];
    NSLayoutConstraint *bottomFirstView = [NSLayoutConstraint constraintWithItem:self.firstView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.sencondView attribute:NSLayoutAttributeTop multiplier:1.f constant:-10];
    
    self.horizontalSizeClassCompactConstraints = @[];
    
    [self setSharedConstraintsForViews:@[bottomFirstView, [self.firstView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:10], [self.firstView.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor constant:10], [self.firstView.centerXAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.centerXAnchor], [self.sencondView.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor constant:10], [self.sencondView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor constant:-10], [self.sencondView.centerXAnchor constraintEqualToAnchor:self.firstView.centerXAnchor], equalHeight]];
    [NSLayoutConstraint activateConstraints:self.sharedConstraintsForViews];
    
    [self setConstraintsForButtons:@[[self.firstBttn.centerXAnchor       constraintEqualToAnchor:self.firstView.centerXAnchor]
        ,[self.firstBttn.centerYAnchor constraintEqualToAnchor:self.firstView.centerYAnchor],[self.secondBttn.centerXAnchor constraintEqualToAnchor:self.sencondView.centerXAnchor]
                ,[self.secondBttn.centerYAnchor constraintEqualToAnchor:self.sencondView.centerYAnchor]]];
    [NSLayoutConstraint activateConstraints:self.constraintsForButtons];
    
    
    [self.firstBttn addTarget:self action:@selector(firstTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.secondBttn addTarget:self action:@selector(secondBttnTapped:) forControlEvents:UIControlEventTouchUpInside];
}



- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    NSLog(@"Old UI %lu", [UIApplication sharedApplication].statusBarOrientation);
    
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        NSLog(@"UI Will Change");
        [self sizeClassDidChange];
    } completion:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        NSLog(@"UI Did Change");
    }];
}
    
    
- (void)firstTapped:(id)sender {
    NSLog(@"Tapped");
    [self.sharedConstraintsForViews lastObject].constant = 300;
}

- (void)secondBttnTapped:(id)sender {
    NSLog(@"Tapped2");
    [self.sharedConstraintsForViews lastObject].constant = -300;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
