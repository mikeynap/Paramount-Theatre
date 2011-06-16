//
//  ShowSubView.m
//  Paramount Theatre
//
//  Created by Moo on 6/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ShowSubView.h"
#import "MNShow.h"

@implementation ShowSubView

- (void)openPurchase{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.paramounttickets.org/Attractions.ashx"]];

}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id) initWithId:(int)_uid{
    self = [super init];
    uid = _uid;
    loaded = FALSE;
//    [self performSelectorInBackground:@selector(getData) withObject:nil];

    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)getData{
//    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    show = [[MNShow alloc] initWithId:uid];
    loaded = TRUE;
//    [pool drain];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    if (!loaded) [self getData];
    [text setText:show.description];
    text.font = [UIFont fontWithName:@"Helvetica" size:15];
    [titleLabel setText:show.title];
    [priceLabel setText: show.price];
    [dateView setText:show.dateAndTime];
    UIBarButtonItem *newBackButton = [[UIBarButtonItem alloc] initWithTitle:@"Purchase Ticket"  style: UIBarButtonItemStyleBordered target: self action: @selector(openPurchase)];
    self.navigationItem.rightBarButtonItem = newBackButton;

    [newBackButton release];

    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
- (MNShow *)show{
    return (loaded) ? show : nil;
}
@end
