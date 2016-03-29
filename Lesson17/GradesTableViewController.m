//
//  GradesTableViewController.m
//  Lesson17
//
//  Created by Azat Almeev on 29.03.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import "GradesTableViewController.h"
#import "CDGrade.h"
#import "CoreDataWorker.h"

@interface GradesTableViewController ()

@end

@implementation GradesTableViewController

- (void)setUser:(CDUser *)user {
    _user = user;
    if (_user)
        self.title = _user.name;
    else
        self.title = @"Grades";
    [self.tableView reloadData];
}

- (IBAction)addButtonDidClick:(id)sender {
    if (!self.user)
        return;
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Add grade" message:@"Please enter value" preferredStyle:UIAlertControllerStyleAlert];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"Value should be greater than zero";
        textField.keyboardType = UIKeyboardTypeDecimalPad;
    }];
    __weak UIAlertController *walert = alert;
    [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UITextField *tf = walert.textFields.firstObject;
        double value = [tf.text doubleValue];
        if (value > 0) {
            CDGrade *grade = [NSEntityDescription insertNewObjectForEntityForName:@"CDGrade" inManagedObjectContext:self.dataWorker.managedObjectContext];
            grade.value = @(value);
            grade.user = self.user;
            [self.dataWorker saveContext];
            [self.tableView insertRowsAtIndexPaths:@[ [NSIndexPath indexPathForRow:self.user.grades.count - 1 inSection:0] ] withRowAnimation:UITableViewRowAnimationAutomatic];
        }
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.user.grades.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GradeCell" forIndexPath:indexPath];
    CDGrade *grade = (CDGrade *)self.user.grades[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%.2f", [grade.value doubleValue]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    CDGrade *grade = (CDGrade *)self.user.grades[indexPath.row];
    [self.dataWorker.managedObjectContext deleteObject:grade];
    [self.dataWorker saveContext];
    [self.tableView deleteRowsAtIndexPaths:@[ indexPath ] withRowAnimation:UITableViewRowAnimationAutomatic];
}

@end
