//
//  RootViewController.m
//  @rigoneri
//  
//  Copyright 2010 Rodrigo Neri
//  Copyright 2011 David Jarrett
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#import "ControllerRootMyLauncher.h"
#import "MyLauncherItem.h"
#import "CustomBadge.h"
#import "ItemViewController.h"
#import "MyTabBarControllerViewController.h"
#import "NewsViewController.h"
#import "LoginViewController.h"

@implementation ControllerRootMyLauncher

-(void)loadView
{    
	[super loadView];
    self.title = @"A股风险控制系统";
    
    //background view
    UIImageView * bg_view = [[UIImageView alloc] initWithFrame:CGRectMake(0,0, 320, 480)];
    bg_view.image = [UIImage imageNamed:@"ControllerRootMyLauncher_bg.png"];
    [self.view addSubview:bg_view];
    [self.view sendSubviewToBack:bg_view];

    
    
    [[self appControllers] setObject:[ItemViewController class] forKey:@"ItemViewController"];
    [[self appControllers] setObject:[MyTabBarControllerViewController class] forKey:@"MyTabBarControllerViewController"];
    
    [[self appControllers] setObject:[NewsViewController class] forKey:@"NewsViewController"];//新闻
    
    [[self appControllers] setObject:[LoginViewController class] forKey:@"LoginViewController"];//用户账户管理
    
    
    
    //Add your view controllers here to be picked up by the launcher; remember to import them above
	//[[self appControllers] setObject:[MyCustomViewController class] forKey:@"MyCustomViewController"];
	//[[self appControllers] setObject:[MyOtherCustomViewController class] forKey:@"MyOtherCustomViewController"];
	
	if(![self hasSavedLauncherItems])
	{
		[self.launcherView setPages:[NSMutableArray arrayWithObjects: 
                                     [NSMutableArray arrayWithObjects: 
                                      [[MyLauncherItem alloc] initWithTitle:@"今日大盘动态分析"
                                                                iPhoneImage:@"itemImage" 
                                                                  iPadImage:@"itemImage-iPad"
                                                                     target:@"MyTabBarControllerViewController" 
                                                                targetTitle:@"今日大盘动态分析"
                                                                  deletable:NO],
                                      [[MyLauncherItem alloc] initWithTitle:@"明日大盘静态预测"
                                                                iPhoneImage:@"itemImage" 
                                                                  iPadImage:@"itemImage-iPad"
                                                                     target:@"ItemViewController" 
                                                                targetTitle:@"明日大盘静态预测" 
                                                                  deletable:NO],
                                      [[MyLauncherItem alloc] initWithTitle:@"本周大盘静态预测"
                                                                iPhoneImage:@"itemImage" 
                                                                  iPadImage:@"itemImage-iPad"
                                                                     target:@"ItemViewController" 
                                                                targetTitle:@"本周大盘静态预测"
                                                                  deletable:NO],
                                      
                                      [[MyLauncherItem alloc] initWithTitle:@"新闻"
                                                                iPhoneImage:@"itemImage" 
                                                                  iPadImage:@"itemImage-iPad"
                                                                     target:@"NewsViewController" 
                                                                targetTitle:@"新闻"
                                                                  deletable:NO],
                                      
                                      [[MyLauncherItem alloc] initWithTitle:@"金股询价监测系统"
                                                                iPhoneImage:@"itemImage" 
                                                                  iPadImage:@"itemImage-iPad"
                                                                     target:@"ItemViewController" 
                                                                targetTitle:@"金股询价监测系统"
                                                                  deletable:NO],
                                      [[MyLauncherItem alloc] initWithTitle:@"持仓比例提示系统"
                                                                iPhoneImage:@"itemImage" 
                                                                  iPadImage:@"itemImage-iPad"
                                                                     target:@"ItemViewController" 
                                                                targetTitle:@"持仓比例提示系统"
                                                                  deletable:NO],
                                      [[MyLauncherItem alloc] initWithTitle:@"系统风控提示系统"
                                                                iPhoneImage:@"itemImage" 
                                                                  iPadImage:@"itemImage-iPad"
                                                                     target:@"ItemViewController" 
                                                                targetTitle:@"系统风控提示系统"
                                                                  deletable:NO],
                                      [[MyLauncherItem alloc] initWithTitle:@"今日大盘动态分析"
                                                                iPhoneImage:@"itemImage" 
                                                                  iPadImage:@"itemImage-iPad"
                                                                     target:@"ItemViewController" 
                                                                targetTitle:@"今日大盘动态分析"
                                                                  deletable:NO],
                                      [[MyLauncherItem alloc] initWithTitle:@"用户账户管理中心"
                                                                iPhoneImage:@"itemImage" 
                                                                  iPadImage:@"itemImage-iPad"
                                                                     target:@"LoginViewController" 
                                                                targetTitle:@"用户账户管理中心"
                                                                  deletable:NO],
                                      
                                      /*
                                      [[MyLauncherItem alloc] initWithTitle:@"关于软件开发团队"
                                                                iPhoneImage:@"itemImage" 
                                                                  iPadImage:@"itemImage-iPad"
                                                                     target:@"ItemViewController" 
                                                                targetTitle:@"关于软件开发团队"
                                                                  deletable:YES],*/
                                      nil], 
                                     
                                     nil]];
        
      
        
        // Set number of immovable items below; only set it when you are setting the pages as the 
        // user may still be able to delete these items and setting this then will cause movable 
        // items to become immovable.
        // [self.launcherView setNumberOfImmovableItems:1];
        
        // Or uncomment the line below to disable editing (moving/deleting) completely!
//            [self.launcherView setEditingAllowed:NO];
	}
    
    // Set badge text for a MyLauncherItem using it's setBadgeText: method
  //  [(MyLauncherItem *)[[[self.launcherView pages] objectAtIndex:0] objectAtIndex:0] setBadgeText:@"4"];
    
    // Alternatively, you can import CustomBadge.h as above and setCustomBadge: as below.
    // This will allow you to change colors, set scale, and remove the shine and/or frame.
//    [(MyLauncherItem *)[[[self.launcherView pages] objectAtIndex:0] objectAtIndex:1] setCustomBadge:[CustomBadge customBadgeWithString:@"2" withStringColor:[UIColor blackColor] withInsetColor:[UIColor whiteColor] withBadgeFrame:YES withBadgeFrameColor:[UIColor blackColor] withScale:0.8 withShining:NO]];
    
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
	//If you don't want to support multiple orientations uncomment the line below
    //return (toInterfaceOrientation == UIInterfaceOrientationPortrait);
	return [super shouldAutorotateToInterfaceOrientation:toInterfaceOrientation];
}

- (void)didReceiveMemoryWarning 
{
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload 
{
    [super viewDidUnload];
}

@end
