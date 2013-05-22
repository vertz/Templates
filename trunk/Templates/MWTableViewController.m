//
//  MWTableViewController.m
//  Templates
//
//  Created by asaf vertz on 5/18/13.
//  Copyright (c) 2013 Mobiwedo. All rights reserved.
//

#import "MWTableViewController.h"

@interface MWTableViewController ()

@end

@implementation MWTableViewController

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
    
    [self loadNavigationBar];
    [self initRefreshControl];
    
    _dataSource = [[NSMutableArray alloc] init];
    
    for(NSInteger i = 0 ; i < 5 ; ++i)
    {
        NSString* str = [[NSString alloc]initWithFormat:@"this is the - %.2d row",i];
        [_dataSource addObject: str];
    }
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

#pragma mark - table

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataSource count];
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellIdentifier = @"CustomCellIdentifier";
    
    MWCustomCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(!cell){
        NSArray* frontObjects = [[NSBundle mainBundle] loadNibNamed:@"MWCustomCell" owner:nil options:nil];
        for (id obj in frontObjects){
            if ([obj isKindOfClass:[MWCustomCell class]]){
                cell = (MWCustomCell*)obj;
            }
        }
    }
    
    if(!cell)
    {
        LogError(@"cell is nil");
        return nil;
    }
    
    NSInteger row = [indexPath row];
    
    
    [cell setDelegate:self];
    
    if(row < [_dataSource count])
    {
        NSDictionary* dict = [[MWDataSingleton sharedInstance] objectAtIndex:row];
        if(dict != nil)
        {
            [cell prepareForUse:_isEditing
                        withRow:row
                  andImageNamed:[dict valueForKey:@"image"]];
            
            [cell.titleLabel setText:[dict valueForKey:@"title"]];
            [cell.textLabel setText:[dict valueForKey:@"text"]];
        }
        else
        {
            LogError(@"dict (%d) is nil",row);
        }
        
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    
    return cell;
}

-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return TableTemplateRowHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = [indexPath row];
    if(row < 0 || row >= [_dataSource count])
    {
        LogError(@"row < 0 || row >= [_dataSource count]");
        return;
    }
}

#pragma mark - table edit

- (void) tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(!_isEditing){
        return;
    }
    
	//	Grip customization code goes in here...
	for(UIView* view in cell.subviews)
	{
        
		if([[[view class] description] isEqualToString:@"UITableViewCellReorderControl"])
		{
			UIView* resizedGripView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetMaxX(view.frame), CGRectGetMaxY(view.frame))];
			[resizedGripView addSubview:view];
			[cell addSubview:resizedGripView];
            
			CGSize sizeDifference = CGSizeMake(resizedGripView.frame.size.width - view.frame.size.width, resizedGripView.frame.size.height - view.frame.size.height);
			CGSize transformRatio = CGSizeMake(resizedGripView.frame.size.width / view.frame.size.width, resizedGripView.frame.size.height / view.frame.size.height);
            
			//	Original transform
			CGAffineTransform transform = CGAffineTransformIdentity;
            
			//	Scale custom view so grip will fill entire cell
			transform = CGAffineTransformScale(transform, transformRatio.width, transformRatio.height);
            
			//	Move custom view so the grip's top left aligns with the cell's top left
			transform = CGAffineTransformTranslate(transform, -sizeDifference.width / 2.0, -sizeDifference.height / 2.0);
            
			[resizedGripView setTransform:transform];
            
			for(UIImageView* cellGrip in view.subviews)
			{
				if([cellGrip isKindOfClass:[UIImageView class]])
					[cellGrip setImage:nil];
			}
            
            if([[[cell class] description] isEqualToString:@"MWCustomCell"]){
                
                MWCustomCell* customCell = (MWCustomCell*)cell;
                [customCell.deleteButton setHidden:NO];
                [customCell insertSubview:customCell.deleteButton aboveSubview:view];
            }
		}
	}
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return UITableViewCellEditingStyleNone;
}

- (BOOL) tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath
{
	return NO;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    // Should send quesry that will change the possition in the server
    // change position in the model
    
    NSString* obj_source = [_dataSource objectAtIndex:[sourceIndexPath row]];
    
    [_dataSource removeObjectAtIndex:[sourceIndexPath row]];
    [_dataSource insertObject:obj_source atIndex:[destinationIndexPath row]];
}

#pragma mark - custom delegate

-(void)deleteCell:(MWCustomCell*)cell
{
    NSIndexPath *index = [_table indexPathForCell:cell];
    
    [_dataSource removeObjectAtIndex:index.row];
    [_table deleteRowsAtIndexPaths:[[NSArray alloc] initWithObjects: index, nil] withRowAnimation:UITableViewRowAnimationFade];
}

-(void)didPressMore
{
    for(NSInteger i = 0 ; i < 10 ; ++i)
    {
        NSString* str = [[NSString alloc]initWithFormat:@"this is the - %.2d row",(i + [_dataSource count])];
        [_dataSource addObject: str];
    }
    
    [_table reloadData];
}

#pragma mark - ODRefreshControl

-(void)initRefreshControl
{
    _refreshControl = [[ODRefreshControl alloc] initInScrollView:_table];
    [_refreshControl addTarget:self action:@selector(dropViewDidBeginRefreshing:) forControlEvents:UIControlEventValueChanged];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (void)dropViewDidBeginRefreshing:(ODRefreshControl *)refreshControl
{
    double delayInSeconds = 1.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [_table reloadData];
        [refreshControl endRefreshing];
    });
}

#pragma mark - NavigationBar

-(void)loadNavigationBar
{
    UIBarButtonItem* editButton = [[UIBarButtonItem alloc] init];
    [editButton setStyle:UIBarButtonSystemItemAction];
    [editButton setBackgroundImage:[[UIImage imageNamed:@"Vuboo_General_Butt_NavBar_Reg.png"]resizableImageWithCapInsets:UIEdgeInsetsMake(0,10,0,10) ] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [editButton setBackgroundImage:[UIImage imageNamed:@"Vuboo_General_Butt_NavBar_Pressed.png"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    [editButton setTarget:self];
    [editButton setAction:@selector(didPressEdit)];
    [editButton setTitle:@"Edit"];
    
    self.navigationItem.rightBarButtonItem = editButton;
}

#pragma  mark - navbar action

-(void)didPressEdit
{
    _isEditing = YES;
    
    [_refreshControl setEnabled:NO];
    
    [self.navigationItem.rightBarButtonItem setTitle:@"Done"];
    [self.navigationItem.rightBarButtonItem setAction:@selector(didPressNavDone)];
    
    [_table setEditing:YES];
    [_table reloadData];
}

-(void)didPressNavDone
{
    _isEditing = NO;
    
    [_refreshControl setEnabled:YES];
    
    [self.navigationItem.rightBarButtonItem setTitle:@"Edit"];
    [self.navigationItem.rightBarButtonItem setAction:@selector(didPressEdit)];
    
    [_table setEditing:NO];
    [_table reloadData];
}

#pragma mark - fin

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload
{
    [self setTable:nil];
    [super viewDidUnload];
}
@end
