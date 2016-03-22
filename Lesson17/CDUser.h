//
//  CDUser.h
//  Lesson17
//
//  Created by Azat Almeev on 20.03.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Protocols.h"

NS_ASSUME_NONNULL_BEGIN

@interface CDUser : NSManagedObject

+ (instancetype)userWithID:(NSInteger)uid name:(NSString *)name andRating:(double)rating inManagedObjectContext:(NSManagedObjectContext *)context;

@end

NS_ASSUME_NONNULL_END

#import "CDUser+CoreDataProperties.h"
