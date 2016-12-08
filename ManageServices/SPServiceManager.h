//
//  SPServiceManager.h
//  SmartParent
//
//  Created by Prasanth Raj S on 24/08/16.
//  Copyright © 2016 INNOIT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SPServiceConstants.h"
#import "KeyChainManager.h"

typedef enum : NSUInteger {
    SPRequestTypeGET = 0,
    SPRequestTypePOST,
    SPRequestTypePUT,
} SPRequestType;

typedef void (^SPServiceSuccessBlock)(NSURLSessionTask *task, NSDictionary *responseObject);
typedef void (^SPServiceFailureBlock)(NSURLSessionTask *operation, NSError *error);
typedef void (^SPNSURLSessionTaskPUTFailureBlock)(NSURLSessionDataTask *dataDask, id responseObject);

typedef void (^SPServiceImageDownloadSuccessBlock)(NSString *photoFilePath);
typedef void (^SPServiceImageDownloadFailureBlock)(NSString *reason, NSError *error);

typedef void (^SPSuccessBlock)(NSString *message, NSDictionary *responseObject);
typedef void (^SPFailureBlock)(NSString *errorDescription, NSString *errorCode, NSError *error);

@interface SPServiceManager : NSObject


//=============================================

// Get Child Attdance List
- (void)getchildAttdanceListWithParameter:(NSDictionary *)parameterDict
                         withSuccessBlock:(SPServiceSuccessBlock)success
                         withfailureBlock:(SPServiceFailureBlock)failure;

// Get ChildDiaperDetails List
- (void)getChildDiaperDetailsWithWithParameter:(NSDictionary *)parameterDict
                            withSuccessBlock:(SPServiceSuccessBlock)success
                             withfailureBlock:(SPServiceFailureBlock)failure;


//POST ChildcareUser Profile Update
- (void)childCareUserProfileUpdate:(NSString *)name
          withMailId:(NSString *)emailed
          withPhone:(NSString *)phone
          withGender:(NSString *)gender
          withModifiedBy:(NSString *)modifiedby
          withSuccessBlock:(SPServiceSuccessBlock)success
          withfailureBlock:(SPServiceFailureBlock)failure;

//=============================================


- (void)authenticateUser:(NSString *)username
            withPassword:(NSString *)password
        withSuccessBlock:(SPServiceSuccessBlock)success
        withfailureBlock:(SPServiceFailureBlock)failure;

- (void)registerParent:(NSString *)username
          withPassword:(NSString *)password
          withFullName:(NSString *)fullName
      withMobileNumber:(NSString *)mobileNumber
      withSuccessBlock:(SPServiceSuccessBlock)success
      withfailureBlock:(SPServiceFailureBlock)failure;

- (void)getPhotoDetailsForKidId:(NSString *)kidId
               withSuccessBlock:(SPServiceSuccessBlock)success
               withfailureBlock:(SPServiceFailureBlock)failure;

- (void)getParentProfile:(SPServiceSuccessBlock)success
               withfailureBlock:(SPServiceFailureBlock)failure;

- (void)getDailySheetWithParameter:(NSDictionary *)parameterDict
                  withSuccessBlock:(SPServiceSuccessBlock)success
                  withfailureBlock:(SPServiceFailureBlock)failure;

- (NSURLSessionDataTask *) buildRequest: (NSString*)url
                            requestType: (SPRequestType)requestType
                         parametersDict: (NSDictionary*) parameterDict
                            headersDict: (NSDictionary*) headersDict
                                success: (SPServiceSuccessBlock)successBlock
                                failure: (SPServiceFailureBlock)failureBlock;

- (void)getCMSTextCopiesWithSuccessBlock:(SPServiceSuccessBlock)success
                        withfailureBlock:(SPServiceFailureBlock)failure;

- (void)linkChildWithChildCareMemebershipID:(NSString *)childCareMemebershipID
                             childFirstName:(NSString *)firstName
                              childLastName:(NSString *)lastName
                                   childDOB:(NSString *)dob
                                childLinkID:(NSString *)childLinkID
                               SuccessBlock:(SPSuccessBlock)success
                           withfailureBlock:(SPFailureBlock)failure;

- (void)handleReponseDict:(NSDictionary *)responseDict
             successBlock:(SPSuccessBlock)success
             failureBlock:(SPFailureBlock)failure;

- (void)resendActivationMail:(NSString *)emailAddress
                SuccessBlock:(SPSuccessBlock)success
            withfailureBlock:(SPFailureBlock)failure;

- (void)resetPassword:(NSString *)emailAddress
         SuccessBlock:(SPSuccessBlock)success
     withfailureBlock:(SPFailureBlock)failure;

- (void)downloadImageWithImageURLString:(NSString *)photoURLString saveTo:(NSString *)folderName successBlock:(SPServiceImageDownloadSuccessBlock)success failureBlock:(SPServiceImageDownloadFailureBlock)failure;



@end
