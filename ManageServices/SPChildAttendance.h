//
//  SPChildAttendance.h
//  ManageServices
//
//  Created by Rajesh on 30/11/16.
//  Copyright © 2016 INNO IT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SPChildAttendance : NSObject
/*
 
 "roomId": 1,
 "loginDate": "2016-11-30",
 "childId": 9,
 "signin": "08:49:59",
 "signout": "12:59:34"
 */
@property (nonatomic, copy) NSString *roomId;
@property (nonatomic, copy) NSString *loginDate;
@property (nonatomic, copy) NSString *childId;
@property (nonatomic, copy) NSString *signin;
@property (nonatomic, copy) NSString *signout;

+(NSArray *)parseChildListAttendanceResponse:(NSDictionary *)childListAttendanceResponseDict;

@end
