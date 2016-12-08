//
//  PhotoAlbum+CoreDataProperties.h
//  ManageServices
//
//  Created by Cognizant MSP on 15/11/16.
//  Copyright © 2016 INNO IT. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "PhotoAlbum.h"

NS_ASSUME_NONNULL_BEGIN

@interface PhotoAlbum (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *kidId;
@property (nullable, nonatomic, retain) NSString *localAddress;
@property (nullable, nonatomic, retain) NSString *remoteAddress;
@property (nullable, nonatomic, retain) NSString *dateTime;
@property (nullable, nonatomic, retain) NSString *photoText;

@end

NS_ASSUME_NONNULL_END
