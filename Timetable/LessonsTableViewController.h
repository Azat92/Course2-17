//
//  LessonsTableViewController.h
//  Timetable
//
//  Created by Эдуард Рязапов on 22.01.16.
//  Copyright © 2016 Эдуард Рязапов. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LessonsTableViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UINavigationItem *weekdayItem;
@property NSInteger dayNumber;

@end
