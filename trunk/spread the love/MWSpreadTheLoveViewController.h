//
//  SpreadTheLoveViewController.h
//  Slide.ly
//
//  Created by Yuri Fatahov on 4/21/13.
//  Copyright (c) 2013 EasiHi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>
#import <MessageUI/MFMessageComposeViewController.h>

#import "GAITrackedViewController.h"

@interface MWSpreadTheLoveViewController : GAITrackedViewController
<UITableViewDataSource, UITableViewDelegate, MFMailComposeViewControllerDelegate, MFMessageComposeViewControllerDelegate>
{
    
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIScrollView *spreadScrollView;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;

@end
