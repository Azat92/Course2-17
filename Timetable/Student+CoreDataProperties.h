//
//  Student+CoreDataProperties.h
//  Timetable
//
//  Created by Эдуард Рязапов on 22.01.16.
//  Copyright © 2016 Эдуард Рязапов. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Student.h"

NS_ASSUME_NONNULL_BEGIN

@interface Student (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *firstName;
@property (nullable, nonatomic, retain) NSNumber *gender;
@property (nullable, nonatomic, retain) NSString *phoneNumber;
@property (nullable, nonatomic, retain) NSString *secondName;
@property (nullable, nonatomic, retain) Group *group;

@end

NS_ASSUME_NONNULL_END
