//
//  SPChildCareDetails.h
//  ManageServices
//
//  Created by Cognizant MSP on 26/08/16.
//  Copyright © 2016 INNO IT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SPChildCareDetails : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *membershipId;
@property (nonatomic, copy) NSString *buildingName;
@property (nonatomic, copy) NSString *streetNumber;
@property (nonatomic, copy) NSString *unit;
@property (nonatomic, copy) NSString *streetName;
@property (nonatomic, copy) NSString *suburb;
@property (nonatomic, copy) NSString *state;
@property (nonatomic, copy) NSString *postalcode;
@property (nonatomic, copy) NSString *emailAddress;
@property (nonatomic, copy) NSString *primaryContact;
@property (nonatomic, copy) NSString *secondaryContact;
@property (nonatomic, copy) NSString *website;

@end