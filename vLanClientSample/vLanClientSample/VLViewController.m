//
//  VLViewController.m
//  vLanClientSample
//
//  Created by zhang hailong on 13-6-19.
//  Copyright (c) 2013年 hailong.org. All rights reserved.
//

#import "VLViewController.h"

#import <vLanClient/vLanClient.h>

#include <dns_sd.h>

@interface VLViewController ()

@property(nonatomic,retain) NSArray * items;

@end

@implementation VLViewController

@synthesize items = _items;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.items = [[vLanClient defaultClient] hostList];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setTitleItem:nil];
    [self setTableView:nil];
    [super viewDidUnload];
}

- (IBAction)refreshAction:(id)sender {
    
    self.items = [[vLanClient defaultClient] hostList];
    
    [_tableView reloadData];
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_items count];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    id item = [_items objectAtIndex:indexPath.row];
    
    [cell.textLabel setText:[item description]];
    
    return cell;
}

@end
