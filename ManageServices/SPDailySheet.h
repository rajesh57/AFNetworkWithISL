//
//  SPDailySheet.h
//  ManageServices
//
//  Created by Cognizant MSP on 26/08/16.
//  Copyright © 2016 INNO IT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SPMeals.h"
#import "SPAttendance.h"
#import "SPNaps.h"
//#import "SPDiaper.h"

@interface SPDailySheet : NSObject

@property (nonatomic, copy) NSString *dateTime;
@property (nonatomic, copy) NSArray *meals;
@property (nonatomic, copy) NSArray *attendances;
@property (nonatomic, copy) NSArray *naps;
@property (nonatomic, copy) NSArray *diapers;


+ (SPDailySheet *)parseDailySheetResponse:(NSDictionary *)dailySheetResponseDict;

@end
