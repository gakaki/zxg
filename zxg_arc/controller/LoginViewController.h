//
//  LoginViewController.h
//  zxg
//
//  Created by gakaki on 12-6-6.
//  Copyright (c) 2012年 Gakaki. All rights reserved.
//

#import "BaseViewController.h"

@interface LoginViewController : BaseViewController

@property (nonatomic, strong) IBOutlet UITextField *txt_mobile;
@property (nonatomic, strong) IBOutlet UITextField *txt_pwd;


@property (strong, nonatomic) IBOutlet UIButton *btn_check_remember_pwd;
@property (strong, nonatomic) IBOutlet UIButton *btn_sign_in;
@property (strong, nonatomic) IBOutlet UIButton *btn_bg;

- (IBAction)btn_sign_in_click:(id)sender;
- (IBAction)textFieldDoneEditing:(id)sender;  
- (IBAction)btn_bg_click:(id)sender;




@end
