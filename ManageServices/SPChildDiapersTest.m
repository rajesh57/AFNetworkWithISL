//
//  SPChildDiapers.m
//  ManageServices
//
//  Created by Rajesh on 02/12/16.
//  Copyright © 2016 INNO IT. All rights reserved.
//

#import "SPChildDiapersTest.h"

@implementation SPChildDiapersTest

+(NSArray *)parseDiaperResponseArray:(NSArray *)diaperResponseArray {
    
    NSMutableArray *diaperArray =[[NSMutableArray alloc] init];
    
    SPChildDiapersTest *childDiaper= nil;
    for (NSDictionary *dictResponse in diaperResponseArray) {
        childDiaper =[[SPChildDiapersTest alloc] init];
        childDiaper.diaperTime1 = [dictResponse valueForKey:@"diaperTime"];
        childDiaper.diaperType1 = [dictResponse valueForKey:@"diaperType"];
        childDiaper.comments1 = [dictResponse valueForKey:@"comments"];
        [diaperArray addObject:childDiaper];
    }
    return  diaperArray;
    
}
@end
