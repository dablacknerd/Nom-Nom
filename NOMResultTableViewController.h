//
//  NOMResultTableViewController.h
//  Nom Nom
//
//  Created by Adetomiwa Oguntuga on 1/5/14.
//  Copyright (c) 2014 blaknerd development. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NOMResultTableViewController : UITableViewController <UITableViewDataSource>
{
    
    IBOutlet UIView *footerViewTask;
}
- (IBAction)goBackToMainMenu:(id)sender;
-(UIView *)footerViewForTask;
@end
