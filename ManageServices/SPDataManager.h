//
//  SPDataManager.h
//  ManageServices
//
//  Created by Cognizant MSP on 25/08/16.
//  Copyright © 2016 INNO IT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SPServiceManager.h"
#import "SPParentProfile.h"
#import "SPDailySheet.h"

#import "SPChildAttendance.h"
#import "SPChilddiapersDetailsTest.h"

static NSString *photoAlbumFolderName = @"photoAlbum";

typedef void (^SPGetParentProfileSuccessBlock)(SPParentProfile *parentProfile);
typedef void (^SPGetParentProfileFailureBlock)(SPParentProfile *parentProfile,NSString *errorString);

typedef void (^SPDataSheetsSuccessBlock)(SPDailySheet *dailySheet);
typedef void (^SPDataSheetsFailureBlock)(SPDailySheet *dailySheet,NSString *errorString);

typedef void (^SPPhotosResponseBlock)(NSArray *photoLocalURLs,NSString *msgTitle, NSString *msgDescription, BOOL status);

//=============================================
typedef void (^SPGenericFailureBlock)(NSString *errorTitle, NSString *errorDescription);

typedef void (^SPChildAttendanceSuccessBlock)(NSArray *childMessaeList);

typedef void (^SPChildDiaperDetailsSuccessBlock)(SPChilddiapersDetailsTest *childDiaperDetails);


typedef void (^SPChildCareUserProfileUpdateSuccessBlock)(NSString *msgDescription, BOOL status);

typedef void (^SPChildCareUserProfileUpdateFailyewBlock) (NSString *msgtitle, NSString *msgDescription, NSInteger statusCode);


//=============================================

@interface SPDataManager : NSObject

+ (instancetype)sharedManager;

- (void)getParentProfileDetails:(SPGetParentProfileSuccessBlock)parentProfile
        withfailureBlock:(SPGetParentProfileFailureBlock)localParentProfileWithFailureMessage;

- (void)getDailSheetDetails:(SPDataSheetsSuccessBlock)dailySheetSuccessBlock
           withfailureBlock:(SPDataSheetsFailureBlock)dailySheetFailureBlock;

- (NSString *)cmsTextCopiesForCMSKey:(NSString *)CMSKey;

- (void)getPhotosForKidId:(NSString *)kidId
            responseBlock:(SPPhotosResponseBlock)responseBlock;
//=============================================
- (void)getChildAttendanceWithChildCareId:(NSString *)childCareId
                          successBlock:(SPChildAttendanceSuccessBlock)AttdanceSuccessBlock
                      withfailureBlock:(SPGenericFailureBlock)AttdanceFailureBlock;

- (void)getChildDiaperDetailswithchildCareID:(NSString *)childCareId
   withsuccessBlock:(SPChildDiaperDetailsSuccessBlock)childDiaperDetailsSuccessBlock
                            withfailureBlock:(SPGenericFailureBlock)childDiaperDetailsFailureBlock;




-(void)PostChildCareUserProfileUpdate:(NSString *)name
                          withEmailID:(NSString *)emailed
                            withPhone:(NSString *)phone
                           withGender:(NSString *)gender
                       withModifiedBy:(NSString *)modifiedby
                     withsuccessBlock:(SPChildCareUserProfileUpdateSuccessBlock)profileUpdateSuccessBlock
                      withFailueBlock:(SPChildCareUserProfileUpdateFailyewBlock)profileUpdateFailurBlock;
//=============================================

@end
