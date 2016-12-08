//
//  SPParentProfile.h
//  ManageServices
//
//  Created by Cognizant MSP on 25/08/16.
//  Copyright © 2016 INNO IT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SPChildCareDetails.h"
#import "SPLindedChild.h"


@interface SPParentProfile : NSObject

@property (nonatomic, copy) NSString *fullname;
@property (nonatomic, copy) NSString *mobilenumber;
@property (nonatomic, copy) NSString *emailId;
@property (nonatomic, strong) NSArray *linkedChilds;

+ (SPParentProfile *)parseParentProfileResponse:(NSDictionary *)parentProfileResponseDict;

@end
