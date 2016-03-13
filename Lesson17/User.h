//
//  User.h
//  Lesson17
//
//  Created by Azat Almeev on 12.03.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject
@property (nonatomic, strong) NSNumber *uid;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSNumber *rating;

+ (instancetype)userWithID:(NSInteger)uid name:(NSString *)name andRating:(double)rating;
@end
