//
//  CoreDataManager.h
//  Timetable
//
//  Created by Эдуард Рязапов on 21.01.16.
//  Copyright © 2016 Эдуард Рязапов. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface CoreDataManager : NSObject

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

+ (instancetype)shared;
- (NSManagedObjectContext *)getContextForCurrentQueue;

@end
