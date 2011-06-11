//
//  main.m
//  Paramount Theatre
//
//  Created by Moo on 6/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

int main(int argc, char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    NSArray *data = [NSArray arrayWithContentsOfURL:[NSURL URLWithString:@"http://paramountlive.org/iPhone.php"]];
    NSLog(@"%@", data);
    int retVal = UIApplicationMain(argc, argv, nil, nil);
    
    [pool release];
    return retVal;
}
