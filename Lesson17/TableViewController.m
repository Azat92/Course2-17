//
//  ViewController.m
//  Lesson17
//
//  Created by Azat Almeev on 12.03.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import "TableViewController.h"
#import "BooksTableViewController.h"
#import "User.h"

@interface TableViewController ()
@property (nonatomic, readonly) DatabaseWorker *dbWorker;
@property (nonatomic, readonly) NSArray *users;
@end

@implementation TableViewController
@synthesize dbWorker = _dbWorker;
@synthesize users = _users;

- (DatabaseWorker *)dbWorker {
    if (!_dbWorker)
        _dbWorker = [DatabaseWorker new];
    return _dbWorker;
}

- (NSArray *)users {
    if (!_users)
        _users = self.dbWorker.usersArray;
    return _users;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ShowBooksSegue"]) {
        BooksTableViewController *dvc = segue.destinationViewController;
        dvc.dbWorker = self.dbWorker;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.users.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"UserCellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    User *user = self.users[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@. %@", user.uid, user.name];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Rating: %.2f", [user.rating doubleValue]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
