//
//  SPDailySheet.m
//  ManageServices
//
//  Created by Cognizant MSP on 26/08/16.
//  Copyright © 2016 INNO IT. All rights reserved.
//
/*
#import "SPDailySheet.h"

@implementation SPDailySheet

+ (SPDailySheet *)parseDailySheetResponse:(NSDictionary *)dailySheetResponseDict {
    NSString *timeString = [dailySheetResponseDict valueForKey:@"time"];
    NSDictionary *data = [dailySheetResponseDict valueForKey:@"data"];
    SPDailySheet *dailySheet = nil;
    if (data) {
        NSDictionary *dailySheetDict = [data valueForKey:@"dailySheets"];
        if (dailySheetDict) {
            dailySheet = [[SPDailySheet alloc] init];
            dailySheet.dateTime = timeString;
            dailySheet.attendances = [dailySheet makeAttendaceArrayFromResponse:[dailySheetDict valueForKey:@"attendance"]];
            dailySheet.meals = [dailySheet makeMealsArrayFromResponse:[dailySheetDict valueForKey:@"meals"]];
            dailySheet.diapers = [dailySheet makeDiapersArrayFromResponse:[dailySheetDict valueForKey:@"diapers"]];
            dailySheet.naps = [dailySheet makeNapsArrayFromResponse:[dailySheetDict valueForKey:@"naps"]];
        }
    }
    
    return dailySheet;
}

- (NSArray *)makeMealsArrayFromResponse:(NSArray *)mealsResponseArray {
    NSMutableArray *mealsArray = [[NSMutableArray alloc] init];
    SPMeals *meals = nil;
    for (NSDictionary *mealsDict in mealsResponseArray) {
        NSLog(@"Meal Response Dict: %@", mealsDict);
        meals = [[SPMeals alloc] init];
        meals.mealsType = [mealsDict valueForKey:@"mealsType"];
        meals.mealStatus = [mealsDict valueForKey:@"mealStatus"];
        meals.comments = [mealsDict valueForKey:@"comments"];
        [mealsArray addObject:meals];
    }
    return mealsArray;
}

- (NSArray *)makeAttendaceArrayFromResponse:(NSArray *)attendanceResponseArray {
    NSMutableArray *attendanceArray = [[NSMutableArray alloc] init];
    SPAttendance *attendance = nil;
    for (NSDictionary *attendanceDict in attendanceResponseArray) {
        NSLog(@"attendanceDict Response Dict: %@", attendanceDict);
        attendance = [[SPAttendance alloc] init];
        attendance.signIn = [attendanceDict valueForKey:@"signIn"];
        attendance.signOut = [attendanceDict valueForKey:@"signOut"];
        [attendanceArray addObject:attendance];
    }
    return attendanceArray;
}

- (NSArray *)makeDiapersArrayFromResponse:(NSArray *)diapersResponseArray {
    NSMutableArray *diapersArray = [[NSMutableArray alloc] init];
    SPDiaper *diaper = nil;
    for (NSDictionary *diapersDict in diapersResponseArray) {
        NSLog(@"diapersDict Response Dict: %@", diapersDict);
        diaper = [[SPDiaper alloc] init];
        diaper.diaperTime = [diapersDict valueForKey:@"diaperTime"];
        diaper.diaperType = [diapersDict valueForKey:@"diaperType"];
        diaper.comments = [diapersDict valueForKey:@"comments"];
        [diapersArray addObject:diaper];
    }
    return diapersArray;
}

- (NSArray *)makeNapsArrayFromResponse:(NSArray *)napsResponseArray {
    NSMutableArray *napsArray = [[NSMutableArray alloc] init];
    SPNaps *naps = nil;
    for (NSDictionary *napsDict in napsResponseArray) {
        NSLog(@"napsDict Response Dict: %@", napsDict);
        naps = [[SPNaps alloc] init];
        naps.start = [napsDict valueForKey:@"start"];
        naps.finish = [napsDict valueForKey:@"finish"];
        naps.comments = [napsDict valueForKey:@"comments"];
        [napsArray addObject:naps];
    }
    return napsArray;
}

@end
 */

