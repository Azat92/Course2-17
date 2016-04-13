//
//  MyTableViewController.m
//  Lesson17
//
//  Created by Мария Тимофеева on 10.04.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import "MyTableViewController.h"
#import "MyItem.h"
#import "TableViewCell.h"
#import "ItemsTableViewController.h"
@interface MyTableViewController () 
@property (nonatomic, readonly) id <DataAdapterProtocol> dbWorker;
@property (nonatomic, readonly) NSArray *users;
@end

@implementation MyTableViewController
@synthesize dbWorker = _dbWorker;
@synthesize users = _users;

- (id <DataAdapterProtocol>)dbWorker {
    if (!_dbWorker)
        _dbWorker = [CoreDataWorker new];
    return _dbWorker;
}

- (NSArray *)users {
    if (!_users)
        _users = self.dbWorker.myusersArray;
    return _users;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.users.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier =@"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    id <MyUserProtocol> user = self.users[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@. %@", user.uid, user.name];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UINavigationController *nc = self.splitViewController.viewControllers.lastObject;
    BOOL shouldntCreateController = self.splitViewController.viewControllers.count > 1;
    ItemsTableViewController *ivc =  shouldntCreateController ? nc.viewControllers.firstObject : [[self.storyboard instantiateViewControllerWithIdentifier:@"ItemsTVC"] viewControllers].firstObject;
    
    ivc.user = self.users[indexPath.row];
    ivc.dataWorker = self.dbWorker;
    if (!shouldntCreateController)
        [nc pushViewController:ivc animated:YES];
}
@end

