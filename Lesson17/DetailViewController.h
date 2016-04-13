//
//  DetailViewController.h
//  FMDBWork
//
//  Created by Мария Тимофеева on 25.03.16.
//  Copyright © 2016 ___matim___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Item.h"
#import "DatabaseWorker.h"
@interface DetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *itemInfo;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *editButton;
- (IBAction)editAction:(id)sender;
@property (nonatomic, strong) DatabaseWorker *dbWorker;
@property (weak, nonatomic) IBOutlet UITextView *itemName;
@property (weak, nonatomic) IBOutlet UIButton *deleteButton;
- (IBAction)deleteItem:(id)sender;

@property NSNumber *itemId;
@end
