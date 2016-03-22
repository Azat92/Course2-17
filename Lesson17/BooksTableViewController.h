//
//  BooksTableViewController.h
//  Lesson17
//
//  Created by Azat Almeev on 13.03.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Protocols.h"

@interface BooksTableViewController : UITableViewController
@property (nonatomic, strong) id <DataAdapterProtocol> dbWorker;
@end
