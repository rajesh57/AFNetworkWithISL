//
//  CMSTextCopies+CoreDataProperties.h
//  ManageServices
//
//  Created by Cognizant MSP on 20/10/16.
//  Copyright © 2016 INNO IT. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "CMSTextCopies.h"

NS_ASSUME_NONNULL_BEGIN

@interface CMSTextCopies (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *cmsKey;
@property (nullable, nonatomic, retain) NSString *cmsValue;

@end

NS_ASSUME_NONNULL_END
