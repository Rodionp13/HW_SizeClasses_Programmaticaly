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
        if(self.sharedConstraintsForViews.count > 0 && [self.self.sharedConstraintsForViews objectAtIndex:0].isActive) {
            [NSLayoutConstraint deactivateConstraints:self.self.sharedConstraintsForViews];
        }
        if(self.horizontalSizeClassCompactConstraints.count > 0 && !self.horizontalSizeClassCompactConstraints[0].isActive) {
            [NSLayoutConstraint activateConstraints:self.horizontalSizeClassCompactConstraints];
        }
    } else {
        [NSLayoutConstraint deactivateConstraints:self.horizontalSizeClassCompactConstraints];
        [NSLayoutConstraint activateConstraints:self.sharedConstraintsForViews];
    }
}
@end
