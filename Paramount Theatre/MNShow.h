//
//  MNShow.h
//  Paramount Theatre
//
//  Created by Moo on 6/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MNShow : NSObject {
    NSDate *date;
    NSString *title;
    NSString *description;
    NSString *price;
    NSString *dateAndTime;
    NSString *url;
    NSString *video;
    int uid;
    
}

- (id)initWithId:(int)uid;

@property (copy, nonatomic) NSDate* date;
@property (copy, nonatomic) NSString* title;
@property (copy, nonatomic) NSString* description;
@property (copy, nonatomic) NSString* price;
@property (copy, nonatomic) NSString* url;
@property (copy, nonatomic) NSString* dateAndTime;
@property (copy, nonatomic) NSString* video;
@property (readwrite, assign) int uid;



@end
