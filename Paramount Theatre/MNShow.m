//
//  MNShow.m
//  Paramount Theatre
//
//  Created by Moo on 6/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MNShow.h"
#import "GTMNSString+HTML.h"

@implementation MNShow
@synthesize date, dateAndTime, title,description,price,video,url,uid;

- (id) initWithId:(int)_uid{
    self = [super init];
    NSDictionary *data = [NSDictionary dictionaryWithContentsOfURL:[NSURL URLWithString:
                                                                    [NSString stringWithFormat:@"http://paramountlive.org/iPhone.php?id=%i", _uid]]]; 

    date = [NSDate dateWithTimeIntervalSince1970:[[data objectForKey:@"date"] doubleValue]];
    title = [data objectForKey:@"title"];
    uid = [[data objectForKey:@"id"] integerValue];
    dateAndTime = [data objectForKey:@"dt"];
    price = [data objectForKey:@"ticket"];
    description = [data objectForKey:@"desc"];
    video = [[data objectForKey:@"video"] gtm_stringByEscapingForAsciiHTML];
    NSLog(@"%@ %@", date, description); 
    return self;
}


@end
