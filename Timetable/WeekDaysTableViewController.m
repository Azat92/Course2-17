//
//  WeekDaysTableViewController.m
//  Timetable
//
//  Created by Эдуард Рязапов on 22.01.16.
//  Copyright © 2016 Эдуард Рязапов. All rights reserved.
//

#import "WeekDaysTableViewController.h"
#import "LessonsTableViewController.h"

@interface WeekDaysTableViewController ()

@property NSInteger dayNumber;

@end

@implementation WeekDaysTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"weekdayCell" forIndexPath:indexPath];
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"Понедельник";
            break;
        case 1:
            cell.textLabel.text = @"Вторник";
            break;
        case 2:
            cell.textLabel.text = @"Среда";
            break;
        case 3:
            cell.textLabel.text = @"Четверг";
            break;
        case 4:
            cell.textLabel.text = @"Пятница";
            break;
        case 5:
            cell.textLabel.text = @"Суббота";
            break;
        default:
            break;
    }
    return cell;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"weekdayToLessons"]) {
        LessonsTableViewController *lessonsController = (LessonsTableViewController *)segue.destinationViewController;
        lessonsController.dayNumber =_dayNumber;
    }
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    _dayNumber = indexPath.row;
    return indexPath;
}

@end
