//
//  NotesViewController.m
//  BookmarkManager
//
//  Created by Sri Ram on 24/01/2017.
//  Copyright © 2017 Sri Ram. All rights reserved.
//

#import "NotesViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "AppDelegate.h"

@interface NotesViewController ()
{
    NSMutableArray *noteListArray;
    AppDelegate *delegate;
}

@end

@implementation NotesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    noteListArray = [NSMutableArray array];
    [self.filterView setScrollEnabled:YES];
    [self.filterView setContentSize:CGSizeMake(825,38)];
    delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    self.tableview.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);


    // Do any additional setup after loading the view.
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.tabBarController.navigationItem.hidesBackButton=YES;
    self.tableview.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);

}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    NSManagedObjectContext *managedObjectContext = delegate.persistentContainer.viewContext;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Note"];
    delegate.dummyJsonArray = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    [self.tableview reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Tableview Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView

{
    tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return delegate.dummyJsonArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
   
        return 44;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Remove seperator inset
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    // Prevent the cell from inheriting the Table View's margin settings
    if ([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]) {
        [cell setPreservesSuperviewLayoutMargins:NO];
    }
    
    // Explictly set your cell's layout margins
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] ;
    
    NSManagedObject *temp = [delegate.dummyJsonArray objectAtIndex:indexPath.row];

    cell.textLabel.text =[temp valueForKey:@"text"];
    cell.detailTextLabel.text =  [temp valueForKey:@"tags"];
    cell.imageView.image = [UIImage imageWithData:[temp valueForKey:@"image"]];
    cell.imageView.clipsToBounds = YES;
    cell.imageView.layer.masksToBounds = YES;
    cell.imageView.layer.cornerRadius =  20;

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    delegate.selectedNote = (int)indexPath.row;
    [self performSegueWithIdentifier:@"showDetail" sender:self];
    
    
}

- (IBAction)prepareForUnwind:(UIStoryboardSegue *)segue {
    
    
}

- (void)didReceiveData {
    dispatch_async(dispatch_get_main_queue(), ^{
        
        //[self.tableview reloadData];
    });
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
