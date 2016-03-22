//
//  Book.h
//  Lesson17
//
//  Created by Azat Almeev on 13.03.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Protocols.h"

@interface Book : NSObject <BookProtocol>

+ (instancetype)bookWithID:(NSInteger)uid work:(NSString *)work andAuthor:(NSString *)author;

@end
