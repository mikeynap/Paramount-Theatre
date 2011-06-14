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

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    loaded = TRUE;
    show = [[MNShow alloc] initWithId:uid];
    [super viewDidLoad];
    [text setText:show.description];
    text.font = [UIFont fontWithName:@"Helvetica" size:15];
    // Do any additional setup after loading the view from its nib.
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
