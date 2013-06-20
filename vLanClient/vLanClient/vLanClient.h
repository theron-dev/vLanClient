//
//  vLanClient.h
//  vLanClient
//
//  Created by zhang hailong on 13-6-19.
//  Copyright (c) 2013年 hailong.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface vLanClient : NSObject

+(id) defaultClient;

-(NSArray *) hostList;

@end