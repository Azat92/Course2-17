//
//  MyUser+CoreDataProperties.h
//  Lesson17
//
//  Created by Мария Тимофеева on 10.04.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "MyUser.h"

NS_ASSUME_NONNULL_BEGIN

@interface MyUser (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nonatomic) NSNumber *uid;
@property (nullable, nonatomic, retain) NSOrderedSet<MyItem *> *items;

@end

@interface MyUser (CoreDataGeneratedAccessors)

- (void)addItemsObject:(MyItem *)value;
- (void)removeItemsObject:(MyItem *)value;
- (void)addItems:(NSSet<MyItem *> *)values;
- (void)removeItems:(NSSet<MyItem *> *)values;

@end

NS_ASSUME_NONNULL_END
