//
//  MyTabBarControllerViewController.m
//  zxg
//
//  Created by gakaki on 12-5-28.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MyTabBarControllerViewController.h"

@interface MyTabBarControllerViewController ()

@end

@implementation MyTabBarControllerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        // Override point for customization after application launch.
        UIViewController *viewController1 = [[ItemViewController alloc] init];
        UIViewController *viewController2 = [[ItemViewController alloc] init];
 
        self.viewControllers = @[viewController1, viewController2];
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
