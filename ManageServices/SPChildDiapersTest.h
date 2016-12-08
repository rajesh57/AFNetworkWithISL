//
//  SPChildDiapers.h
//  ManageServices
//
//  Created by Rajesh on 02/12/16.
//  Copyright © 2016 INNO IT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SPChildDiapersTest : NSObject
/*
 "diaperTime": "01:02:18",
 "diaperType": "Dry Nappy",
 "comments": "01:02 AM - Dry Nappy;"
 */
@property (nonatomic, copy) NSString *diaperTime1;
@property (nonatomic, copy) NSString *diaperType1;
@property (nonatomic, copy) NSString *comments1;

+(NSArray *)parseDiaperResponseArray:(NSArray *)diaperResponseArray;
@end
