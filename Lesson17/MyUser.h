//
//  MyUser.h
//  Lesson17
//
//  Created by Мария Тимофеева on 10.04.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class MyItem;

NS_ASSUME_NONNULL_BEGIN

@interface MyUser : NSManagedObject

+ (instancetype)userWithID:(NSInteger)uid name:(NSString *)name inManagedObjectContext:(NSManagedObjectContext *)contex;

@end

NS_ASSUME_NONNULL_END

#import "MyUser+CoreDataProperties.h"
