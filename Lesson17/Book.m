//
//  Book.m
//  Lesson17
//
//  Created by Azat Almeev on 13.03.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import "Book.h"

@implementation Book

+ (instancetype)bookWithID:(NSInteger)uid work:(NSString *)work andAuthor:(NSString *)author {
    Book *book = [Book new];
    book.uid = @(uid);
    book.work = work;
    book.author = author;
    return book;
}

@end
