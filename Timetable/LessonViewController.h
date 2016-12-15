//
//  LessonViewController.h
//  Timetable
//
//  Created by Эдуард Рязапов on 23.01.16.
//  Copyright © 2016 Эдуард Рязапов. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Lesson.h"

@interface LessonViewController : UIViewController

@property (weak, nonatomic) IBOutlet UINavigationItem *lessonNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *teacherNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIButton *groupButton;
@property Lesson *lesson;

@end
