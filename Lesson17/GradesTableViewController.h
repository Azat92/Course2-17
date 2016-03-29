//
//  GradesTableViewController.h
//  Lesson17
//
//  Created by Azat Almeev on 29.03.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreDataWorker.h"
#import "CDUser.h"

@interface GradesTableViewController : UITableViewController
@property (nonatomic, strong) CoreDataWorker *dataWorker;
@property (nonatomic, strong) CDUser *user;
@end
