#//
//  NewsViewController.h
//  zxg
//
//  Created by gakaki on 12-5-30.
//  Copyright (c) 2012年 Gakaki. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Controllers.h"
#import "Collections.h"

@interface NewsViewController : UITableViewController<EGORefreshTableHeaderDelegate, UITableViewDelegate, UITableViewDataSource>{

    EGORefreshTableHeaderView* _refreshHeaderView;
	BOOL _reloading;
}

@property (strong, nonatomic) NSMutableArray* m_table_data;

- (void)reloadTableViewDataSource;
- (void)doneLoadingTableViewData;

@end

