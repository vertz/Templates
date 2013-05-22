//
//  SpreadTheLoveViewController.m
//  Slide.ly
//
//  Created by Yuri Fatahov on 4/21/13.
//  Copyright (c) 2013 EasiHi. All rights reserved.
//

# import "MWSpreadTheLoveViewController.h"
# import "SpreadCell.h"
# import "MWFacebook.h"
# import "MWTwitter.h"

@interface MWSpreadTheLoveViewController ()

@end

@implementation MWSpreadTheLoveViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
        
   _tableView.delegate = self;
    _tableView.dataSource = self;
    
    UIImage *image = [UIImage imageNamed:@"Spread_close_btn.png"];
    UIButton *back =[[UIButton alloc] initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
    
    [back setImage:image forState:UIControlStateNormal];
    [back addTarget:self action:@selector(didCloseBtnPressed) forControlEvents:UIControlEventTouchUpInside];
    
    if(kScreenSize == 568)
    {
        CGRect frame = _backgroundImage.frame;
        frame.size.height = 568;
        frame.origin.y = 0;
        _backgroundImage.frame = frame;
        _backgroundImage.image = [UIImage imageNamed:@"Spread_backbg-568h@2x.png"];
        
        frame = _spreadScrollView.frame;
        frame.size.height = 568;
        _spreadScrollView.frame = frame;
    }
    
    [_spreadScrollView setContentSize:CGSizeMake(_spreadScrollView.frame.size.width, 680.0f)];
}


#pragma mark tableview
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger rowsNumber = 0;
    switch (section) {
        case 0: //Spread the love
            rowsNumber = 3;
            break;
        case 1: //Stay connected
            rowsNumber = 2;
            break;
        case 2: //Help us shine
            rowsNumber = 1;
            break;
        default:
            break;
    }
    
    return rowsNumber;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //Spread the love, Stay connected, Help us shine
    return 3;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString* title = @"";
    switch (section) {
        case 0: //Spread the love            
            title = NSLocalizedString(@"EZSpreadTheLove",@"Spread the love");            
            break;
        case 1: //Stay connected            
            title = NSLocalizedString(@"EZStayConnected",@"Stay connected");            
            break;
        case 2: //Help us shine            
            title= NSLocalizedString(@"EZHelpUsShine",@"Help us shine");
            break;
        default:
            break;
    }
    
    return title;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SpreadCell* cell = [_tableView dequeueReusableCellWithIdentifier:@"EZSpreadCell"];
        
    NSArray* frontObjects = [[NSBundle mainBundle] loadNibNamed:@"SpreadCell" owner:nil options:nil];
    for (id obj in frontObjects){
        if ([obj isKindOfClass:[SpreadCell class]]){
            cell = (SpreadCell*)obj;
        }
    }
    
    switch (indexPath.section) {
        case 0: //Spread the love  
            switch (indexPath.row) {
                case 0: // Email a friend
                    [cell initSpreadCell:MWSlidelySpreadTypeEmail];
                    break;
                case 1: // Share on facebook
                    [cell initSpreadCell:MWSlidelySpreadTypeFBShare];
                    break;
                case 2: // Share on twitter
                    [cell initSpreadCell:MWSlidelySpreadTypeTwitterShare];
                    break;
                default:
                    break;
            }
            break;
        case 1: //Stay connected
            switch (indexPath.row) {
                case 0: // Like our page
                    [cell initSpreadCell:MWSlidelySpreadTypeFBLike];
                    break;
                case 1: // Follow us on twitter
                    [cell initSpreadCell:MWSlidelySpreadTypeTwitterFollow];
                    break;
                default:
                    break;
            }
            break;
        case 2: //Help us shine
            switch (indexPath.row) {
                case 0: // Rate us on the appstore
                    [cell initSpreadCell:MWSlidelySpreadTypeRateUs];
                    break;                   
                default:
                    break;
            }
            break;
        default:
            break;
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SpreadCell* cell = (SpreadCell *) [tableView cellForRowAtIndexPath:indexPath];
    [cell setSelected:NO animated:NO];
    
    switch (indexPath.section) {
        case 0: //Spread the love
            switch (indexPath.row) {
                case 0: // Email a friend
                    [self sendByEmail];
                    break;
                case 1: // Share on facebook
                    [self shareToFacebook];
                    break;
                case 2: // Share on twitter
                    [self shareToTwitter];
                    break;
                default:
                    break;
            }
            break;
        case 1: //Stay connected
            switch (indexPath.row) {
                case 0: // Like our page
                    [self likeFacebookPage];
                    break;
                case 1: // Follow us on twitter
                    [self followOnTwitter];
                    break;
                default:
                    break;
            }
            break;
        case 2: //Help us shine
            switch (indexPath.row) {
                case 0: // Rate us on the appstore
                    [self rateOnAppstore];
                    break;
                default:
                    break;
            }
            break;
        default:
            break;
    }
}

#pragma mark - Private Methods

- (void)sendByEmail
{
    if ([MFMailComposeViewController canSendMail])
    {
        MFMailComposeViewController *mailViewController = [[MFMailComposeViewController alloc] init];
        mailViewController.mailComposeDelegate = self;
        [mailViewController setSubject:NSLocalizedString(@"share_app_email_subject", @"Tell a friend about the app e-mail subject")];
        [mailViewController setMessageBody:[NSString stringWithFormat:NSLocalizedString(@"share_app_email_text", @"Tell a friend about the app e-mail text"), @"http://www.abc.com"] isHTML:YES];
        [self presentModalViewController:mailViewController animated:YES];
    }
}

- (void)shareToFacebook
{
    MWFacebook *facebook = [[MWFacebook alloc] initWithDelegate:nil];
    facebook.link = @"http://www.bububu.com";
    facebook.userMessage = [NSString stringWithFormat:NSLocalizedString(@"share_app_social_networks_text", @"Share App on social networks text"), @""];
    [facebook postWithAllowLogin:YES];
}



- (void)shareToTwitter
{
    MWTwitter *twitter = [[MWTwitter alloc] initWithDelegate:nil];
    [twitter postLinkFromViewController:self];
}


- (void)likeFacebookPage
{
    NSURL *fanPageURL = [NSURL URLWithString:@"fb://profile/122416794475170"];
    
    if (![[UIApplication sharedApplication] openURL: fanPageURL]) {
        NSURL *webURL = [NSURL URLWithString:@"https://www.facebook.com/122416794475170"];
        [[UIApplication sharedApplication] openURL: webURL];
    }
}


- (void)followOnTwitter
{
    NSURL *fanPageURL = [NSURL URLWithString:@"twitter:///user?screen_name=Slidely"];
    
    if (![[UIApplication sharedApplication] openURL: fanPageURL]) {
        NSURL *webURL = [NSURL URLWithString:@"https://twitter.com/Slidely"];
        [[UIApplication sharedApplication] openURL: webURL];
    }
}


- (void)rateOnAppstore
{
    //TODO: app ID needed (from iTunesconnect)
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"Rate?"
                          message:@"Oops! We have no APP ID, so nothing to rate. Please, try later..."
                          delegate:nil
                          cancelButtonTitle:nil
                          otherButtonTitles:@"OK", nil];
    
    [alert show];
}

#pragma mark - MFMailComposeViewControllerDelegate Methods
- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    NSString *message = @"";
    
    switch (result)
    {
        case MFMailComposeResultSaved:
            message = @"Your message was saved to the draft folder.";
            break;
        case MFMailComposeResultSent:
            message = @"Your message was sent.";
            break;
        case MFMailComposeResultFailed:
            message = @"There was an error. The message was not sent.";
            break;
        case MFMailComposeResultCancelled:
        default:
            break;
    }
    [self dismissModalViewControllerAnimated:YES];
    
    if ([message length] > 0)
    {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"Save"
                              message:message
                              delegate:self
                              cancelButtonTitle:nil
                              otherButtonTitles:@"OK", nil];
        [alert show];
    }
    
    return;
}

-(void) didCloseBtnPressed
{
    [self dismissModalViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewDidUnload
{
     _tableView = nil;
    [self setSpreadScrollView:nil];
    [self setBackgroundImage:nil];
    [super viewDidUnload];
}
@end
