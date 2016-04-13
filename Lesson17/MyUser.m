//
//  MyUser.m
//  Lesson17
//
//  Created by Мария Тимофеева on 10.04.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import "MyUser.h"
#import "MyItem.h"

@implementation MyUser

+ (instancetype)userWithID:(NSInteger)uid name:(NSString *)name inManagedObjectContext:(NSManagedObjectContext *)context {
    MyUser *user = [NSEntityDescription insertNewObjectForEntityForName:@"MyUser" inManagedObjectContext:context];
    user.uid = @(uid);
    user.name = name;
    return user;
}

@end
