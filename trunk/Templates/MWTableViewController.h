//
//  MWTableViewController.h
//  Templates
//
//  Created by asaf vertz on 5/18/13.
//  Copyright (c) 2013 Mobiwedo. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ODRefreshControl.h"
#import "GAITrackedViewController.h"

#import "MWConstants.h"
#import "MWDataSingleton.h"

#import "MWCustomCell.h"

@interface MWTableViewController : GAITrackedViewController
<UITableViewDataSource, UITableViewDelegate, MWCustomCellDelegate>
{
    NSMutableArray* _dataSource;
    
    // ODRefreshControl
    ODRefreshControl *_refreshControl;
    BOOL _isRefreshing;
    
    // table editing
    BOOL _isEditing;
}

@property (weak, nonatomic) IBOutlet UITableView *table;

@end
