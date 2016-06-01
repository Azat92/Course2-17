//
//  GroupViewController.h
//  Timetable
//
//  Created by Эдуард Рязапов on 23.01.16.
//  Copyright © 2016 Эдуард Рязапов. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Group.h"

@interface GroupViewController : UIViewController

@property (weak, nonatomic) IBOutlet UINavigationItem *groupNameItem;
@property (weak, nonatomic) IBOutlet UILabel *elderNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;
@property Group *group;

@end
