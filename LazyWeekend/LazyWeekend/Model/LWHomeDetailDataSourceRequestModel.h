//
//  LWHomeDetailDataSourceRequestModel.h
//  LazyWeekend
//
//  Created by tens03 on 16/4/10.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "LWBaseRequestModel.h"

@interface LWHomeDetailDataSourceRequestModel : LWBaseRequestModel


@property (nonatomic, copy) NSNumber *leo_id;
@property (nonatomic, copy) NSString *session_id;
@property (nonatomic, copy) NSString *v;

@end
