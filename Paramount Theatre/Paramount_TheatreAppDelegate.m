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

@synthesize navigationController=_navigationController;

-(void)awakeFromNib{
    
    //    splash = [[UIViewController alloc] init];
    //    splash.view = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"head.jpg"]];
//    splash = [[UIViewController alloc] init];
//    [[splash view] addSubview: [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg.png"]]]; 
//    [[[[self window] subviews] objectAtIndex:0] setHidden:YES];
//    [[self navigationController] setNavigationBarHidden:YES];
//    [[self window] addSubview:splash.view];
    
//	[NSTimer scheduledTimerWithTimeInterval:3.0f target:self selector:@selector(onSplashScreenExpired:) userInfo:nil repeats:NO];
    
    // Override point for customization after application launch.
    // Add the navigation controller's view to the window and display.
    //    self.window.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"icon.png"]];
    self.window.rootViewController = self.navigationController;
    [self.window makeKeyAndVisible];


}

//- (void)applicationDidFinishLaunching:(UIApplication *)application{
//	NSLog(@"Registering for remote notifications"); 
//	[[UIApplication sharedApplication] registerForRemoteNotificationTypes:(UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound)];
//}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	
    

    // Override point for customization after application launch.
    // Add the navigation controller's view to the window and display.
//    self.window.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"icon.png"]];
	NSLog(@"Registering for remote notifications"); 
	[[UIApplication sharedApplication] registerForRemoteNotificationTypes:(UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound)];

    return YES;
}


- (void)onSplashScreenExpired:(id)info{

    [splash.view removeFromSuperview];
    [[[[self window] subviews] objectAtIndex:0] setHidden:NO];
    [[self navigationController] setNavigationBarHidden:NO];
    
    //    self.window.rootViewController = self.navigationController;
    //    [self.window makeKeyAndVisible];
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
