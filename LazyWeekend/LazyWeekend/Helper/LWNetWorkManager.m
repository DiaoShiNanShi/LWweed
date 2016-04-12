//
//  WBNetWorkManager.m
//  WeiBo
//
//  Created by tens03 on 16/3/18.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "LWNetWorkManager.h"
#import "LWHomeResponseModel.h"
#import "LWHomeResponseModel.h"
#import "LWHomeDetailDataSourceRequestModel.h"
#import "LWHomeDataSourceResponseModel.h"



static LWNetWorkManager *network;

@interface LWNetWorkManager()


/**
 *  网络请求
 *
 *  @param request           请求体
 *  @param completionhandler 回调方法
 */
-(void)netRequest:(NSURLRequest *)request completionhandler:(completionHandler)completionhandler;
/**
 *  根据错误代号Code，判断错误信息
 *
 *  @param code   错误代号
 *  @param result 请求返回结果
 *
 *  @return 数据模型
 */
-(id)PasRsing:(NSInteger)code withResult:(id)result;
@end

@implementation LWNetWorkManager

#pragma mark - singApption
+ (instancetype)sharNetWorkManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
       if(!network)
       {
           network = [[LWNetWorkManager alloc] init];
       }
        
    });
    return network;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        if(!network)
        {
            network = [super allocWithZone:zone];
        }
        
    });
    return network;
}

- (id)copy
{
    return self;
}

#pragma mark - post/get 请求
-(void)netRequest:(NSURLRequest *)request completionhandler:(completionHandler)completionhandler
{
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if(!error)
        {
            // 成功的情况下
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
            
            if(!error)
            {
                completionhandler(dic,error);
                
            }else
            {
                // 解析失败
                completionhandler(nil,error);
            }
            
            
        }else
        {
            // 请求失败的情况下
            completionhandler(nil,error);
        }
    }];
    
    [dataTask resume];
}


/**
 *  判断错误信息
 */
-(id)PasRsing:(NSInteger)code withResult:(id)result
{
    switch (code) {
        case 200:
            // 成功
            return nil;
            break;
        
        case 400:
            return nil;
            break;
            
        default:
            break;
    }
    return nil;
}

/**
 *  请求数据
 *
 *  @param model             <#model description#>
 *  @param completionHandler <#completionHandler description#>
 */
- (void)networkRequestsWithModel:(LWBaseRequestModel *)model withDataType:(LWDataType)dataType withCompletionHandler:(completionHandler)completionHandler withRequestWay:(NSString *)requestWay
{
    NSString *str;
    switch (dataType) {
        case DataTypeHome:
        {
            str = [[kHomeURL absoluteString] stringByAppendingString:[model description]];
            break;
        }
        case DataTypeDetail:
        {
            str = [[kHomeDetailListURL absoluteString] stringByAppendingString:[model description]];
            break;
        }
        case DataTypeDataSource:
        {
            str = [[kHomeDataSourceURL absoluteString] stringByAppendingString:[model description]];
            break;
        }
            
        default:
            break;
    }
    
    if([requestWay isEqualToString:kGET])
    {
        // GET
        
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:str]];
        
        [self netRequest:request completionhandler:^(id result, NSError *error) {
           
            if(error)
            {
                completionHandler(nil,error);
            }
            
            NSMutableArray *modelArr = [NSMutableArray array];
            switch (dataType) {
                case DataTypeHome :
                {
                    
                    for (NSDictionary *dic in result[@"result"]) {
                        
                        LWHomeResponseModel *responseModel = [[LWHomeResponseModel alloc] initWithObject:dic];
                        
                        [modelArr addObject:responseModel];
                    }
                    
                    dispatch_async(dispatch_get_main_queue(), ^{
                        
                        completionHandler(modelArr, error);
                    });
                    break;
                }
                case DataTypeDetail:
                {
                    for (NSDictionary *dic in result[@"result"]) {
                        
                        LWHomeResponseModel *responseModel = [[LWHomeResponseModel alloc] initWithObject:dic];
                        
                        [modelArr addObject:responseModel];
                    }
                    
                    dispatch_async(dispatch_get_main_queue(), ^{
                        
                        completionHandler(modelArr, error);
                    });
                    break;
                }
                case DataTypeDataSource:
                {
                    // 数据
                    LWHomeDataSourceResponseModel *dataSourceModel = [[LWHomeDataSourceResponseModel alloc] initWithObject:result[@"result"]];
                    
                    completionHandler(dataSourceModel,error);
                    break;
                }
                    
                default:
                    break;
            }
            
            
        }];
        
        
    }else
    {
        // 暂时没有POST 请求
        completionHandler(nil,nil);
    }
}


- (NSMutableURLRequest *)generateFormDataRequestWithURL:(NSURL *)url
                                             Paramenter:(NSDictionary *)paramenter imageList:(NSArray *)images {
    NSData *body = [self generateFormDataWithParamenter:paramenter imageList:images];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPBody:body];
    [request setHTTPMethod:@"POST"];
    NSString *contentType=[[NSString alloc]initWithFormat:@"multipart/form-data; boundary=%@",kFormDataBoundary];
    [request setValue:contentType forHTTPHeaderField:@"Content-Type"];
    [request setValue:[NSString stringWithFormat:@"%lu", [body length]] forHTTPHeaderField:@"Content-Length"];
    return request;
}

- (NSData *)generateFormDataWithParamenter:(NSDictionary *)paramenter imageList:(NSArray *)images {
    
    // 开始分隔符
    NSString *beginBoundary = [NSString stringWithFormat:@"--%@\r\n", kFormDataBoundary];
    
    NSMutableString *paramenterString=[[NSMutableString alloc]init];
    NSMutableData *body = [NSMutableData data];
    
    // 拼接参数
    for (NSString *key in [paramenter allKeys]) {
        id value = paramenter[key];
        if (value == nil) {
            continue;
        }
        
        // 添加开始分隔符
        [paramenterString appendString:beginBoundary];
        
        // 添加字段
        NSString *field = [NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n", key];
        [paramenterString appendString:field];
        
        // 添加字段的值
        NSString *fieldValue = [NSString stringWithFormat:@"%@\r\n", value];
        [paramenterString appendString:fieldValue];
    }
    
    // 将参数转换成2进制文件并添加到Body
    [body appendData:[paramenterString dataUsingEncoding:NSUTF8StringEncoding]];
    
    // 拼接图片数据
    for (id item in images) {
        
        NSMutableString *imageBodyString = [NSMutableString string];
        // 添加开始分隔符
        [imageBodyString appendString:beginBoundary];
        
        // 添加字段
        NSString *fileName = [NSString stringWithFormat:@"%@", @"filenadf"];
        NSString *field = [NSString stringWithFormat:@"Content-Disposition: form-data; name=\"pic\"; filename=\"%@\"\r\n", fileName];
        [imageBodyString appendString:field];
        
        //声明上传文件的格式
        NSString *uplodType = @"Content-Type: image/jpge,image/gif, image/jpeg, image/pjpeg, image/pjpeg\r\n\r\n";
        [imageBodyString appendString:uplodType];
        
        // 将参数封装成二进制文件
        [body appendData:[imageBodyString dataUsingEncoding:NSUTF8StringEncoding]];
        
        // 添加图片数据
        NSData *imageData = UIImageJPEGRepresentation(item, 1);
        [body appendData:imageData];
        
        [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    }
    
    // 添加结束分隔符
    NSString *endBoundary = [NSString stringWithFormat:@"\r\n--%@--", kFormDataBoundary];
    [body appendData:[endBoundary dataUsingEncoding:NSUTF8StringEncoding]];
    
    return body;
}

@end
