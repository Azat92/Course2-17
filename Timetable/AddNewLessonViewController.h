//
//  AddNewLessonViewController.h
//  Timetable
//
//  Created by Эдуард Рязапов on 22.01.16.
//  Copyright © 2016 Эдуард Рязапов. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Group.h"

@interface AddNewLessonViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *lessonNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *teacherNameTextField;
@property (weak, nonatomic) IBOutlet UIButton *selectGroupButton;
@property Group *group;
@property (weak, nonatomic) IBOutlet UIButton *selectTimeButton;

@end
