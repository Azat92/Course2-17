//
//  SelectTimeViewController.m
//  Timetable
//
//  Created by Эдуард Рязапов on 23.01.16.
//  Copyright © 2016 Эдуард Рязапов. All rights reserved.
//

#import "SelectTimeViewController.h"

@interface SelectTimeViewController ()

@end

@implementation SelectTimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSDateFormatter *formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:@"HH : mm"];
    _time = [formater stringFromDate:_timePicker.date];
}

@end
