//
//  NOMResultTableViewController.m
//  Nom Nom
//
//  Created by Adetomiwa Oguntuga on 1/5/14.
//  Copyright (c) 2014 blaknerd development. All rights reserved.
//

#import "NOMResultTableViewController.h"
#import "NOMRestuarant.h"
#import "NOMRestuarantList.h"
#import "MainMenuViewController.h"
#import "NOMRestuarantCell.h"
#import "NOMRestuarantDetailViewController.h"
@interface NOMResultTableViewController ()

@end

@implementation NOMResultTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    
    if (self){
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UINib *nib = [UINib nibWithNibName:@"NOMRestuarantCell" bundle:nil];
    [[self tableView] registerNib:nib forCellReuseIdentifier:@"restuarantCell"];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [[[NOMRestuarantList sharedList] allRestuarants] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NOMRestuarant *r=[[[NOMRestuarantList sharedList]allRestuarants] objectAtIndex:[indexPath row]];
    /*UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    }
    
    [[cell textLabel] setText:[r restuarantName]];*/
    NOMRestuarantCell *cell = [tableView dequeueReusableCellWithIdentifier:@"restuarantCell"];
    [cell setController:self];
    [cell setTableView:tableView];
    [[cell restuarantName] setText:[r restuarantName]];
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
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
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

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

- (IBAction)goBackToMainMenu:(id)sender {
    /*MainMenuViewController *mainMenu = [[MainMenuViewController alloc] init];
    UINavigationController *navControl = [[UINavigationController alloc] initWithRootViewController:mainMenu];
    [self presentViewController:navControl animated:YES completion:nil];*/
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];
}

-(UIView *)footerViewForTask
{
    if(!footerViewTask){
        [[NSBundle mainBundle] loadNibNamed:@"ResultTableFooter" owner:self options:nil];
    }
    
    return footerViewTask;
}

-(UIView *)tableView:(UITableView *)tv viewForFooterInSection:(NSInteger)sec
{
    return [self footerViewForTask];
}

-(CGFloat)tableView:(UITableView *)tv heightForFooterInSection:(NSInteger)sec
{
    return [[self footerViewForTask] bounds].size.height;
}

-(void)tableView:(UITableView *)aTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //DetailViewController *detailViewController =[[DetailViewController alloc] init];
    NOMRestuarantDetailViewController *d = [[NOMRestuarantDetailViewController alloc] initForNewitem:NO];
    NOMRestuarantList *p =[NOMRestuarantList sharedList];
    NOMRestuarant *r = [[p allRestuarants] objectAtIndex:[indexPath row]];
    [d setRestuarant:r];
    [d setDismissBlock:^{[[self tableView] reloadData];}];
    [[self navigationController] pushViewController:d animated:YES];
}
@end
