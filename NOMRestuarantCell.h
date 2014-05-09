//
//  NOMRestuarantCell.h
//  Nom Nom
//
//  Created by Adetomiwa Oguntuga on 1/5/14.
//  Copyright (c) 2014 blaknerd development. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NOMRestuarantCell : UITableViewCell
{
    
}
@property (weak, nonatomic) IBOutlet UILabel *restuarantName;
@property (weak, nonatomic) id controller;
@property (weak, nonatomic) UITableView *tableView;
//- (IBAction)mapDirections:(id)sender;
@end
