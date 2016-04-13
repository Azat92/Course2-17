//
//  DetailViewController.m
//  FMDBWork
//
//  Created by Мария Тимофеева on 25.03.16.
//  Copyright © 2016 ___matim___. All rights reserved.
//

#import "DetailViewController.h"
#import "DatabaseWorker.h"

@interface DetailViewController ()
@property int i;
@property (nonatomic) UIBarButtonItemStyle *buttonStyle;
@end

@implementation DetailViewController




- (void)viewDidLoad
{
    [super viewDidLoad];
    Item *item = [self.dbWorker getItemWithId:self.itemId];
    self.itemInfo.text = item.info;
    self.itemName.text = item.name;
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)editAction:(id)sender {
    if (_i == 0){
        [self.deleteButton setHidden:false];
        [self.itemInfo setEditable:true];
        [self.itemName setEditable:true];
        [self.itemName setBackgroundColor:[UIColor greenColor]];
        [self.itemInfo setBackgroundColor:[UIColor greenColor]];
        [self.itemInfo setTextColor:[UIColor whiteColor]];
        [self.itemName setTextColor:[UIColor whiteColor]];
        _i = 1;
        [self.editButton setStyle:UIBarButtonItemStyleDone];
        
    }
    else{
        [self.dbWorker updateItemsWithItemId:self.itemId Itemname:self.itemName.text itemInfo:self.itemInfo.text];
        _i = 0;
        [self.deleteButton setHidden:true];
        [self.itemInfo setEditable:false];
        [self.itemName setEditable:false];
        [self.itemName setBackgroundColor:[UIColor cyanColor]];
        [self.itemInfo setBackgroundColor:[UIColor cyanColor]];
        [self.itemInfo setTextColor:[UIColor blackColor]];
        [self.itemName setTextColor:[UIColor blackColor]];

    }
    
    
    
}

- (IBAction)deleteItem:(id)sender {
   UIAlertController *alert =  [UIAlertController alertControllerWithTitle:@"Delete items." message:@"Are you sure?" preferredStyle:UIAlertControllerStyleActionSheet];
    [alert addAction:[UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [self.dbWorker deleteItemWithId:_itemId] ;
        [self.navigationController popViewControllerAnimated:YES];
   
    }]];
    [self presentViewController:alert animated:YES completion:nil];
  
}
@end
