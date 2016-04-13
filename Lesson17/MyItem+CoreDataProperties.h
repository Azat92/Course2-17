//
//  MyItem+CoreDataProperties.h
//  Lesson17
//
//  Created by Мария Тимофеева on 10.04.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "MyItem.h"
#import "MyUser.h"

NS_ASSUME_NONNULL_BEGIN

@interface MyItem (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *descriptions;
@property (nonatomic) int64_t iid;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) MyUser *user;

@end

NS_ASSUME_NONNULL_END
