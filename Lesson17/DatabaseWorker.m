//
//  DatabaseWorker.m
//  Lesson17
//
//  Created by Azat Almeev on 12.03.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import "DatabaseWorker.h"
#import <FMDatabaseQueue.h>
#import <FMDatabase+FTS3.h>
#import "User.h"
#import "Book.h"

@interface DatabaseWorker ()
@property (nonatomic, readonly) FMDatabaseQueue *queue;
@end

@implementation DatabaseWorker
@synthesize queue = _queue;

- (FMDatabaseQueue *)queue {
    if (!_queue) {
        NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
        _queue = [FMDatabaseQueue databaseQueueWithPath:[documentsDirectory stringByAppendingPathComponent:@"database.sqlite"]];
        [self checkDatabase];
    }
    return _queue;
}

- (void)checkDatabase {
    [self.queue inDatabase:^(FMDatabase *db) {
//        SELECT name FROM sqlite_master WHERE type='table'
        [db executeUpdate:@"CREATE TABLE IF NOT EXISTS demo_table (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, rating REAL)"];
        FMResultSet *countResult = [db executeQuery:@"SELECT COUNT(*) FROM demo_table"];
        while (countResult.next) { // if (countResult.next)
            NSInteger count = [countResult intForColumnIndex:0];
            if (count == 0) {
                NSString *filePath = [[NSBundle mainBundle] pathForResource:@"names" ofType:@"txt"];
                NSString *namesFileContent = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
                NSMutableString *statements = [NSMutableString new];
                [[[namesFileContent componentsSeparatedByString:@"\n"] filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"length > 1"]] enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    [statements appendFormat:@"INSERT INTO demo_table (name, rating) values ('%@', %.2f);", obj, arc4random_uniform(10000) / 100.];
                }];
                BOOL result = [db executeStatements:statements withResultBlock:^int(NSDictionary *resultsDictionary) {
                    NSLog(@"%@", resultsDictionary);
                    return 0;
                }];
                NSLog(@"Table population was %@successful", result ? @"" : @"un");
            }
        }
        
//        [db executeUpdate:@"DROP TABLE book_table"];
        [db executeUpdate:@"CREATE TABLE IF NOT EXISTS book_table (id INTEGER PRIMARY KEY AUTOINCREMENT, work TEXT, author TEXT, reference TEXT)"];
        countResult = [db executeQuery:@"SELECT COUNT(*) FROM book_table"];
        while (countResult.next) {
            NSInteger count = [countResult intForColumnIndex:0];
            if (count == 0) {
                NSString *filePath = [[NSBundle mainBundle] pathForResource:@"books" ofType:@"txt"];
                NSString *namesFileContent = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
                NSArray *items = [namesFileContent componentsSeparatedByString:@"\n"];
                [db beginTransaction];
                for (NSInteger i = 0; i < items.count / 3; i++)
                    [db executeUpdate:@"INSERT INTO book_table(work, author, reference) VALUES (?, ?, ?)", items[i * 3], items[i * 3 + 1], items[i * 3 + 2]];
                [db commit];
                NSLog(@"Books table population was successful");
                [db executeUpdate:@"CREATE VIRTUAL TABLE IF NOT EXISTS book_search USING fts4(id, work, author, reference)"];
                [db executeUpdate:@"INSERT INTO book_search SELECT id, work, author, reference FROM book_table"];
            }
        }
    }];
}

- (NSArray *)usersArray {
    NSMutableArray *result = [NSMutableArray new];
    [self.queue inDatabase:^(FMDatabase *db) {
        FMResultSet *res = [db executeQuery:@"SELECT * FROM demo_table"];
        while (res.next)
            [result addObject:[User userWithID:[res intForColumnIndex:0]
                                          name:[res stringForColumnIndex:1]
                                     andRating:[res doubleForColumnIndex:2]]];
    }];
    return result.copy;
}

- (NSArray *)myusersArray {
    return nil;
}

- (NSArray *)booksArrayUsingQuery:(NSString *)query {
    if (query.length == 0)
        return nil;
    
    NSMutableArray *result = [NSMutableArray new];
    [self.queue inDatabase:^(FMDatabase *db) {
        FMResultSet *res = [db executeQuery:@"SELECT * FROM book_search WHERE work MATCH ?", query];
        while (res.next)
            [result addObject:[Book bookWithID:[res intForColumn:@"id"]
                                          work:[res stringForColumn:@"work"]
                                     andAuthor:[res stringForColumn:@"author"]]];
    }];
    return result.copy;
}

@end
