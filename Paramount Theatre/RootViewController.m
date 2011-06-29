//
//  RootViewController.m
//  Paramount Theatre
//
//  Created by Moo on 6/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"
#import "ShowSubView.h"

@implementation RootViewController

- (void)awakeFromNib{
    events = [[NSMutableArray alloc] init];
    NSArray *data = [NSArray arrayWithContentsOfURL:[NSURL URLWithString:@"http://paramountlive.org/iPhone.php"]];
    for (NSDictionary *dict in data){
        ShowSubView *view = [[ShowSubView alloc] initWithId:[[dict objectForKey:@"id"] integerValue]];
        [dict retain];
        [events addObject: [NSDictionary dictionaryWithObjectsAndKeys:[dict objectForKey:@"title"] , @"title", [dict objectForKey:@"dt"], @"date", view, @"controller",  nil]];
//        [self performSelectorInBackground:@selector(getBackgroundInfo:) withObject:view];
        [view release];   
    }
    UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] init];
    temporaryBarButtonItem.title = @"Back";
    self.navigationItem.backBarButtonItem = temporaryBarButtonItem;
    [temporaryBarButtonItem release];
    self.title = @"Paramount Theatre Events";
    self.tableView.backgroundColor = [UIColor clearColor];
    
}



- (void)viewDidLoad
{
    [super viewDidLoad];

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    

}


- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

/*
 // Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations.
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
 */

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [events count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        
        
        UILabel *title = [[[UILabel alloc] initWithFrame:CGRectMake(10, 4, 400, 20)] autorelease];    
        [title setBackgroundColor:[UIColor clearColor]];
        [title setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:14]];
        [title setText:[[events objectAtIndex:indexPath.row] objectForKey:@"title"]];
        [cell addSubview:title];
        
        
        UILabel *subTitle = [[[UILabel alloc] initWithFrame:CGRectMake(10, 17, 480, 30)] autorelease];
        
        [subTitle setBackgroundColor:[UIColor clearColor]];
        [subTitle setAlpha:.8];
        [subTitle setFont:[UIFont fontWithName:@"HelveticaNeue" size:12]];
        [subTitle setText:[[events objectAtIndex:indexPath.row] objectForKey:@"date"]];
        [cell addSubview:subTitle];
        
        
        // Configure the cell.
        UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] init];
        temporaryBarButtonItem.title = @"Back";
        self.navigationItem.backBarButtonItem = temporaryBarButtonItem;
        [temporaryBarButtonItem release];
        




    }

    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert)
    {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    ShowSubView *targetViewController = [[events objectAtIndex: indexPath.row] objectForKey:@"controller"];
    [[self navigationController] pushViewController:targetViewController animated:YES];
    

}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload
{
    [super viewDidUnload];

    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}

- (void)getBackgroundInfo:(id)arg{
    NSAutoreleasePool *apool = [[NSAutoreleasePool alloc] init];
    [arg getData];
    [apool drain];
}

- (void)dealloc
{
    [super dealloc];
}

@end
