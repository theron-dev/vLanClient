//
//  VLViewController.h
//  vLanClientSample
//
//  Created by zhang hailong on 13-6-19.
//  Copyright (c) 2013年 hailong.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VLViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UIBarButtonItem *titleItem;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)refreshAction:(id)sender;

@end
