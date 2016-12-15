//
//  GroupsTableViewController.m
//  Timetable
//
//  Created by Эдуард Рязапов on 22.01.16.
//  Copyright © 2016 Эдуард Рязапов. All rights reserved.
//

#import "GroupsTableViewController.h"
#import "GroupViewController.h"
#import "NewGroupViewController.h"
#import "CoreDataManager.h"
#import "Group.h"
#import "Student.h"

@interface GroupsTableViewController ()

@property NSInteger groupIndex;
- (NSMutableArray *)groups;


@end

@implementation GroupsTableViewController

- (NSMutableArray*)groups {
    static NSMutableArray* theArray = nil;
    if (theArray == nil) {
        theArray = [[NSMutableArray alloc] init];
    }
    return theArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Group"];
    NSManagedObjectContext *moc = [CoreDataManager shared].managedObjectContext;
    if (self.groups.count == 0) {
        [self.groups addObjectsFromArray:[moc executeFetchRequest:request error:nil]];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.groups.count == 0 ? 1 : 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return section == 0 ? 1 : self.groups.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    if (indexPath.section == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"newGroupCell" forIndexPath:indexPath];
    } else {
        cell = [tableView dequeueReusableCellWithIdentifier:@"groupCell" forIndexPath:indexPath];
        cell.textLabel.text = [self.groups[indexPath.row] name];
    }
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return indexPath.section == 1;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    Group *group = self.groups[indexPath.row];
    NSManagedObjectContext *moc = [CoreDataManager shared].managedObjectContext;
    [self.groups removeObjectAtIndex:indexPath.row];
    [moc deleteObject:group];
    [moc save:nil];
    [[[[[self.splitViewController.viewControllers firstObject] viewControllers] firstObject] tableView] reloadData];
    [[[[[self.splitViewController.viewControllers[1] viewControllers][1] viewControllers] firstObject] tableView] reloadData];
}

- (IBAction)addNewGroup:(UIStoryboardSegue *)segue {
    NewGroupViewController *controller = [segue sourceViewController];
    NSManagedObjectContext *moc = [CoreDataManager shared].managedObjectContext;
    Group *group = [NSEntityDescription insertNewObjectForEntityForName:@"Group" inManagedObjectContext:moc];
    group.name = controller.groupNameTextField.text;
    group.elderName = controller.elderNameTextField.text;
    group.phoneNumber = controller.phoneNumberTextField.text;
    group.email = controller.mailTextField.text;
    [moc save:nil];
    [self.groups addObject:group];
    [[[[[self.splitViewController.viewControllers firstObject] viewControllers] firstObject] tableView] reloadData];
    [[[[[self.splitViewController.viewControllers[1] viewControllers][1] viewControllers] firstObject] tableView] reloadData];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"groupsToGroup"]) {
        GroupViewController *groupController = (GroupViewController *)segue.destinationViewController;
        groupController.group = self.groups[_groupIndex];
    }
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    _groupIndex = indexPath.row;
    return indexPath;
}

@end
