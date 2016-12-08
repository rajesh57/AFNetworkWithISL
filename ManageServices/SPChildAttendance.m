//
//  SPChildAttendance.m
//  ManageServices
//
//  Created by Rajesh on 30/11/16.
//  Copyright © 2016 INNO IT. All rights reserved.
//

#import "SPChildAttendance.h"

@implementation SPChildAttendance
/*
 
 "roomId": 1,
 "loginDate": "2016-11-30",
 "childId": 9,
 "signin": "08:49:59",
 "signout": "12:59:34"
 */
+ (NSArray *)parseChildListAttendanceResponse:(NSDictionary *)childListAttendanceResponseDict {
    
    NSMutableArray *childAttendanceArrayList = [[NSMutableArray alloc] init];
    
    NSArray *childAttenceArray = [childListAttendanceResponseDict valueForKey:@"kidsattendance"];
    
    SPChildAttendance *spChildAttence = nil;
    
    for (int index = 0; index < [childAttenceArray count]; index ++) {

        spChildAttence = [[SPChildAttendance alloc] init];

        NSDictionary *dictChildAttence =[childAttenceArray objectAtIndex:index];
        
        spChildAttence.roomId = [NSString stringWithFormat:@"%@",[dictChildAttence valueForKey:@"roomId"]];
        
        spChildAttence.childId = [NSString stringWithFormat:@"%@",[dictChildAttence valueForKey:@"childId"]];
        spChildAttence.loginDate = [dictChildAttence valueForKey:@"loginDate"];
        
        spChildAttence.signin = [dictChildAttence valueForKey:@"signin"];
        
        spChildAttence.signout = [dictChildAttence valueForKey:@"signout"];
        
        [childAttendanceArrayList addObject:spChildAttence];
    }
    
//    if (childAttenceArray) {
//        
//        for (NSDictionary *dictChildAttence in childAttenceArray) {
//            
//               spChildAttence = [[SPChildAttendance alloc] init];
//            
//                spChildAttence =[childAttenceArray objectAtIndex:index];
//                
//                spChildAttence.roomId = [NSString stringWithFormat:@"%@",[dictChildAttence valueForKey:@"roomId"]];
//                spChildAttence.childId = [NSString stringWithFormat:@"%@",[dictChildAttence valueForKey:@"childId"]];
//                
//                spChildAttence.loginDate = [dictChildAttence valueForKey:@"loginDate"];
//                
//                spChildAttence.signin = [dictChildAttence valueForKey:@"signin"];
//                
//                spChildAttence.signout = [dictChildAttence valueForKey:@"signout"];
//                
//                [childAttendanceArrayList addObject:spChildAttence];
//           
//        }
//        
//    }
    return childAttendanceArrayList;
}

@end
