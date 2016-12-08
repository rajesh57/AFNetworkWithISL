//
//  SPLindedChild.h
//  ManageServices
//
//  Created by Cognizant MSP on 26/08/16.
//  Copyright © 2016 INNO IT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SPChildCareDetails.h"

@interface SPLindedChild : NSObject

@property (nonatomic, copy) NSString *firstname;
@property (nonatomic, copy) NSString *lastname;
@property (nonatomic, copy) NSString *dob;
@property (nonatomic, copy) NSString *childcarememid;
@property (nonatomic, copy) NSString *imagepath;
@property (nonatomic, copy) NSString *linkingid;
@property (nonatomic, strong) SPChildCareDetails *childCareDetails;

@end

