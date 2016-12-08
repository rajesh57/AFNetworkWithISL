//
//  SPChilddiapersDetails.h
//  ManageServices
//
//  Created by Rajesh on 02/12/16.
//  Copyright © 2016 INNO IT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SPChilddiapersDetailsTest : NSObject

@property (nonatomic, strong) NSArray *diaperRooms;

+ (SPChilddiapersDetailsTest *)parseChilddiapersDetailsResponse:(NSDictionary *)childDiapersDetailsResponseDict;

@end
