//
//  addNoteViewController.m
//  BookmarkManager
//
//  Created by Sri Ram on 24/01/2017.
//  Copyright © 2017 Sri Ram. All rights reserved.
//

#import "addNoteViewController.h"
#import "AppDelegate.h"


@interface addNoteViewController ()

{
    AppDelegate *delegate;
}
@end

@implementation addNoteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSMutableDictionary *temp = [delegate.dummyJsonArray objectAtIndex:delegate.selectedNote];
    
    NSURLRequest *request = [NSURLRequest
                             requestWithURL:
                             [NSURL URLWithString:@"https://jsonplaceholder.typicode.com/photos"]
                             cachePolicy:NSURLRequestUseProtocolCachePolicy
                             timeoutInterval:5.0];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask* dataTask = [session
                                      dataTaskWithRequest:request
                                      completionHandler:^(NSData* data, NSURLResponse* response,
                                                          NSError* error) {
                                          if ([data length] > 0 && error == nil) {
                                              
                                              self.imageView.image = [UIImage imageWithData:data];

                                              
                                          }}];
    [dataTask resume];

    self.textView.text = [temp objectForKey:@"title"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
