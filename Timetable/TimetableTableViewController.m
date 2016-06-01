//
//  TimetableTableViewController.m
//  Timetable
//
//  Created by Эдуард Рязапов on 22.01.16.
//  Copyright © 2016 Эдуард Рязапов. All rights reserved.
//

#import "TimetableTableViewController.h"
#import "CoreDataManager.h"
#import "Lesson.h"

@implementation TimetableTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _lessons.count == 0 ? 1 : 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return section == 0 ? 1 : _lessons.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    if (indexPath.section == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"newGroupCell" forIndexPath:indexPath];
    } else {
        cell = [tableView dequeueReusableCellWithIdentifier:@"groupCell" forIndexPath:indexPath];
        cell.textLabel.text = [_lessons[indexPath.row] name];
    }
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return indexPath.section == 1;
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

@end
