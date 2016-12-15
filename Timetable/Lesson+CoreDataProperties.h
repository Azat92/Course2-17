//
//  Lesson+CoreDataProperties.h
//  Timetable
//
//  Created by Эдуард Рязапов on 23.01.16.
//  Copyright © 2016 Эдуард Рязапов. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Lesson.h"

NS_ASSUME_NONNULL_BEGIN

@interface Lesson (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *teacher;
@property (nullable, nonatomic, retain) NSString *time;
@property (nullable, nonatomic, retain) NSNumber *weekday;
@property (nullable, nonatomic, retain) Group *group;

@end

NS_ASSUME_NONNULL_END
