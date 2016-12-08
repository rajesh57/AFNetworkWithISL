//
//  LinkedChild+CoreDataProperties.h
//  ManageServices
//
//  Created by Cognizant MSP on 30/08/16.
//  Copyright © 2016 INNO IT. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "LinkedChild.h"
#import "ChildCareDetails.h"

NS_ASSUME_NONNULL_BEGIN

@interface LinkedChild (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *firstname;
@property (nullable, nonatomic, retain) NSString *lastname;
@property (nullable, nonatomic, retain) NSString *dob;
@property (nullable, nonatomic, retain) NSString *childcarememid;
@property (nullable, nonatomic, retain) NSString *imagepath;
@property (nullable, nonatomic, retain) NSData *image;
@property (nullable, nonatomic, retain) ChildCareDetails *childCareDetails;

@end

NS_ASSUME_NONNULL_END
