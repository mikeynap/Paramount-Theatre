//
//  Paramount_TheatreAppDelegate.h
//  Paramount Theatre
//
//  Created by Moo on 6/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ShowSubView;

@interface Paramount_TheatreAppDelegate : NSObject <UIApplicationDelegate> {
    ShowSubView *splash;
}

- (void)onSplashScreenExpired:(id)info;

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end
