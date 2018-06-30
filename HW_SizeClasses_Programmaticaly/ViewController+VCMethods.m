//
//  ViewController+VCMethods.m
//  HW_SizeClasses_Programmaticaly
//
//  Created by User on 6/28/18.
//  Copyright © 2018 BNR. All rights reserved.
//

#import "ViewController+VCMethods.h"

@implementation ViewController (VCMethods)

- (void)sizeClassDidChange {
    if(self.traitCollection.horizontalSizeClass == UIUserInterfaceSizeClassRegular) {
        if(self.sharedConstraintsForViews.count > 0 && [[[self.sharedConstraintsForViews allValues] objectAtIndex:0] isActive]) {
            [NSLayoutConstraint deactivateConstraints:[self.sharedConstraintsForViews objectsForKeys:@[@"leadingFirstToSecond", @"bottomFirstView"] notFoundMarker:[NSNull null]]];
        }
        if(self.horizontalSizeClassRegularConstraints.count > 0 && ![[self.horizontalSizeClassRegularConstraints.allValues objectAtIndex:0] isActive]) {
            [NSLayoutConstraint activateConstraints:[self.horizontalSizeClassRegularConstraints allValues]];
        }
        
    } else {
        [NSLayoutConstraint deactivateConstraints:[self.horizontalSizeClassRegularConstraints allValues]];
        [NSLayoutConstraint activateConstraints:[self.sharedConstraintsForViews objectsForKeys:@[@"leadingFirstToSecond", @"bottomFirstView"] notFoundMarker:[NSNull null]]];
    }
    [self resetProperties];
}

- (void) increaseConstantHeightOrWidthConstraint {
    CGFloat constatnH = self.view.frame.size.height * 0.3;
    CGFloat constantW = self.view.frame.size.width * 0.3;
    if(self.traitCollection.horizontalSizeClass == UIUserInterfaceSizeClassCompact) {
        if(self.firstBttnIsTapped) {
            NSLog(@"first1 YES, second1 NO");
            [[self.sharedConstraintsForViews objectForKey:@"equalHeight"] setConstant:-constatnH];
        } else {
            NSLog(@"first2 NO, second2 YES");
            [[self.sharedConstraintsForViews objectForKey:@"equalHeight"] setConstant:constatnH];
        }
    }
    if(self.traitCollection.horizontalSizeClass == UIUserInterfaceSizeClassRegular) {
        if(self.firstBttnIsTapped == YES && self.secondBttnIsTapped == NO) {
            NSLog(@"first YES, second NO");
            [[self.sharedConstraintsForViews objectForKey:@"equalWidth"] setConstant:-constantW];
        } else {
            NSLog(@"first NO, second YES");
            [[self.sharedConstraintsForViews objectForKey:@"equalWidth"] setConstant:constantW];
        }
    }
    [UIView animateWithDuration:0.5f animations:^{
        [self.view layoutIfNeeded];
    }];
    [self firstOrSecondBttnsIsTapped];
}

- (void) firstOrSecondBttnsIsTapped {
    if(self.firstBttnIsTapped == YES && self.secondBttnIsTapped == NO) {
        [self.firstBttn setEnabled:NO];
        [self setFirstBttnIsTapped:NO];
        [self setSecondBttnIsTapped:YES];
        [self.secondBttn setEnabled:YES];
    } else {
        [self setSecondBttnIsTapped:NO];
        [self.secondBttn setEnabled:NO];
        [self setFirstBttnIsTapped:YES];
        [self.firstBttn setEnabled:YES];
    }
}

- (void) resetProperties {
    [[self.sharedConstraintsForViews objectForKey:@"equalHeight"] setConstant:0];
    [[self.sharedConstraintsForViews objectForKey:@"equalWidth"] setConstant:0];
    [self setFirstBttnIsTapped:NO];
    [self setSecondBttnIsTapped:NO];
    [self.firstBttn setEnabled:YES];
    [self.secondBttn setEnabled:YES];
}
@end
