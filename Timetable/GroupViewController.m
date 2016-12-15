//
//  GroupViewController.m
//  Timetable
//
//  Created by Эдуард Рязапов on 23.01.16.
//  Copyright © 2016 Эдуард Рязапов. All rights reserved.
//

#import "GroupViewController.h"
#import "EditGroupViewController.h"
#import "CoreDataManager.h"

@interface GroupViewController ()

@end

@implementation GroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _elderNameLabel.text = _group.elderName;
    _groupNameItem.title = _group.name;
    _phoneNumberLabel.text = _group.phoneNumber;
    _emailLabel.text = _group.email;
}

- (IBAction)editGroup:(UIStoryboardSegue *)segue {
    EditGroupViewController *controller = [segue sourceViewController];
    NSManagedObjectContext *moc = [CoreDataManager shared].managedObjectContext;
    _group.name = controller.groupNameTextField.text;
    _group.elderName = controller.elderNameTextField.text;
    _group.phoneNumber = controller.phoneNumberTextField.text;
    _group.email = controller.emailTextField.text;
    _groupNameItem.title = _group.name;
    _elderNameLabel.text = _group.elderName;
    _phoneNumberLabel.text = _group.phoneNumber;
    _emailLabel.text = _group.email;
    [moc save:nil];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"groupToEditGroup"]) {
        EditGroupViewController *editController = (EditGroupViewController *)segue.destinationViewController;
        editController.group = _group;
    }
}

@end
