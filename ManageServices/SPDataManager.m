//
//  SPDataManager.m
//  ManageServices
//
//  Created by Cognizant MSP on 25/08/16.
//  Copyright © 2016 INNO IT. All rights reserved.
//

#import "SPDataManager.h"
#import "SPCoreDataManager.h"
#import "SPPhoto.h"

@implementation SPDataManager

+ (instancetype)sharedManager {
    static SPDataManager *dataManager = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        dataManager = [[self alloc] init];
    });
    
    return dataManager;
}

- (void)getParentProfileDetails:(SPGetParentProfileSuccessBlock)parentProfileBlock
               withfailureBlock:(SPGetParentProfileFailureBlock)localParentProfileWithFailureMessage {
    
    SPServiceManager *serviceManager = [[SPServiceManager alloc] init];
   // if (isInternetConnectionAvailable) {
        [serviceManager getParentProfile:^(NSURLSessionTask *task, NSDictionary *responseObject) {
            SPParentProfile *parentProfile = [SPParentProfile parseParentProfileResponse:responseObject];
            [[SPCoreDataManager sharedManager] addParentProfile:parentProfile];
            [self updateCMSTextCopies];
            parentProfileBlock(parentProfile);
        } withfailureBlock:^(NSURLSessionTask *operation, NSError *error) {
           // SPParentProfile *parentProfile = [[SPCoreDataManager sharedManager] updateParentProfile:parentProfile];
           // localParentProfileWithFailureMessage(parentProfile, error.description);
        }];
  //  } else {
  //      SPParentProfile *parentProfile = [[SPCoreDataManager sharedManager] updateParentProfile:parentProfile];
  //      localParentProfileWithFailureMessage(parentProfile, @"No Internet Connection");
  //  }
}
/*
- (void)getDailSheetDetails:(SPDataSheetsSuccessBlock)dailySheetSuccessBlock
               withfailureBlock:(SPDataSheetsFailureBlock)dailySheetFailureBlock {
    
    SPServiceManager *serviceManager = [[SPServiceManager alloc] init];
    NSDictionary *parameterDict = @{@"kidid" :@"1", @"logindate": @"2016-08-15"};
    // if (isInternetConnectionAvailable) {
    [serviceManager getDailySheetWithParameter:parameterDict withSuccessBlock:^(NSURLSessionTask *task, NSDictionary *responseObject) {
        SPDailySheet *dailySheet = [SPDailySheet parseDailySheetResponse:responseObject];
        //[[SPCoreDataManager sharedManager] updateParentProfile:parentProfile];
        dailySheetSuccessBlock(dailySheet);
    } withfailureBlock:^(NSURLSessionTask *operation, NSError *error) {
        // SPParentProfile *parentProfile = [[SPCoreDataManager sharedManager] updateParentProfile:parentProfile];
        // localParentProfileWithFailureMessage(parentProfile, error.description);
    }];
    //  } else {
    //      SPParentProfile *parentProfile = [[SPCoreDataManager sharedManager] updateParentProfile:parentProfile];
    //      localParentProfileWithFailureMessage(parentProfile, @"No Internet Connection");
    //  }
    
    
}
*/

- (void)getChildAttendanceWithChildCareId:(NSString *)childCareId
                             successBlock:(SPChildAttendanceSuccessBlock)AttdanceSuccessBlock
                         withfailureBlock:(SPGenericFailureBlock)AttdanceFailureBlock {
    
    
    SPServiceManager *serviceManager = [[SPServiceManager alloc] init];
    //  NSDictionary *parameterDict = @{@"childcareid" :childCareId ? childCareId : @""};
    [serviceManager getchildAttdanceListWithParameter:nil withSuccessBlock:^(NSURLSessionTask *task, NSDictionary *responseObject) {
        NSLog(@"Child Message API response: %@", responseObject);
        NSNumber * isSuccessNumber = (NSNumber *)[responseObject valueForKey:@"success"];
        if([isSuccessNumber boolValue] == YES) {
            NSArray *childListMessageArray = [SPChildAttendance parseChildListAttendanceResponse:responseObject];
            AttdanceSuccessBlock(childListMessageArray);
        }else {
            
            NSString *errorTitleCode = [responseObject valueForKey:@"errorCode"];
            NSString *errorDescription = @"Something went wrong..Please try again later";
            NSString *errorTitle = @"OOPs";
            
            //            if ([errorTitleCode isEqualToString:@"M101"]) {
            //                errorTitle = [[SPDataManager sharedManager] cmsTextCopiesForCMSKey:kLOGIN_TECHNICAL_ERROR_TITLE];
            //                errorDescription = [[SPDataManager sharedManager] cmsTextCopiesForCMSKey:kM101_MESSAGES_DESC];
            //            } else {
            //                errorTitle = [self cmsTextCopiesForCMSKey:kLOGIN_TECHNICAL_ERROR_TITLE];
            //                errorDescription = [self cmsTextCopiesForCMSKey:kLOGIN_TECHNICAL_ERROR_DESC];
            //            }
            AttdanceFailureBlock( errorTitle, errorDescription);
            
        }
    } withfailureBlock:^(NSURLSessionTask *operation, NSError *error) {
        AttdanceFailureBlock(@"Network Error", error.description);
    }];

}


- (void)getChildDiaperDetailswithchildCareID:(NSString *)childCareId
                            withsuccessBlock:(SPChildDiaperDetailsSuccessBlock)childDiaperDetailsSuccessBlock
                            withfailureBlock:(SPGenericFailureBlock)childDiaperDetailsFailureBlock{
    
    SPServiceManager *serviceManager = [[SPServiceManager alloc] init];
    
    [serviceManager getChildDiaperDetailsWithWithParameter:nil withSuccessBlock:^(NSURLSessionTask *task, NSDictionary *responseObject) {
        DLog(@"Message API response: %@", responseObject);
        NSNumber * isSuccessNumber = (NSNumber *)[responseObject valueForKey:@"success"];
        
        if([isSuccessNumber boolValue] == YES) {
            SPChilddiapersDetailsTest *childDiaperDetails = [SPChilddiapersDetailsTest parseChilddiapersDetailsResponse:responseObject];
            childDiaperDetailsSuccessBlock(childDiaperDetails);
        } else {
            NSString *errorTitleCode = [responseObject valueForKey:@"errorCode"];
            NSString *errorDescription = @"Something went wrong..Please try again later";
            NSString *errorTitle = @"OOPs";
            childDiaperDetailsFailureBlock ( errorTitle, errorDescription);
        }
    } withfailureBlock:^(NSURLSessionTask *operation, NSError *error) {
        childDiaperDetailsFailureBlock (@"Network Error", error.description);
    }];
    
}


-(void)PostChildCareUserProfileUpdate:(NSString *)name
                         withEmailID:(NSString *)emailed
                           withPhone:(NSString *)phone
                          withGender:(NSString *)gender
                       withModifiedBy:(NSString *)modifiedby
                     withsuccessBlock:(SPChildCareUserProfileUpdateSuccessBlock)profileUpdateSuccessBlock
                      withFailueBlock:(SPChildCareUserProfileUpdateFailyewBlock)profileUpdateFailurBlock {
    
    SPServiceManager *serviceManager = [[SPServiceManager alloc] init];

    [serviceManager childCareUserProfileUpdate:name withMailId:emailed withPhone:phone withGender:gender withModifiedBy:modifiedby withSuccessBlock:^(NSURLSessionTask *task, NSDictionary *responseObject) {
        
        NSNumber * isSuccessNumber = (NSNumber *)[responseObject valueForKey:@"success"];
        NSString *messageDescription = [responseObject valueForKey:@"message"];
        if([isSuccessNumber boolValue] == YES) {
            profileUpdateSuccessBlock (messageDescription,isSuccessNumber);
            
        }else {
            NSString *errorTitleCode = [responseObject valueForKey:@"errortile"];
            NSString *errorDescription = @"Something went wrong..Please try again later";
            NSString *errorTitle = @"OOPs";
        }
    } withfailureBlock:^(NSURLSessionTask *operation, NSError *error) {
        profileUpdateFailurBlock(@"Network Error",error.localizedDescription,error.code);

    }];
    
}

- (void)updateCMSTextCopies {
    SPServiceManager *serviceManager = [[SPServiceManager alloc] init];
    [serviceManager getCMSTextCopiesWithSuccessBlock:^(NSURLSessionTask *task, NSDictionary *responseObject) {
        if (responseObject) {
            NSArray *attributeList = [responseObject valueForKey:@"attributes"];
            [[SPCoreDataManager sharedManager] insertTextCopies:attributeList];
        }
        
    } withfailureBlock:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Failed to get latest CMSTextCopies!!");
    }];
}

- (NSString *)cmsTextCopiesForCMSKey:(NSString *)CMSKey {
    NSString *cmsValue = [[SPCoreDataManager sharedManager] cmsTextCopiesValueFromLocalDBForCMSKey:CMSKey];
    if (!cmsValue) {
        cmsValue = @"Read from Plist file";
        // Need read it from Plist file.
    }
    
    return cmsValue;
}


- (NSString *)pathToPhotoAlbumFolder {
    NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                                        NSUserDomainMask,
                                                                        YES) lastObject];
    NSString *photoFolder = [documentsDirectory stringByAppendingPathComponent:photoAlbumFolderName];
    
    // Create the folder if necessary
    BOOL isDir = NO;
    NSFileManager *fileManager = [[NSFileManager alloc] init];
    if (![fileManager fileExistsAtPath:photoFolder
                           isDirectory:&isDir] && isDir == NO) {
        [fileManager createDirectoryAtPath:photoFolder
               withIntermediateDirectories:NO
                                attributes:nil
                                     error:nil];
    }
    return photoFolder;
}

- (void)processResponseDict:(NSDictionary *)responseDict {
    if (responseDict) {
        
        
        
    }
}

- (void)getPhotosForKidId:(NSString *)kidId
            responseBlock:(SPPhotosResponseBlock)responseBlock {
    
    
    // Phase I - Retrieve Local Image URLs (already saved in Disk) from CoreData
    
    NSArray *kidPhotoDetails = [[SPCoreDataManager sharedManager] getPhotoDetailsForKidId:kidId];
    NSMutableArray *localAvailableImageURLs = [[NSMutableArray alloc] init];
    
    if (kidPhotoDetails.count > 0) {
        localAvailableImageURLs  = [kidPhotoDetails valueForKeyPath:@"localAddress"];
        // Retrieved available Local images for the Kid
        NSLog(@"Avalilable Local Images for kid : %@ \n %@", kidId, localAvailableImageURLs);
    }
    
    // Phase II - Getting Photo API Response
    SPServiceManager *serviceManager = [[SPServiceManager alloc] init];
    [serviceManager getPhotoDetailsForKidId:kidId withSuccessBlock:^(NSURLSessionTask *task, NSDictionary *responseObject) {
        NSNumber * isSuccessNumber = (NSNumber *)[responseObject objectForKey: @"success"];
        NSString *msgTitle = nil;
        NSString *msgDescritpion = nil;
        if([isSuccessNumber boolValue] == YES) {
            NSArray *photoDetailsFromAPI = [SPPhoto parsePhotoAlbumResponse:responseObject];
            NSArray *remoteURLsInCoreData = [kidPhotoDetails valueForKeyPath:@"remoteAddress"];
            
            // Phase III - Comparing Image URLs available vs URLs from API
            NSArray *newPhotoDetails = [self comparePhotoDetailsFromAPI:photoDetailsFromAPI locallyAvailableRemoteURLs:remoteURLsInCoreData];
            [self downloadAndUpdateImageDetailsWithKidId:kidId withURLs:newPhotoDetails responseBlock:^(NSArray *photoLocalURLs, NSString *msgTitle, NSString *msgDescription, BOOL status) {
                
            }];
            
        } else {
            
            
        }
        responseBlock(localAvailableImageURLs, msgTitle, msgDescritpion, [isSuccessNumber boolValue]);
        
    } withfailureBlock:^(NSURLSessionTask *operation, NSError *error) {
        responseBlock(localAvailableImageURLs, @"Network Error", error.localizedDescription, NO);
    }];
    
    
}

- (NSArray *)comparePhotoDetailsFromAPI:(NSArray *)photoDetailsFromAPI
              locallyAvailableRemoteURLs:(NSArray *)urlsFromCoreData {
    NSMutableArray *newURLs = [[NSMutableArray alloc] init];
    
    for(SPPhoto *photo in photoDetailsFromAPI)
    {
        if (![urlsFromCoreData containsObject:photo.remoteAddress])
            [newURLs addObject: photo];
    }
    
    return newURLs.count > 0 ? newURLs : photoDetailsFromAPI;
}

- (void)downloadAndUpdateImageDetailsWithKidId:(NSString *)kidId withURLs:(NSArray *)newPhotoDetails responseBlock:(SPPhotosResponseBlock)responseBlock {
    
    NSLog(@"In DownloadAndUpdaetImageDetails ** Kid id : %@ \n DownloadURLs : %@",kidId,[newPhotoDetails valueForKeyPath:@"remoteAddress"]);
    __block NSURL *folderNamePath = [NSURL URLWithString:[self pathToPhotoAlbumFolder]];
    folderNamePath = [folderNamePath URLByAppendingPathComponent:kidId];
    
    dispatch_queue_t queue = dispatch_get_global_queue(0,0);
    dispatch_group_t group = dispatch_group_create();
    
    NSMutableArray *blockedOperations = [[NSMutableArray alloc] init];
    
    for(SPPhoto *photo in newPhotoDetails) {
        NSBlockOperation *blockedOperation = [NSBlockOperation blockOperationWithBlock:^{
            NSArray *parts = [photo.remoteAddress componentsSeparatedByString:@"/"];
            NSString *filename = [parts lastObject];
            NSURL *localFileName = [folderNamePath URLByAppendingPathComponent:filename];
            dispatch_async(dispatch_get_main_queue(), ^{
                NSData *thedata = [NSData dataWithContentsOfURL:[NSURL URLWithString:photo.remoteAddress]];
                [thedata writeToFile:localFileName.absoluteString atomically:YES];
                [[SPCoreDataManager sharedManager] insertPhotoDetailsForKidId:photo.kidId withPhotoText:photo.photoText withDateTime:photo.dateTime withLocalAddress:localFileName.absoluteString withRemoteAddress:photo.remoteAddress];
            });
        }];
        [blockedOperations addObject:blockedOperation];
    }
    for (NSOperation *operation in blockedOperations)
    {
        dispatch_group_async(group,queue,^{
            [operation start];
        });
    }
    
    dispatch_group_notify(group,queue,^{
        NSLog(@"Final block");
        responseBlock(nil, nil, nil, YES);
    });
}
@end
