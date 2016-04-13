//
//  AddItemViewController.m
//  FMDBWork
//
//  Created by Мария Тимофеева on 25.03.16.
//  Copyright © 2016 ___matim___. All rights reserved.
//

#import "AddItemViewController.h"
#import "Item.h"
#import "DatabaseWorker.h"
#import "TableViewController.h"


@interface AddItemViewController (){
    int i ;
    bool k ;
}
@end

@implementation AddItemViewController


- (void)viewDidLoad {
    i = 0;
    k = true;
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

-(IBAction)addItem:(id)sender{
    UIAlertController *alert;
    
    Item *item = [Item new];
    item.name = self.itemNameField.text;
    item.info = self.itemInfoField.text;
    
    if (![item.name isEqual:@""] & ![item.info isEqual:@""]){
        [self.dbWorker addItemWithName:item.name info:item.info];
        alert =  [UIAlertController alertControllerWithTitle:@"Succes" message:@"Your item added!" preferredStyle:UIAlertControllerStyleActionSheet];
        [alert addAction:[UIAlertAction actionWithTitle:@"Add also" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            self.itemNameField.text = nil;
            self.itemInfoField.text = nil;
            
        }]];
        [alert addAction:[UIAlertAction actionWithTitle:@"Back to search!" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self.navigationController popViewControllerAnimated:YES];
        }]];
        
        
    }
    else{
        alert =  [UIAlertController alertControllerWithTitle:@"Error" message:@"Please, fill all fields" preferredStyle:UIAlertControllerStyleActionSheet];
        
        [alert addAction:[UIAlertAction actionWithTitle:@"Ok!" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        }]];
    }
    [self presentViewController:alert animated:YES completion:nil];
    
}





@end
