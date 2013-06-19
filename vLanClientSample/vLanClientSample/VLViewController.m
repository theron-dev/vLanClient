//
//  VLViewController.m
//  vLanClientSample
//
//  Created by zhang hailong on 13-6-19.
//  Copyright (c) 2013年 hailong.org. All rights reserved.
//

#import "VLViewController.h"

#import <vLanClient/vLanClient.h>

@interface VLViewController ()

@end

@implementation VLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [vLanClient defaultClient];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
