//
//  EditGroupViewController.h
//  Timetable
//
//  Created by Эдуард Рязапов on 23.01.16.
//  Copyright © 2016 Эдуард Рязапов. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Group.h"

@interface EditGroupViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *groupNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *elderNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property Group *group;

@end