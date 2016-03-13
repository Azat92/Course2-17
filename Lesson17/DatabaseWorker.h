//
//  DatabaseWorker.h
//  Lesson17
//
//  Created by Azat Almeev on 12.03.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DatabaseWorker : NSObject
@property (nonatomic, readonly) NSArray *usersArray;
- (NSArray *)booksArrayUsingQuery:(NSString *)query;
@end
