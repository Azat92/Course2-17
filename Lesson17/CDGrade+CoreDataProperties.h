//
//  CDGrade+CoreDataProperties.h
//  Lesson17
//
//  Created by Azat Almeev on 29.03.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "CDGrade.h"

NS_ASSUME_NONNULL_BEGIN

@interface CDGrade (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *value;
@property (nullable, nonatomic, retain) CDUser *user;

@end

NS_ASSUME_NONNULL_END
