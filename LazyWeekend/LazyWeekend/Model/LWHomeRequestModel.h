//
//  LWHomeRequestModel.h
//  LazyWeekend
//
//  Created by tens03 on 16/4/8.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "LWBaseRequestModel.h"

@interface LWHomeRequestModel : LWBaseRequestModel

@property (nonatomic, copy) NSNumber *city_id;
@property (nonatomic, copy) NSNumber *lat;
@property (nonatomic, copy) NSNumber *lon;
@property (nonatomic, copy) NSNumber *page;
@property (nonatomic, copy) NSString *session_id;
@property (nonatomic, copy) NSNumber *v;

@end
