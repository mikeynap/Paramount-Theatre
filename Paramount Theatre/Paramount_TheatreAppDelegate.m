//
//  Paramount_TheatreAppDelegate.m
//  Paramount Theatre
//
//  Created by Moo on 6/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Paramount_TheatreAppDelegate.h"
#import "ShowSubView.h"

//@interface UINavigationBar (MyCustomNavBar)
//@end
//@implementation UINavigationBar (MyCustomNavBar)
//- (void) drawRect:(CGRect)rect {
//    UIImage *barImage = [UIImage imageNamed:@"head.jpg"];
//    [barImage drawInRect:rect];
//}
//@end


@implementation Paramount_TheatreAppDelegate


@synthesize window=_window;
@synthesize tabBarController;
@synthesize navigationController=_navigationController;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	
    	[[UIApplication sharedApplication] registerForRemoteNotificationTypes:(UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound)];
    
    self.tabBarController = [[[UITabBarController alloc] init] autorelease];
    
    UIViewController *splash = [[[UIViewController alloc] init] autorelease];
    splash.title = @"About";
    UIViewController *tickets = [[[UIViewController alloc] init] autorelease];
    tickets.title = @"Tickets";
    UIWebView *ticketView = [[[UIWebView alloc] init] autorelease];
    [ticketView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://paramounttickets.org"]]];
//    _navigationController.tabBarItem.image = [UIImage imageNamed:@"icon.png"];
    NSArray* controllers = [NSArray arrayWithObjects:splash, [_navigationController autorelease], sponsors, nil];
  // ??? MAYBE???  [_navigationController release];
    tabBarController.viewControllers = controllers;

    
    // Add the tab bar controller's current view as a subview of the window
    [self.window addSubview:tabBarController.view];

    return YES;
}




- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    if ([defaults boolForKey:@"didRegesterToken"] == NO){
        NSString *token = [[deviceToken description] stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"<>"]];
        token = [token stringByReplacingOccurrencesOfString:@" " withString:@""];
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://paramountlive.org/push.php?m=new&token=%@", token]];
        NSMutableURLRequest *urlRequest=[NSMutableURLRequest requestWithURL:url];
        [NSURLConnection connectionWithRequest:urlRequest delegate:self];
        NSLog(@"Sent Request");
    }
    
    [defaults setBool:YES forKey:@"didRegesterToken"];
    
    NSLog(@"device Token is:%@", deviceToken);
    
    // this is the what you need to put into your PHP apns server
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
    NSLog(@"Failed to register for push %d %@", [error code], [error userInfo]);
}



- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

- (void)dealloc
{
    [_window release];
    [_navigationController release];
    [super dealloc];
}

@end
