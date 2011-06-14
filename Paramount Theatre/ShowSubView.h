//
//  ShowSubView.h
//  Paramount Theatre
//
//  Created by Moo on 6/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MNShow;

@interface ShowSubView : UIViewController {
    IBOutlet UITextView *text;
    IBOutlet UILabel *title;
    IBOutlet UILabel *date;
    IBOutlet UILabel *price;
    IBOutlet MNShow *show;
    int uid;
    BOOL loaded;
    
}

-(id) initWithId:(int)uid;
- (MNShow *)show;
@end
