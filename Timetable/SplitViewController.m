//
//  SplitViewController.m
//  Timetable
//
//  Created by Эдуард Рязапов on 02.06.16.
//  Copyright © 2016 Эдуард Рязапов. All rights reserved.
//

#import "SplitViewController.h"

@interface SplitViewController ()

@end

@implementation SplitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.preferredDisplayMode = UISplitViewControllerDisplayModeAllVisible;
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
