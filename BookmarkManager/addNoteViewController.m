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
    int selectedType;
    NSData *originalImageData;
    NSArray *stopWords;
    NSString *tagString;
    NSMutableArray * userstring;

}
@end

@implementation addNoteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   stopWords = @[@"a",@"a's",@"able",@"about",@"above",@"according",@"accordingly",@"across",@"actually",@"after",@"afterwards",@"again",@"against",@"ain't",@"all",@"allow",@"allows",@"almost",@"alone",@"along",@"already",@"also",@"although",@"always",@"am",@"among",@"amongst",@"an",@"and",@"another",@"any",@"anybody",@"anyhow",@"anyone",@"anything",@"anyway",@"anyways",@"anywhere",@"apart",@"appear",@"appreciate",@"appropriate",@"are",@"aren't",@"around",@"as",@"aside",@"ask",@"asking",@"associated",@"at",@"available",@"away",@"awfully",@"b",@"be",@"became",@"because",@"become",@"becomes",@"becoming",@"been",@"before",@"beforehand",@"behind",@"being",@"believe",@"below",@"beside",@"besides",@"best",@"better",@"between",@"beyond",@"both",@"brief",@"but",@"by",@"c",@"c'mon",@"c's",@"came",@"can",@"can't",@"cannot",@"cant",@"cause",@"causes",@"certain",@"certainly",@"changes",@"clearly",@"co",@"com",@"come",@"comes",@"concerning",@"consequently",@"consider",@"considering",@"contain",@"containing",@"contains",@"corresponding",@"could",@"couldn't",@"course",@"currently",@"d",@"definitely",@"described",@"despite",@"did",@"didn't",@"different",@"do",@"does",@"doesn't",@"doing",@"don't",@"done",@"down",@"downwards",@"during",@"e",@"each",@"edu",@"eg",@"eight",@"either",@"else",@"elsewhere",@"enough",@"entirely",@"especially",@"et",@"etc",@"even",@"ever",@"every",@"everybody",@"everyone",@"everything",@"everywhere",@"ex",@"exactly",@"example",@"except",@"f",@"far",@"few",@"fifth",@"first",@"five",@"followed",@"following",@"follows",@"for",@"former",@"formerly",@"forth",@"four",@"from",@"further",@"furthermore",@"g",@"get",@"gets",@"getting",@"given",@"gives",@"go",@"goes",@"going",@"gone",@"got",@"gotten",@"greetings",@"h",@"had",@"hadn't",@"happens",@"hardly",@"has",@"hasn't",@"have",@"haven't",@"having",@"he",@"he's",@"hello",@"help",@"hence",@"her",@"here",@"here's",@"hereafter",@"hereby",@"herein",@"hereupon",@"hers",@"herself",@"hi",@"him",@"himself",@"his",@"hither",@"hopefully",@"how",@"howbeit",@"however",@"i",@"i'd",@"i'll",@"i'm",@"i've",@"ie",@"if",@"ignored",@"immediate",@"in",@"inasmuch",@"inc",@"indeed",@"indicate",@"indicated",@"indicates",@"inner",@"insofar",@"instead",@"into",@"inward",@"is",@"isn't",@"it",@"it'd",@"it'll",@"it's",@"its",@"itself",@"j",@"just",@"k",@"keep",@"keeps",@"kept",@"know",@"known",@"knows",@"l",@"last",@"lately",@"later",@"latter",@"latterly",@"least",@"less",@"lest",@"let",@"let's",@"like",@"liked",@"likely",@"little",@"look",@"looking",@"looks",@"ltd",@"m",@"mainly",@"many",@"may",@"maybe",@"me",@"mean",@"meanwhile",@"merely",@"might",@"more",@"moreover",@"most",@"mostly",@"much",@"must",@"my",@"myself",@"n",@"name",@"namely",@"nd",@"near",@"nearly",@"necessary",@"need",@"needs",@"neither",@"never",@"nevertheless",@"new",@"next",@"nine",@"no",@"nobody",@"non",@"none",@"noone",@"nor",@"normally",@"not",@"nothing",@"novel",@"now",@"nowhere",@"o",@"obviously",@"of",@"off",@"often",@"oh",@"ok",@"okay",@"old",@"on",@"once",@"one",@"ones",@"only",@"onto",@"or",@"other",@"others",@"otherwise",@"ought",@"our",@"ours",@"ourselves",@"out",@"outside",@"over",@"overall",@"own",@"p",@"particular",@"particularly",@"per",@"perhaps",@"placed",@"please",@"plus",@"possible",@"presumably",@"probably",@"provides",@"q",@"que",@"quite",@"qv",@"r",@"rather",@"rd",@"re",@"really",@"reasonably",@"regarding",@"regardless",@"regards",@"relatively",@"respectively",@"right",@"s",@"said",@"same",@"saw",@"say",@"saying",@"says",@"second",@"secondly",@"see",@"seeing",@"seem",@"seemed",@"seeming",@"seems",@"seen",@"self",@"selves",@"sensible",@"sent",@"serious",@"seriously",@"seven",@"several",@"shall",@"she",@"should",@"shouldn't",@"since",@"six",@"so",@"some",@"somebody",@"somehow",@"someone",@"something",@"sometime",@"sometimes",@"somewhat",@"somewhere",@"soon",@"sorry",@"specified",@"specify",@"specifying",@"still",@"sub",@"such",@"sup",@"sure",@"t",@"t's",@"take",@"taken",@"tell",@"tends",@"th",@"than",@"thank",@"thanks",@"thanx",@"that",@"that's",@"thats",@"the",@"their",@"theirs",@"them",@"themselves",@"then",@"thence",@"there",@"there's",@"thereafter",@"thereby",@"therefore",@"therein",@"theres",@"thereupon",@"these",@"they",@"they'd",@"they'll",@"they're",@"they've",@"think",@"third",@"this",@"thorough",@"thoroughly",@"those",@"though",@"three",@"through",@"throughout",@"thru",@"thus",@"to",@"together",@"too",@"took",@"toward",@"towards",@"tried",@"tries",@"truly",@"try",@"trying",@"twice",@"two",@"u",@"un",@"under",@"unfortunately",@"unless",@"unlikely",@"until",@"unto",@"up",@"upon",@"us",@"use",@"used",@"useful",@"uses",@"using",@"usually",@"uucp",@"v",@"value",@"various",@"very",@"via",@"viz",@"vs",@"w",@"want",@"wants",@"was",@"wasn't",@"way",@"we",@"we'd",@"we'll",@"we're",@"we've",@"welcome",@"well",@"went",@"were",@"weren't",@"what",@"what's",@"whatever",@"when",@"whence",@"whenever",@"where",@"where's",@"whereafter",@"whereas",@"whereby",@"wherein",@"whereupon",@"wherever",@"whether",@"which",@"while",@"whither",@"who",@"who's",@"whoever",@"whole",@"whom",@"whose",@"why",@"will",@"willing",@"wish",@"with",@"within",@"without",@"won't",@"wonder",@"would",@"wouldn't",@"x",@"y",@"yes",@"yet",@"you",@"you'd",@"you'll",@"you're",@"you've",@"your",@"yours",@"yourself",@"yourselves",@"z",@"zero"];
    [self.titleText setDelegate:self];
    delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    if (delegate.selectedNote!=-1) {
    
    
    NSMutableDictionary *temp = [delegate.dummyJsonArray objectAtIndex:delegate.selectedNote];
    
    
    self.imageView.image = [UIImage imageWithData:[temp valueForKey:@"image"]];
    self.titleText.text = [temp valueForKey:@"text"];
        [self.lblTitle setHidden:NO];
        [self.titleText setHidden:NO];
        [self.titleText setUserInteractionEnabled:NO];
        [self.lblSelectTags setHidden:NO];
        [self.tagsView setHidden:NO];
        if ([temp valueForKey:@"image"]) {
            [self.lblPicture setHidden:NO];
            [self.imageView setHidden:NO];

        }
    NSString *tagVal =  [temp valueForKey:@"tags"];
        NSArray *arr = [tagVal componentsSeparatedByString:@","];
        [_btnTag setTitle:[arr objectAtIndex:0] forState:UIControlStateNormal];

        for (int i=1; i<[arr count];i++) {
            UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(i*94, 0, 94, 36)];
            [btn setTitle:[arr objectAtIndex:i] forState:UIControlStateNormal];
            [btn.titleLabel setFont:_btnTag.titleLabel.font];
            btn.titleLabel.textColor = _btnTag.titleLabel.textColor;
            [btn setBackgroundImage:_btnTag.currentBackgroundImage forState:UIControlStateNormal];
            [self.tagsView addSubview: btn];
        }
        [_tagsView setContentSize:CGSizeMake(94*arr.count, _tagsView.frame.size.height)];
        [_tagsView setBackgroundColor:[UIColor lightGrayColor] ];

    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    delegate.selectedNote = -1;

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/




- (IBAction)saveData:(id)sender {
    
    if (delegate.selectedNote==-1 &&(_titleText.text.length>0||originalImageData !=nil||userstring.count>0)) {
        
    
    NSPersistentContainer *PersistentContainer = [delegate persistentContainer];
    
    // Create a new managed object
    NSManagedObject *newNote = [NSEntityDescription insertNewObjectForEntityForName:@"Note" inManagedObjectContext:PersistentContainer.viewContext];
    [newNote setValue:_titleText.text forKey:@"text"];
    [newNote setValue:originalImageData forKey:@"image"];
    [newNote setValue:[userstring componentsJoinedByString:@","] forKey:@"tags"];
    [delegate saveContext];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)selectType:(UIButton *)sender {
    
    selectedType = (int)sender.tag;
    [self.lblTitle setHidden:NO];
    [self.titleText setHidden:NO];
    [self.titleText setUserInteractionEnabled:YES];
    [self.lblSelectTags setHidden:NO];
    [self.tagsView setHidden:NO];
    if (sender.tag!=0) {
    [self.lblPicture setHidden:NO];
    [self.imageView setHidden:NO];
        [self.btnAddImage setHidden:NO];

    }
    else{
        [self.lblPicture setHidden:YES];
        [self.imageView setHidden:YES];
        [self.btnAddImage setHidden:YES];

    }

   
    
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    if([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    
    return YES;
}
- (void)textViewDidEndEditing:(UITextView *)textView
{
    NSString *str= textView.text;
   

   userstring = [[NSMutableArray alloc]initWithArray:[str componentsSeparatedByString:@" "]];
    [userstring removeObjectsInArray:stopWords];
    [_btnTag setTitle:[userstring objectAtIndex:0] forState:UIControlStateNormal];
    for (int i=1; i<userstring.count; i++) {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(i*94, 0, 94, 36)];
        [btn setTitle:[userstring objectAtIndex:i] forState:UIControlStateNormal];
        [btn.titleLabel setFont:_btnTag.titleLabel.font];
        btn.titleLabel.textColor = _btnTag.titleLabel.textColor;
        [btn setBackgroundImage:_btnTag.currentBackgroundImage forState:UIControlStateNormal];
        [self.tagsView addSubview: btn];
    }
    [_tagsView setContentSize:CGSizeMake(94*userstring.count, _tagsView.frame.size.height)];
    [_tagsView setBackgroundColor:[UIColor lightGrayColor] ];
    
    
}

- (IBAction)takePhoto:(UIButton *)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:picker animated:YES completion:nil];
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.imageView.image = chosenImage;
    originalImageData = UIImageJPEGRepresentation(chosenImage, 0.8);

    
    [picker dismissViewControllerAnimated:YES completion:nil];
}
@end
