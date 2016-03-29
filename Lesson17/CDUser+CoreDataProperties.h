//
//  CDUser+CoreDataProperties.h
//  Lesson17
//
//  Created by Azat Almeev on 29.03.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "CDUser.h"

NS_ASSUME_NONNULL_BEGIN

@interface CDUser (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSNumber *uid;
@property (nullable, nonatomic, retain) NSNumber *rating;
@property (nullable, nonatomic, retain) NSOrderedSet<CDGrade *> *grades;

@end

@interface CDUser (CoreDataGeneratedAccessors)

- (void)insertObject:(CDGrade *)value inGradesAtIndex:(NSUInteger)idx;
- (void)removeObjectFromGradesAtIndex:(NSUInteger)idx;
- (void)insertGrades:(NSArray<CDGrade *> *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeGradesAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInGradesAtIndex:(NSUInteger)idx withObject:(CDGrade *)value;
- (void)replaceGradesAtIndexes:(NSIndexSet *)indexes withGrades:(NSArray<CDGrade *> *)values;
- (void)addGradesObject:(CDGrade *)value;
- (void)removeGradesObject:(CDGrade *)value;
- (void)addGrades:(NSOrderedSet<CDGrade *> *)values;
- (void)removeGrades:(NSOrderedSet<CDGrade *> *)values;

@end

NS_ASSUME_NONNULL_END
