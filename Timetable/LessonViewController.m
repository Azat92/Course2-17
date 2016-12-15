//
//  LessonViewController.m
//  Timetable
//
//  Created by Эдуард Рязапов on 23.01.16.
//  Copyright © 2016 Эдуард Рязапов. All rights reserved.
//

#import "LessonViewController.h"
#import "GroupViewController.h"
#import "EditLessonViewController.h"
#import "CoreDataManager.h"
#import "Lesson.h"
#import "Group.h"

@implementation LessonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _lessonNameLabel.title = _lesson.name;
    _teacherNameLabel.text = _lesson.teacher;
    _timeLabel.text = _lesson.time;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    [_groupButton setTitle: _lesson.group.name forState: UIControlStateNormal];
}

- (IBAction)editNewLesson:(UIStoryboardSegue *)segue {
    EditLessonViewController *controller = [segue sourceViewController];
    NSManagedObjectContext *moc = [CoreDataManager shared].managedObjectContext;
    _lesson.name = controller.lessonNameTextField.text;
    _lesson.teacher = controller.teachNameTextField.text;
    _lesson.time = controller.selectTimeButton.titleLabel.text;
    _lesson.group = controller.lesson.group;
    _lessonNameLabel.title = _lesson.name;
    _teacherNameLabel.text = _lesson.teacher;
    _timeLabel.text = _lesson.time;
    _groupButton.titleLabel.text = _lesson.group.name;
    [moc save:nil];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"lessonToEditLesson"]) {
        EditLessonViewController *editLessonController = (EditLessonViewController *)segue.destinationViewController;
        editLessonController.lesson = _lesson;
    }
    if ([segue.identifier isEqualToString:@"lessonToGroup"]) {
        GroupViewController *groupController = (GroupViewController *)segue.destinationViewController;
        groupController.group = _lesson.group;
    }
}

@end
