//
//  JDNetCLinet.m
//  WJDStudyLibrary
//
//  Created by wangjundong on 2017/4/11.
//  Copyright © 2017年 wangjundong. All rights reserved.
//

#import "JDNetClinet.h"

#if DEBUG
static NSString *const BASEURL = @"";
#else
static NSString *const BASEURL = @"";
#endif

@implementation JDNetClinet

//@synthesize debug;

+ (instancetype)sharedClient
{
    static JDNetClinet *_shareClient =nil;
    JDDISPATCH_ONCE_BLOCK((^{
        _shareClient =[[JDNetClinet alloc]initWithBaseURL:[NSURL URLWithString:BASEURL]];
        
        //设置可以接受格式
        _shareClient.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json",@"text/javascript",@"text/html", nil];
        //移除 NULL 值
        ((AFJSONResponseSerializer *)_shareClient.responseSerializer).removesKeysWithNullValues = YES;
        //证书相关
        AFSecurityPolicy *securityPolicy = [[AFSecurityPolicy alloc] init];
        _shareClient.securityPolicy = securityPolicy;
        //超时时间
        _shareClient.requestSerializer.timeoutInterval =10;
        //设置返回格式
        _shareClient.responseSerializer = [AFHTTPResponseSerializer serializer];
        
    }));
    
    return _shareClient;
    
}
@end
