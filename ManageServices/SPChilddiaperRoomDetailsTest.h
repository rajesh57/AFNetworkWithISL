//
//  SPChilddiaperRoomDetails.h
//  ManageServices
//
//  Created by Rajesh on 02/12/16.
//  Copyright © 2016 INNO IT. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 "roomId": 1,
 "loginDate": "2016-12-01",
 "childid": 7,
 */
@interface SPChilddiaperRoomDetailsTest : NSObject
@property (nonatomic, copy) NSString *roomId;
@property (nonatomic, copy) NSString *loginDate;
@property (nonatomic, copy) NSString *childid;
@property (nonatomic, copy) NSArray *diapersArray;

+(SPChilddiaperRoomDetailsTest *)parseRoomDetails:(NSDictionary *)responseDict;

@end
