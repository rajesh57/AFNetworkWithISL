//
//  ChildCareDetails+CoreDataProperties.h
//  ManageServices
//
//  Created by Cognizant MSP on 20/10/16.
//  Copyright © 2016 INNO IT. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "ChildCareDetails.h"

NS_ASSUME_NONNULL_BEGIN

@interface ChildCareDetails (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *buildingName;
@property (nullable, nonatomic, retain) NSString *membershipId;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *postalCode;
@property (nullable, nonatomic, retain) NSString *state;
@property (nullable, nonatomic, retain) NSString *streetName;
@property (nullable, nonatomic, retain) NSString *streetNumber;
@property (nullable, nonatomic, retain) NSString *suburb;
@property (nullable, nonatomic, retain) NSString *type;
@property (nullable, nonatomic, retain) NSString *unit;
@property (nullable, nonatomic, retain) NSString *website;
@property (nullable, nonatomic, retain) NSString *primaryContact;
@property (nullable, nonatomic, retain) NSString *secondaryContact;

@end

NS_ASSUME_NONNULL_END
