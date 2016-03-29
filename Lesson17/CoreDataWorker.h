//
//  CoreDataWorker.h
//  Lesson17
//
//  Created by Azat Almeev on 20.03.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Protocols.h"
@import CoreData;

@interface CoreDataWorker : NSObject <DataAdapterProtocol>
@property (nonatomic, readonly) NSManagedObjectContext *managedObjectContext;
- (void)saveContext;
@end
