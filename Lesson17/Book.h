//
//  Book.h
//  Lesson17
//
//  Created by Azat Almeev on 13.03.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Book : NSObject
@property (nonatomic, strong) NSNumber *uid;
@property (nonatomic, strong) NSString *work;
@property (nonatomic, strong) NSString *author;

+ (instancetype)bookWithID:(NSInteger)uid work:(NSString *)work andAuthor:(NSString *)author;

@end
