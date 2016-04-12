//
//  LWAPI.h
//  LazyWeekend
//
//  Created by tens03 on 16/4/8.
//  Copyright © 2016年 tens03. All rights reserved.
//

#ifndef LWAPI_h
#define LWAPI_h

/*
 
 GET  or POST
 
*/

#define kGET                        @"GET"
#define KPOST                       @"POST"


#define kHomeURL                    [NSURL URLWithString:@"http://api.lanrenzhoumo.com/main/recommend/index/"]

// 推荐列表URL
#define kHomeDetailListURL          [NSURL URLWithString:@"http://api.lanrenzhoumo.com/market/event/index/"]

// 主页详细页面URL
#define kHomeDataSourceURL                  [NSURL URLWithString:@"http://api.lanrenzhoumo.com/wh/common/leo_detail"]

#endif /* LWAPI_h */
