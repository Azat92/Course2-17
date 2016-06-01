//
//  LessonsTableViewController.m
//  Timetable
//
//  Created by Эдуард Рязапов on 22.01.16.
//  Copyright © 2016 Эдуард Рязапов. All rights reserved.
//

#import "LessonsTableViewController.h"
#import "AddNewLessonViewController.h"
#import "LessonViewController.h"
#import "TableViewCell.h"
#import "CoreDataManager.h"
#import "Lesson.h"

@interface LessonsTableViewController ()

@property NSMutableArray *lessons;
@property NSInteger currentLesson;

@end

@implementation LessonsTableViewController

//static NSString *lessonCell = @"lessonCell";

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.tableView registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:nil] forCellReuseIdentifier:lessonCell];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Lesson"];
    NSManagedObjectContext *moc = [CoreDataManager shared].managedObjectContext;
    NSPredicate *predicate = [NSPredicate predicateWithFormat: @"weekday == %ld", _dayNumber];
    NSArray *sortDescriptors = @[[[NSSortDescriptor alloc] initWithKey:@"time" ascending:YES]];
    [request setPredicate:predicate];
    [request setSortDescriptors:sortDescriptors];
    _lessons = [NSMutableArray new];
    [_lessons addObjectsFromArray:[moc executeFetchRequest:request error:nil]];
    switch (_dayNumber) {
        case 0:
            _weekdayItem.title = @"Понедельник";
            break;
        case 1:
            _weekdayItem.title = @"Вторник";
            break;
        case 2:
            _weekdayItem.title = @"Среда";
            break;
        case 3:
            _weekdayItem.title = @"Четверг";
            break;
        case 4:
            _weekdayItem.title = @"Пятница";
            break;
        case 5:
            _weekdayItem.title = @"Суббота";
            break;
        default:
            break;
    }

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _lessons.count;
}

- (IBAction)addNewLesson:(UIStoryboardSegue *)segue {
    AddNewLessonViewController *controller = [segue sourceViewController];
    NSManagedObjectContext *moc = [CoreDataManager shared].managedObjectContext;
    Lesson *lesson = [NSEntityDescription insertNewObjectForEntityForName:@"Lesson" inManagedObjectContext:moc];
    lesson.name = controller.lessonNameTextField.text;
    lesson.teacher = controller.teacherNameTextField.text;
    lesson.time = controller.selectTimeButton.titleLabel.text;
    lesson.weekday = @(_dayNumber);
    lesson.group = controller.group;
    [moc save:nil];
    [_lessons addObject:lesson];
    [self.tableView reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"lessonCellStoryBoard"];
    cell.textLabel.text = [_lessons[indexPath.row] name];
//    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:lessonCell];
//    cell.timeLabel.text = [_lessons[indexPath.row] time];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    Lesson *lesson = _lessons[indexPath.row];
    NSManagedObjectContext *moc = [CoreDataManager shared].managedObjectContext;
    [_lessons removeObjectAtIndex:indexPath.row];
    [moc deleteObject:lesson];
    [moc save:nil];
    if (_lessons.count != 0) {
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        return;
    }
    [self.tableView reloadData];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"lessonsToLesson"]) {
        LessonViewController *lessonController = (LessonViewController *)segue.destinationViewController;
        lessonController.lesson = _lessons[_currentLesson];
    }
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    _currentLesson = indexPath.row;
    return indexPath;
}

@end
