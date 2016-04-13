//
//  ItemsTableViewController.h
//  Lesson17
//
//  Created by Мария Тимофеева on 10.04.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreDataWorker.h"
#import "MyUser+CoreDataProperties.h"
@interface ItemsTableViewController : UITableViewController
@property (nonatomic, strong) CoreDataWorker *dataWorker;
@property (nonatomic, strong) MyUser *user;

@end
