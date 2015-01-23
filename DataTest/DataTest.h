//
//  ViewController.h
//  DataTest
//
//  Created by Chiunti on 22/01/15.
//  Copyright (c) 2015 chiunti. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBManager.h"

@interface DataTest : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *txtEnter;
@property (strong, nonatomic) IBOutlet UITextField *txtReg;
@property (strong, nonatomic) IBOutlet UITextField *txtName;
@property (strong, nonatomic) IBOutlet UITextField *txtDepartment;
@property (strong, nonatomic) IBOutlet UITextField *txtYear;
@property (strong, nonatomic) IBOutlet UIScrollView *myScrollView;

- (IBAction)btnFindPressed:(id)sender;
- (IBAction)btnSavePressed:(id)sender;


@end

