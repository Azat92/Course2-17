//
//  Lesson+CoreDataProperties.m
//  Timetable
//
//  Created by Эдуард Рязапов on 23.01.16.
//  Copyright © 2016 Эдуард Рязапов. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Lesson+CoreDataProperties.h"

@implementation Lesson (CoreDataProperties)

@dynamic name;
@dynamic teacher;
@dynamic time;
@dynamic weekday;
@dynamic group;

@end
