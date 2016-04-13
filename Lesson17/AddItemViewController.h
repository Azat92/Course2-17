//
//  AddItemViewController.h
//  FMDBWork
//
//  Created by Мария Тимофеева on 25.03.16.
//  Copyright © 2016 ___matim___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DatabaseWorker.h"

@interface AddItemViewController : UIViewController <UINavigationControllerDelegate>


@property (weak, nonatomic) IBOutlet UITextField *itemNameField;
@property (weak, nonatomic) IBOutlet UITextView *itemInfoField;
@property (nonatomic, strong) DatabaseWorker *dbWorker;
- (IBAction)addItem:(id)sender;

@end
