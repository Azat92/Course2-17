//
//  EditLessonViewController.m
//  Timetable
//
//  Created by Эдуард Рязапов on 23.01.16.
//  Copyright © 2016 Эдуард Рязапов. All rights reserved.
//

#import "EditLessonViewController.h"
#import "SelectGroupTableViewController.h"
#import "SelectTimeViewController.h"
#import "Group.h"

@implementation EditLessonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _lessonNameTextField.text = _lesson.name;
    _teachNameTextField.text = _lesson.teacher;
    [_selectGroupButton setTitle: _lesson.group.name forState: UIControlStateNormal];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    [_selectGroupButton setTitle: _lesson.group.name forState: UIControlStateNormal];
}


- (IBAction)selectGroup1:(UIStoryboardSegue *)segue {
    SelectGroupTableViewController *controller = [segue sourceViewController];
    _lesson.group = controller.groups[controller.select];
    [_selectGroupButton setTitle: _lesson.group.name forState: UIControlStateNormal];
}

- (IBAction)selectTime:(UIStoryboardSegue *)segue {
    SelectTimeViewController *controller = [segue sourceViewController];
    [_selectTimeButton setTitle: controller.time forState: UIControlStateNormal];
}

@end
