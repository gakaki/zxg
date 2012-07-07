//
//  NewsViewController.m
//  zxg
//
//  Created by gakaki on 12-5-30.
//  Copyright (c) 2012年 Gakaki. All rights reserved.
//

#import "NewsViewController.h"
#import "JSONKit.h"
#import "NSDate+HumanizedTime.h"

@implementation NewsViewController

@synthesize m_table_data;
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

-(void)reloadTableViewDataSource{
     [self reload_talbe_data];
	_reloading = YES;
}
- (void)doneLoadingTableViewData{
    _reloading = NO;
  
	[_refreshHeaderView egoRefreshScrollViewDataSourceDidFinishedLoading:self.tableView];
	
   
}
- (void)viewDidLoad
{
    [super viewDidLoad];

    if (_refreshHeaderView == nil) {
		
		EGORefreshTableHeaderView *view = [[EGORefreshTableHeaderView alloc] initWithFrame:CGRectMake(0.0f, 0.0f - self.tableView.bounds.size.height, self.view.frame.size.width, self.tableView.bounds.size.height)];
		view.delegate = self;
		[self.tableView addSubview:view];
		_refreshHeaderView = view;
	}
    
        
    //  update the last update date
	[_refreshHeaderView refreshLastUpdatedDate];


    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    

}
- (void)viewDidAppear:(BOOL)animated{
    [self reload_talbe_data];
}

- (void)reload_talbe_data{
    [Collection_News requestWithSuccBlock:^(id succ_data) {
        
        m_table_data = succ_data;
        
        NSLog(@"items count is %d",self.m_table_data.count);
       
        
        [self.tableView reloadData];
        [_refreshHeaderView egoRefreshScrollViewDataSourceDidFinishedLoading:self.tableView];


        
    } withFailBlock:^(id fail_data) {
        NSLog(@"%@",fail_data);
    }];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    _refreshHeaderView = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return m_table_data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // custom cell http://www.cocoachina.com/newbie/tutorial/2012/0612/4353.html
    static NSString *CellIdentifier = @"Cell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    ModelNews* news = (ModelNews*)[m_table_data objectAtIndex:indexPath.row];
    
    
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    //[outputFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"PRC"]];
    [outputFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSS'ZZZ'"];
    NSDate* date  = [outputFormatter dateFromString:news.mcreated_at];
   
    
//    NSLog(@"data1 %@",date);
//    NSLog(@"data2%@",[outputFormatter stringFromDate:date]);
 
    cell.textLabel.text = [date stringWithHumanizedTimeDifference];
 
    
    
    return cell;
    
}





#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}






#pragma mark -
#pragma mark UIScrollViewDelegate Methods
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
	//NSLog(@"scrollViewDidScroll");
	[_refreshHeaderView egoRefreshScrollViewDidScroll:scrollView];
    
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
	//NSLog(@"scrollViewDidEndDragging");
	[_refreshHeaderView egoRefreshScrollViewDidEndDragging:scrollView];
}

#pragma mark -
#pragma mark EGORefreshTableHeaderDelegate Methods
- (void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView*)view{
	NSLog(@"egoRefreshTableHeaderDidTriggerRefresh");
	[self reloadTableViewDataSource];
	[self performSelector:@selector(doneLoadingTableViewData) withObject:nil afterDelay:0.1];
	
}

- (BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView*)view{
	NSLog(@"egoRefreshTableHeaderDataSourceIsLoading");
	return _reloading; // should return if data source model is reloading
	
}

//- (NSDate*)egoRefreshTableHeaderDataSourceLastUpdated:(EGORefreshTableHeaderView*)view{
//	NSLog(@"egoRefreshTableHeaderDataSourceLastUpdated");
//	return [NSDate date]; // should return date data source was last changed
//	
//}








@end

