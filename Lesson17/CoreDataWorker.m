//
//  CoreDataWorker.m
//  Lesson17
//
//  Created by Azat Almeev on 20.03.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import "CoreDataWorker.h"
#import "CDUser.h"
#import "CDBook.h"
#import "MyUser.h"

@interface CoreDataWorker ()
@property (nonatomic, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (nonatomic, readonly) NSManagedObjectModel *managedObjectModel;
@end

@implementation CoreDataWorker
@synthesize managedObjectContext = _managedObjectContext;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;
@synthesize managedObjectModel = _managedObjectModel;

- (NSArray *)usersArray {
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"CDUser"];
    request.sortDescriptors = @[ [NSSortDescriptor sortDescriptorWithKey:@"uid" ascending:YES] ];
    NSError *error = nil;
    NSArray *results = [self.managedObjectContext executeFetchRequest:request error:&error];
    if (error) {
        NSLog(@"%@", error);
        return nil;
    }
    else if (results.count == 0) {
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"names" ofType:@"txt"];
        NSString *namesFileContent = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
        NSMutableArray *result = [NSMutableArray new];
        [[[namesFileContent componentsSeparatedByString:@"\n"] filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"length > 1"]] enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL *stop) {
            [result addObject:[CDUser userWithID:idx + 1 name:obj andRating:arc4random_uniform(10000) / 100. inManagedObjectContext:self.managedObjectContext]];
        }];
        [self saveContext];
        results = result.copy;
    }
    return results;
}

- (NSArray *)myusersArray {
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"MyUser"];
    request.sortDescriptors = @[ [NSSortDescriptor sortDescriptorWithKey:@"uid" ascending:YES] ];
    NSError *error = nil;
    NSArray *results = [self.managedObjectContext executeFetchRequest:request error:&error];
    if (error) {
        NSLog(@"%@", error);
        return nil;
    }
    else if (results.count == 0) {
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"names" ofType:@"txt"];
        NSString *namesFileContent = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
        NSMutableArray *result = [NSMutableArray new];
        [[[namesFileContent componentsSeparatedByString:@"\n"] filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"length > 1"]] enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL *stop) {
            [result addObject:[MyUser userWithID:idx + 1 name:obj inManagedObjectContext:self.managedObjectContext]];
        }];
        [self saveContext];
        results = result.copy;
    }
    return results;
}

- (NSArray *)booksArrayUsingQuery:(NSString *)query {
    if (query.length == 0)
        return nil;
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"CDBook"];
    NSUInteger count = [self.managedObjectContext countForFetchRequest:request error:nil];
    if (count == 0) {
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"books" ofType:@"txt"];
        NSString *namesFileContent = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
        NSArray *items = [namesFileContent componentsSeparatedByString:@"\n"];
        NSMutableArray *result = [NSMutableArray new];
        for (NSInteger i = 0; i < items.count / 3; i++)
            [result addObject:[CDBook bookWithID:i + 1 work:items[i * 3] andAuthor:items[i * 3 + 1] inManagedObjectContext:self.managedObjectContext]];
        [self saveContext];
    }
    request.sortDescriptors = @[ [NSSortDescriptor sortDescriptorWithKey:@"uid" ascending:YES] ];
    request.predicate = [NSPredicate predicateWithFormat:@"work CONTAINS[cd] %@", [query stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"*"]]];
    NSError *error = nil;
    NSArray *results = [self.managedObjectContext executeFetchRequest:request error:&error];
    if (error) {
        NSLog(@"%@", error);
        return nil;
    }
    return results;
}

- (NSURL *)applicationDocumentsDirectory {
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

#pragma mark - Core Data stack
- (NSManagedObjectContext *)managedObjectContext {
    if (!_managedObjectContext) {
        _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
        [_managedObjectContext setPersistentStoreCoordinator:self.persistentStoreCoordinator];
    }
    return _managedObjectContext;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    if (!_persistentStoreCoordinator) {
        _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.managedObjectModel];
        NSURL *storeURL = [self.applicationDocumentsDirectory URLByAppendingPathComponent:@"Lesson17.sqlite"];
        NSError *error = nil;
        if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:@{ NSMigratePersistentStoresAutomaticallyOption : @YES, NSInferMappingModelAutomaticallyOption : @YES } error:&error]) {
            NSMutableDictionary *dict = [NSMutableDictionary dictionary];
            dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
            dict[NSLocalizedFailureReasonErrorKey] = @"There was an error creating or loading the application's saved data.";
            dict[NSUnderlyingErrorKey] = error;
            error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
    return _persistentStoreCoordinator;
}

- (NSManagedObjectModel *)managedObjectModel {
    if (!_managedObjectModel) {
        NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Lesson17" withExtension:@"momd"];
        _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    }
    return _managedObjectModel;
}

#pragma mark - Core Data Saving support
- (void)saveContext {
    NSError *error = nil;
    if (self.managedObjectContext.hasChanges && ![self.managedObjectContext save:&error]) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
}

@end
