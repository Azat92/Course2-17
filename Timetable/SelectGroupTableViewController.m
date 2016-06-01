//
//  SelectGroupTableViewController.m
//  Timetable
//
//  Created by Эдуард Рязапов on 22.01.16.
//  Copyright © 2016 Эдуард Рязапов. All rights reserved.
//

#import "SelectGroupTableViewController.h"
#import "Group.h"
#import "CoreDataManager.h"

@implementation SelectGroupTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Group"];
    NSManagedObjectContext *moc = [CoreDataManager shared].managedObjectContext;
    _groups = [NSMutableArray new];
    [_groups addObjectsFromArray:[moc executeFetchRequest:request error:nil]];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _groups.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"groupCell" forIndexPath:indexPath];
    cell.textLabel.text = [_groups[indexPath.row] name];
    return cell;
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    _select = indexPath.row;
    return indexPath;
}

@end
