//
//  SPCoreDataManager.h
//  ManageServices
//
//  Created by Cognizant MSP on 25/08/16.
//  Copyright © 2016 INNO IT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SPParentProfile.h"

@interface SPCoreDataManager : NSObject

+ (instancetype)sharedManager;

- (void)addParentProfile:(SPParentProfile *)parentProfile;
- (void)addDailySheetsProfile:(SPParentProfile *)parentProfile;

- (NSInteger)insertTextCopies:(NSArray *)attributeDictionaryArray;
- (NSString *)cmsTextCopiesValueFromLocalDBForCMSKey:(NSString *)cmsKey;

- (void)insertPhotoDetailsForKidId:(NSString *)kidId
                     withPhotoText:(NSString *)photoText
                      withDateTime:(NSString *)dateTime
                       withLocalAddress:(NSString *)localAddress
                      withRemoteAddress:(NSString *)remoteAddress;

- (NSArray *)getPhotoDetailsForKidId:(NSString *)kidId;

- (void)clearDataInEntity:(NSString *)entityName;
- (void)inspectParentProfile;


@end
