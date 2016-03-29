//
//  CDUser.m
//  Lesson17
//
//  Created by Azat Almeev on 20.03.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import "CDUser.h"

@implementation CDUser
@dynamic hasGrades;

+ (instancetype)userWithID:(NSInteger)uid name:(NSString *)name andRating:(double)rating inManagedObjectContext:(NSManagedObjectContext *)context {
    CDUser *user = [NSEntityDescription insertNewObjectForEntityForName:@"CDUser" inManagedObjectContext:context];
    user.uid = @(uid);
    user.name = name;
    user.rating = @(rating);
    return user;
}

@end
