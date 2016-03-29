//
//  CustomSplitViewController.m
//  Lesson17
//
//  Created by Azat Almeev on 29.03.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import "CustomSplitViewController.h"

@interface CustomSplitViewController () <UISplitViewControllerDelegate>

@end

@implementation CustomSplitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.preferredDisplayMode = UISplitViewControllerDisplayModeAllVisible;
    self.delegate = self;
}

- (BOOL)splitViewController:(UISplitViewController *)splitViewController collapseSecondaryViewController:(UIViewController *)secondaryViewController ontoPrimaryViewController:(UIViewController *)primaryViewController {
    return YES;
}

- (nullable UIViewController *)splitViewController:(UISplitViewController *)splitViewController separateSecondaryViewControllerFromPrimaryViewController:(UIViewController *)primaryViewController {
    UINavigationController *nc = [self.storyboard instantiateViewControllerWithIdentifier:@"GradesVC"];
    UINavigationController *master = (UINavigationController *)primaryViewController;
    if (master.viewControllers.count > 1) {
        UIViewController *last = master.viewControllers.lastObject;
        [master popViewControllerAnimated:NO];
        nc.viewControllers = @[ last ];
    }
    return nc;
}

@end
