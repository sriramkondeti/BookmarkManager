//
//  addNoteViewController.h
//  BookmarkManager
//
//  Created by Sri Ram on 24/01/2017.
//  Copyright © 2017 Sri Ram. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface addNoteViewController : UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate,UITextViewDelegate>
- (IBAction)saveData:(id)sender;
- (IBAction)selectType:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UILabel *lblPicture;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *btnAddImage;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UITextView *titleText;
@property (weak, nonatomic) IBOutlet UILabel *lblSelectTags;
@property (weak, nonatomic) IBOutlet UIScrollView *tagsView;
@property (weak, nonatomic) IBOutlet UIButton *btnTag;

@end
