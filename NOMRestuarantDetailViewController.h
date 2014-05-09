//
//  NOMRestuarantDetailViewController.h
//  Nom Nom
//
//  Created by Adetomiwa Oguntuga on 1/9/14.
//  Copyright (c) 2014 blaknerd development. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NOMRestuarantList.h"
#import "NOMRestuarant.h"
#import <AddressBook/AddressBook.h>
@interface NOMRestuarantDetailViewController : UIViewController
{
    
}
@property (weak, nonatomic) IBOutlet UILabel *addressOneTextField;
@property (weak, nonatomic) IBOutlet UILabel *stateTextField;
@property (weak, nonatomic) IBOutlet UILabel *cityTextField;
-(id)initForNewitem:(BOOL)isNew;
@property (nonatomic,copy)void(^dismissBlock)(void);
@property (weak, nonatomic) IBOutlet UILabel *zipcodeTextField;
@property (weak, nonatomic) IBOutlet UILabel *phoneNumberTextField;
@property (nonatomic,strong)NOMRestuarant *restuarant;
- (IBAction)getMapDirections:(id)sender;

@end
