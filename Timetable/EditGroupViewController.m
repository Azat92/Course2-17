//
//  EditGroupViewController.m
//  Timetable
//
//  Created by Эдуард Рязапов on 23.01.16.
//  Copyright © 2016 Эдуард Рязапов. All rights reserved.
//

#import "EditGroupViewController.h"

@interface EditGroupViewController ()

@end

@implementation EditGroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _groupNameTextField.text = _group.name;
    _elderNameTextField.text = _group.elderName;
    _phoneNumberTextField.text = _group.phoneNumber;
    _emailTextField.text = _group.email;
}

@end
