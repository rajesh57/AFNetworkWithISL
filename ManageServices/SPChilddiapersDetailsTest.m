//
//  SPChilddiapersDetails.m
//  ManageServices
//
//  Created by Rajesh on 02/12/16.
//  Copyright © 2016 INNO IT. All rights reserved.
//

#import "SPChilddiapersDetailsTest.h"
#import "SPChilddiaperRoomDetailsTest.h"
#import "SPChildDiapersTest.h"

@implementation SPChilddiapersDetailsTest

+ (SPChilddiapersDetailsTest *)parseChilddiapersDetailsResponse:(NSDictionary *)childDiapersDetailsResponseDict {
    
    NSMutableArray *roomListArray =[[NSMutableArray alloc] init];
    
    NSArray *childDiaperResponseArray =[childDiapersDetailsResponseDict valueForKey:@"childdiapers"];
    
    SPChilddiaperRoomDetailsTest *diaperRoomDetails = nil;
    
    SPChilddiapersDetailsTest *diaperDetails = nil ;
    
    if (childDiaperResponseArray) {
        
       diaperDetails = [[SPChilddiapersDetailsTest alloc] init];
        
        for (NSDictionary *dictResponse in childDiaperResponseArray) {
            
            diaperRoomDetails = [SPChilddiaperRoomDetailsTest parseRoomDetails:dictResponse];
            
            if (diaperRoomDetails) {
                
                [roomListArray addObject:diaperRoomDetails];
            }
        }
        diaperDetails.diaperRooms  = roomListArray;
    }
    return diaperDetails;
}

@end
