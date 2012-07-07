//
//  LoginViewController.m
//  zxg
//
//  Created by gakaki on 12-6-6.
//  Copyright (c) 2012年 Gakaki. All rights reserved.
//

#import "LoginViewController.h"
#import "ModelUser.h"

@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize btn_bg;
@synthesize btn_check_remember_pwd,btn_sign_in,txt_pwd,txt_mobile;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self hide_nav_bar];
    
    
    self.txt_mobile.text = @"1391744732";
    self.txt_pwd.text = @"z5896321";
}

- (void)viewDidUnload
{
    [self setBtn_sign_in:nil];
    [self setBtn_check_remember_pwd:nil];
    [self setBtn_sign_in:nil];
    [self setBtn_bg:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)btn_sign_in_click:(id)sender {
    
    NSLog(@"sign in btn click");
    
    NSString* mobile = txt_mobile.text;
    NSString* pwd = txt_pwd.text;    

    [ModelUser get_login_status_with_block:^(bool login_result){
        
        if (login_result) {
            
        }else{
            //alert your nmae is not right 
            NSString* alert_message = @"您的手机号或者密码填写错误";
            [[[UIAlertView alloc] initWithTitle:@"Error" message:alert_message delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Ok", nil] show];

        }
        
        NSLog(@"%d",login_result);
       //[self.tableView reloadData];
    }        
    with_mobile:mobile
    with_pwd:pwd];
    
    
}

- (IBAction)textFieldDoneEditing:(id)sender{  
    [sender resignFirstResponder];  
} 

- (IBAction)btn_bg_click:(id)sender {
    [txt_mobile resignFirstResponder];
    [txt_pwd resignFirstResponder];
}
@end
