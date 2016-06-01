//
//  SelectTimeViewController.h
//  Timetable
//
//  Created by Эдуард Рязапов on 23.01.16.
//  Copyright © 2016 Эдуард Рязапов. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectTimeViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIDatePicker *timePicker;
@property NSString *time;

@end
