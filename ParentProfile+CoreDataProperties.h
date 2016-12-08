//
//  ParentProfile+CoreDataProperties.h
//  ManageServices
//
//  Created by Cognizant MSP on 20/10/16.
//  Copyright © 2016 INNO IT. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "ParentProfile.h"

NS_ASSUME_NONNULL_BEGIN

@interface ParentProfile (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *parentMobileNumber;
@property (nullable, nonatomic, retain) NSString *parentName;
@property (nullable, nonatomic, retain) NSString *parentEmailId;
@property (nullable, nonatomic, retain) NSSet<LinkedChild *> *relationship;

@end

@interface ParentProfile (CoreDataGeneratedAccessors)

- (void)addRelationshipObject:(LinkedChild *)value;
- (void)removeRelationshipObject:(LinkedChild *)value;
- (void)addRelationship:(NSSet<LinkedChild *> *)values;
- (void)removeRelationship:(NSSet<LinkedChild *> *)values;

@end

NS_ASSUME_NONNULL_END
