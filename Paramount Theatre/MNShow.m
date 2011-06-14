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


    self.date = [NSDate dateWithTimeIntervalSince1970:[[data objectForKey:@"date"] doubleValue]];
    self.title = [data objectForKey:@"title"];
    self.uid = [[data objectForKey:@"id"] integerValue];
    self.dateAndTime = [data objectForKey:@"dt"];
    self.price = [data objectForKey:@"ticket"];
    self.description = [data objectForKey:@"desc"];
    self.video = [data objectForKey:@"video"];
    
    NSLog(@"%@ %@", date, description); 
    return self;
}


@end
