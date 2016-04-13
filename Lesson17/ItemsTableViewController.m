//
//  ItemsTableViewController.m
//  Lesson17
//
//  Created by Мария Тимофеева on 10.04.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import "ItemsTableViewController.h"
#import "MyItem+CoreDataProperties.h"

@implementation ItemsTableViewController
- (void)setUser:(MyUser *)user {
    _user = user;
    if (_user)
        self.title = _user.name;
    else
        self.title = @"Items";
    [self.tableView reloadData];
}

- (IBAction)addButtonDidClick:(id)sender {
    if (!self.user)
        return;
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Add item" message:@"Please enter name and description" preferredStyle:UIAlertControllerStyleAlert];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"Name";
        textField.keyboardType = UIKeyboardTypeDecimalPad;
    }];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"Description";
        textField.keyboardType = UIKeyboardTypeDecimalPad;
    }];
    __weak UIAlertController *walert = alert;
    [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UITextField *nf = walert.textFields[0];
        UITextField *df = walert.textFields[1];
        NSString *name = nf.text;
        NSString *description = df.text;
        if (name.length>0 && description.length>0) {
            MyItem *item = [NSEntityDescription insertNewObjectForEntityForName:@"MyItem" inManagedObjectContext:self.dataWorker.managedObjectContext];
            item.name = name;
            item.descriptions = description;
            item.user = self.user;
            [self.dataWorker saveContext];
            [self.tableView insertRowsAtIndexPaths:@[ [NSIndexPath indexPathForRow:self.user.items.count - 1 inSection:0] ] withRowAnimation:UITableViewRowAnimationAutomatic];
        }
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.user.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier =@"ItemCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    NSLog(@"%lu", self.user.items.count);
    NSLog(@"%lu", indexPath.row);
    
    
    MyItem *item = (MyItem *)self.user.items[indexPath.row];
    cell.textLabel.text = item.name;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    MyItem *item = (MyItem *)self.user.items[indexPath.row];
    [self.dataWorker.managedObjectContext deleteObject:item];
    [self.dataWorker saveContext];
    [self.tableView deleteRowsAtIndexPaths:@[ indexPath ] withRowAnimation:UITableViewRowAnimationAutomatic];
}

@end
