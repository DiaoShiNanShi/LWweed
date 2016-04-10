//
//  LWHomeDetailRequestModel.h
//  LazyWeekend
//
//  Created by tens03 on 16/4/10.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "LWBaseRequestModel.h"

@interface LWHomeDetailRequestModel : LWBaseRequestModel

@property (nonatomic, copy) NSNumber *strid;
@property (nonatomic, copy) NSNumber *lat;
@property (nonatomic, copy) NSNumber *lon;
@property (nonatomic, copy) NSString *session_id;

@end
