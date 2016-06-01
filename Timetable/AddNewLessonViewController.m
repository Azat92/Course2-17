//
//  AddNewLessonViewController.m
//  Timetable
//
//  Created by Эдуард Рязапов on 22.01.16.
//  Copyright © 2016 Эдуард Рязапов. All rights reserved.
//

#import "AddNewLessonViewController.h"
#import "SelectGroupTableViewController.h"
#import "SelectTimeViewController.h"

@interface AddNewLessonViewController ()

@property NSInteger *weekday;

@end

@implementation AddNewLessonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)selectGroup:(UIStoryboardSegue *)segue {
    SelectGroupTableViewController *controller = [segue sourceViewController];
    _group = controller.groups[controller.select];
    [_selectGroupButton setTitle: _group.name forState: UIControlStateNormal];
}

- (IBAction)selectTime:(UIStoryboardSegue *)segue {
    SelectTimeViewController *controller = [segue sourceViewController];
    [_selectTimeButton setTitle: controller.time forState: UIControlStateNormal];
}

@end
