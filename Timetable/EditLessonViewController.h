//
//  EditLessonViewController.h
//  Timetable
//
//  Created by Эдуард Рязапов on 23.01.16.
//  Copyright © 2016 Эдуард Рязапов. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Lesson.h"

@interface EditLessonViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *lessonNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *teachNameTextField;
@property (weak, nonatomic) IBOutlet UIButton *selectGroupButton;
@property Lesson *lesson;
@property (weak, nonatomic) IBOutlet UIButton *selectTimeButton;

@end
