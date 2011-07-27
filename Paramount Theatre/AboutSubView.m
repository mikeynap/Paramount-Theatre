//
//  AboutSubView.m
//  Paramount Theatre
//
//  Created by Moo on 7/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AboutSubView.h"


@implementation AboutSubView
@synthesize about;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
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
    
    NSString *path = [[NSBundle mainBundle] bundlePath];
    NSURL *baseURL = [NSURL fileURLWithPath:path];
    about.scalesPageToFit = YES;
    [about loadHTMLString:[NSString stringWithContentsOfFile:[NSString stringWithFormat:@"%@/about.txt", path] encoding:NSUTF8StringEncoding error:NULL] baseURL:baseURL];

    self.title = @"About";

    [super viewDidLoad];
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

@end
