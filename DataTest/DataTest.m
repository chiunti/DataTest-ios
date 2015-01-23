//
//  ViewController.m
//  DataTest
//
//  Created by Chiunti on 22/01/15.
//  Copyright (c) 2015 chiunti. All rights reserved.
//

#import "DataTest.h"

@interface DataTest ()

@end

@implementation DataTest

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)
nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btnFindPressed:(id)sender {
    NSArray *data = [[DBManager getSharedInstance]findByRegisterNumber:
                     self.txtEnter.text];
    if (data == nil) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:
                              @"Data not found" message:nil delegate:nil cancelButtonTitle:
                              @"OK" otherButtonTitles:nil];
        [alert show];
        self.txtReg.text = @"";
        self.txtName.text =@"";
        self.txtDepartment.text = @"";
        self.txtYear.text =@"";
    }
    else{
        self.txtReg.text = self.txtEnter.text;
        self.txtName.text =[data objectAtIndex:0];
        self.txtDepartment.text = [data objectAtIndex:1];
        self.txtYear.text =[data objectAtIndex:2];
    }
}

- (IBAction)btnSavePressed:(id)sender {
    BOOL success = NO;
    NSString *alertString = @"Data Insertion failed";
    if (self.txtReg.text.length>0 &&self.txtName.text.length>0 &&
        self.txtDepartment.text.length>0 &&self.txtYear.text.length>0 )
    {
        success = [[DBManager getSharedInstance]saveData:
                   self.txtReg.text name:self.txtName.text department:
                   self.txtDepartment.text year:self.txtYear.text];
    }
    else{
        alertString = @"Enter all fields";
    }
    if (success == NO) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:
                    alertString message:nil
                    delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    } else {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:
                              @"Insertado" message:nil
                              delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        self.txtReg.text = @"";
        self.txtName.text =@"";
        self.txtDepartment.text = @"";
        self.txtYear.text =@"";
        [self.txtReg becomeFirstResponder];
    }

}

#pragma mark - Text field delegate
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    [self.myScrollView setFrame:CGRectMake(10, 50, 300, 200)];
    [self.myScrollView setContentSize:CGSizeMake(300, 350)];
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
    [self.myScrollView setFrame:CGRectMake(10, 50, 300, 350)];
    
}
-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}
@end
