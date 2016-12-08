//
//  SPChilddiaperRoomDetails.m
//  ManageServices
//
//  Created by Rajesh on 02/12/16.
//  Copyright © 2016 INNO IT. All rights reserved.
//

#import "SPChilddiaperRoomDetailsTest.h"
#import "SPChildDiapersTest.h"

@implementation SPChilddiaperRoomDetailsTest

+(SPChilddiaperRoomDetailsTest *)parseRoomDetails:(NSDictionary *)responseDict {
    SPChilddiaperRoomDetailsTest *roomDetails = nil;
    if (responseDict) {
        roomDetails = [[SPChilddiaperRoomDetailsTest alloc] init];
        roomDetails.roomId = [responseDict valueForKey:@"roomId"];
        roomDetails.loginDate = [responseDict valueForKey:@"loginDate"];
        roomDetails.childid =[responseDict valueForKey:@"childid"];
        NSArray *childDiaper =[responseDict valueForKey:@"diapers"];
        if (childDiaper) {
            roomDetails.diapersArray =[SPChildDiapersTest parseDiaperResponseArray:childDiaper];
        }
    }
    return roomDetails;
    
}
@end
