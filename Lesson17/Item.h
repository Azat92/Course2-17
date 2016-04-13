//
//  Item.h
//  FMDBWork
//
//  Created by Мария Тимофеева on 25.03.16.
//  Copyright © 2016 ___matim___. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject
@property (nonatomic, strong) NSNumber *iid;
@property (strong, nonatomic) NSString *name;
@property (strong,nonatomic) NSString *info;

+ (instancetype)itemWithID:(NSInteger)iid name:(NSString *)name andInfo:(NSString *)info;
@end
