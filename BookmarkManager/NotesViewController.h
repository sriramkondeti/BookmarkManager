//
//  NotesViewController.h
//  BookmarkManager
//
//  Created by Sri Ram on 24/01/2017.
//  Copyright © 2017 Sri Ram. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NotesViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *filterView;

@property (weak, nonatomic) IBOutlet UITableView *tableview;
@end
