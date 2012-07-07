//
//  AppDelegate.m
//  zxg_arc
//
//  Created by gakaki on 7/2/12.
//  Copyright (c) 2012 gakaki. All rights reserved.
//

#import "AppDelegate.h"
#import "ControllerRootMyLauncher.h"
#import "Global_load.h"
#import "Controllers.h"
#import "ServiceUpdater.h"


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    
    self.window.backgroundColor = [UIColor blackColor];
    
#define kNewsController 1
    
    if (kNewsController != 1){
        
        self.navigationController = [[UINavigationController alloc] initWithRootViewController:
                                     [[ControllerRootMyLauncher alloc] init]];
        //[navigationController.navigationBar setHidden:YES];
        
        //self.navigationController.navigationBar.tintColor = COLOR(2, 100, 162);
        
        self.window.rootViewController = self.navigationController;
        [self.window addSubview:self.navigationController.view];
        
    }else{
        
        UIViewController* view_ctrl =[[NewsViewController alloc]init];
        
       
        
        [self.window addSubview:view_ctrl.view];
        
    }
    
    
    //在[self.window makeKeyandvisible]后面调用一下方法，可以出现splash screen被mySecondSplashview.png替换，并淡出效
    [self animateSplashScreen];
    //判断升级
    id updater = [ServiceUpdater sharedManager];
    [updater checkUpdate];

    [self.window layoutSubviews];    
    
    
    [self.window makeKeyAndVisible];
    return YES;
}


- (void) animateSplashScreen
{
    
    //fade time
    CFTimeInterval animation_duration = 1.8;
    
    //SplashScreen
    UIImageView * splashView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0, 320, 480)];
    splashView.image = [UIImage imageNamed:@"ControllerRootMyLauncher_bg.png"];
    [self.window addSubview:splashView];
    [self.window bringSubviewToFront:splashView];
    
    //Animation (fade away with zoom effect)
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:animation_duration];//UIViewAnimationTransitionCurlUp
    [UIView setAnimationTransition:UIViewAnimationTransitionNone forView:self.window cache:YES];
    [UIView setAnimationDelegate:splashView];
    [UIView setAnimationDidStopSelector:@selector(removeFromSuperview)];
    splashView.alpha = 0.0;
    splashView.frame = CGRectMake(-60, -60, 440, 600);
    
    [UIView commitAnimations];
    
    
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
