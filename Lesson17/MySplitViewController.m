//
//  MySplitViewController.m
//  Lesson17
//
//  Created by Мария Тимофеева on 10.04.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import "MySplitViewController.h"

@interface MySplitViewController () <UISplitViewControllerDelegate>

@end

@implementation MySplitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.preferredDisplayMode = UISplitViewControllerDisplayModeAllVisible;
    self.delegate = self;
}

- (BOOL)splitViewController:(UISplitViewController *)splitViewController collapseSecondaryViewController:(UIViewController *)secondaryViewController ontoPrimaryViewController:(UIViewController *)primaryViewController {
    return YES;
}

- (nullable UIViewController *)splitViewController:(UISplitViewController *)splitViewController separateSecondaryViewControllerFromPrimaryViewController:(UIViewController *)primaryViewController {
    UINavigationController *nc = [self.storyboard instantiateViewControllerWithIdentifier:@"ItemsTVC"];
    UINavigationController *master = (UINavigationController *)primaryViewController;
    if (master.viewControllers.count > 1) {
        UIViewController *last = master.viewControllers.lastObject;
        [master popViewControllerAnimated:NO];
        nc.viewControllers = @[ last ];
    }
    return nc;
}
@end
