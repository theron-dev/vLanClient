//
//  vLanClient.m
//  vLanClient
//
//  Created by zhang hailong on 13-6-19.
//  Copyright (c) 2013年 hailong.org. All rights reserved.
//

#import "vLanClient.h"

#include "libsmbclient.h"
#include <sys/socket.h>  

static vLanClient * defaultClient = nil;

@interface vLanClient(){
    struct {
        SMBCCTX * ctx;
    } _SMB;
}

@end


@implementation vLanClient

+(id) defaultClient{
    if(defaultClient == nil){
        defaultClient = [[vLanClient alloc] init];
    }
    return defaultClient;
}

-(id) init{
    if((self = [super init])){
        
        _SMB.ctx = smbc_new_context();
        
        if(_SMB.ctx == nil){
            [self autorelease];
            return nil;
        }
        
#ifdef DEBUG
        smbc_setDebug(_SMB.ctx, 1);
#else
        smbc_setDebug(_SMB.ctx, 0);
#endif
        smbc_setTimeout(_SMB.ctx, 20000);
        
        smbc_setOptionUserData(_SMB.ctx, self);
        
        if(! smbc_init_context(_SMB.ctx)){
            smbc_free_context(_SMB.ctx, NO);
            [self autorelease];
            return nil;
        }
        
        smbc_set_context(_SMB.ctx);
        
        errno = 0;
        int dh = smbc_opendir("smb://");
        
        if(dh >0){
            
            struct smbc_dirent* dirent;
            
            while((dirent = smbc_readdir(dh))){
                
                printf("\ntype:%d %s\n",dirent->smbc_type, dirent->name);
                
                switch (dirent->smbc_type) {
                    case SMBC_WORKGROUP:
                    {
                        char url[1024];
                        
                        snprintf(url, sizeof(url),"smb://%s",dirent->name);
                        
                        int dh = smbc_opendir(url);
                        struct smbc_dirent* dirent;
                        if(dh>0){
                            while((dirent = smbc_readdir(dh))){
                                printf("\n\ttype:%d %s\n",dirent->smbc_type, dirent->name);
                            }
                            smbc_closedir(dh);
                        }
                        else{
                            printf("\nerrno:%d\n",errno);
                        }
                    }
                        break;
                        
                    default:
                        break;
                }
                
            }
            
            
            smbc_closedir(dh);
            
            
            
        }

        printf("\nerrno:%d\n",errno);
        
    }
    return self;
}

-(void) dealloc{
    
    if(_SMB.ctx){
        smbc_getFunctionPurgeCachedServers(_SMB.ctx)(_SMB.ctx);
        smbc_free_context(_SMB.ctx, NO);
    }
    
    [super dealloc];
}


@end