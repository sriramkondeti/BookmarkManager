//
//  AppDelegate.h
//  BookmarkManager
//
//  Created by Sri Ram on 24/01/2017.
//  Copyright © 2017 Sri Ram. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;
@property (strong,nonatomic)  NSMutableArray *dummyJsonArray;
@property (nonatomic, assign)  int selectedNote;

- (void)saveContext;


@end

