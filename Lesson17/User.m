
//
//  User.m
//  Lesson17
//
//  Created by Azat Almeev on 12.03.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import "User.h"

@implementation User

+ (instancetype)userWithID:(NSInteger)uid name:(NSString *)name andRating:(double)rating {
    User *user = [User new];
    user.uid = @(uid);
    user.name = name;
    user.rating = @(rating);
    return user;
}

@end
