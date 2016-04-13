//
//  Item.m
//  FMDBWork
//
//  Created by Мария Тимофеева on 25.03.16.
//  Copyright © 2016 ___matim___. All rights reserved.
//

#import "Item.h"

@implementation Item


+ (instancetype)itemWithID:(NSInteger)id name:(NSString *)name andInfo:(NSString *)info {
    Item *item = [Item new];
    item.iid = @(id);
    item.name = name;
    item.info = info;
    return item;
}
@end
