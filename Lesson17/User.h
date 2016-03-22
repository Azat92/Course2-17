//
//  User.h
//  Lesson17
//
//  Created by Azat Almeev on 12.03.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Protocols.h"

@interface User : NSObject <UserProtocol>

+ (instancetype)userWithID:(NSInteger)uid name:(NSString *)name andRating:(double)rating;

@end
