//
//  SPServiceManager.m
//  SmartParent
//
//  Created by Prasanth Raj S on 24/08/16.
//  Copyright © 2016 INNOIT. All rights reserved.
//

#import "SPServiceManager.h"
#import "KeyChainManager.h"
#import "AFNetworking.h"

@implementation SPServiceManager

//=============================================

// Get Child Message List
- (void)getchildAttdanceListWithParameter:(NSDictionary *)parameterDict
                        withSuccessBlock:(SPServiceSuccessBlock)success
                        withfailureBlock:(SPServiceFailureBlock)failure {
    [self buildRequest:kGetChildListAttendanceAPIEndPoint
           requestType:SPRequestTypeGET
        parametersDict:parameterDict
           headersDict:[self requestHeaderForCommonService]
               success:success
               failure:failure];
}


- (void)getChildDiaperDetailsWithWithParameter:(NSDictionary *)parameterDict
                              withSuccessBlock:(SPServiceSuccessBlock)success
                              withfailureBlock:(SPServiceFailureBlock)failure {
    [self buildRequest:kGetChildDiaperDetailsAPIEndPoint
           requestType:SPRequestTypeGET
        parametersDict:parameterDict
           headersDict:[self requestHeaderForCommonService]
               success:success
               failure:failure];
}


- (void)childCareUserProfileUpdate:(NSString *)name
                        withMailId:(NSString *)emailed
                         withPhone:(NSString *)phone
                        withGender:(NSString *)gender
                    withModifiedBy:(NSString *)modifiedby
                  withSuccessBlock:(SPServiceSuccessBlock)success
                  withfailureBlock:(SPServiceFailureBlock)failure {
    
    NSMutableDictionary *parameterDict = [[NSMutableDictionary alloc] init];
    [parameterDict setValue:name forKey:kName];
    [parameterDict setValue:emailed forKey:kEmailId];
    [parameterDict setValue:phone forKey:kPhone];
    [parameterDict setValue:gender forKey:kGender];
    [parameterDict setValue:modifiedby forKey:kModifiedBy];
    
    [self buildRequest:kChildCareUserProfileUpdateAPIEndPoint
           requestType:SPRequestTypePOST
        parametersDict:parameterDict
           headersDict:[self requestHeaderForCommonService]
               success:success
               failure:failure];
    
}
//=============================================


- (void)authenticateUser:(NSString *)username
            withPassword:(NSString *)password
        withSuccessBlock:(SPServiceSuccessBlock)success
        withfailureBlock:(SPServiceFailureBlock)failure {
    
    NSMutableDictionary *parameterDict = [[NSMutableDictionary alloc] init];
    [parameterDict setValue:username forKey:kUsername];
    [parameterDict setValue:password forKey:kPassword];
    
    [self buildRequest:kLoginAPIEndPoint
                requestType:SPRequestTypePOST
             parametersDict:parameterDict
                headersDict:[self requestHeaderForAuthentication]
                    success:success
                    failure:failure];
}

- (void)registerParent:(NSString *)username
          withPassword:(NSString *)password
          withFullName:(NSString *)fullName
      withMobileNumber:(NSString *)mobileNumber
      withSuccessBlock:(SPServiceSuccessBlock)success
      withfailureBlock:(SPServiceFailureBlock)failure {
   
    NSMutableDictionary *parameterDict = [[NSMutableDictionary alloc] init];
    [parameterDict setValue:username forKey:kUsername];
    [parameterDict setValue:password forKey:kPassword];
    [parameterDict setValue:fullName forKey:kFullname];
    [parameterDict setValue:mobileNumber forKey:kMobilenumber];

    [self buildRequest:kRegisterParentAPIEndPoint
                requestType:SPRequestTypePOST
             parametersDict:parameterDict
                headersDict:[self requestHeaderForCommonService]
                    success:success
                    failure:failure];
    
}

- (void)getPhotoDetailsForKidId:(NSString *)kidId
               withSuccessBlock:(SPServiceSuccessBlock)success
               withfailureBlock:(SPServiceFailureBlock)failure {
    NSMutableDictionary *parameterDict = [[NSMutableDictionary alloc] init];
    [parameterDict setValue:kidId? kidId : @"" forKey:kKidId];
    
    [self buildRequest:kPhotosAPIEndPoint
           requestType:SPRequestTypeGET
        parametersDict:parameterDict
           headersDict:[self requestHeaderForCommonService]
               success:success
               failure:failure];
    
}

- (void)getParentProfile:(SPServiceSuccessBlock)success
        withfailureBlock:(SPServiceFailureBlock)failure {
    [self buildRequest:kParentProfileAPIEndPoint
           requestType:SPRequestTypeGET
        parametersDict:nil
           headersDict:[self requestHeaderForCommonService]
               success:success
               failure:failure];
}

- (void)getDailySheetWithParameter:(NSDictionary *)parameterDict withSuccessBlock:(SPServiceSuccessBlock)success
        withfailureBlock:(SPServiceFailureBlock)failure {
    [self buildRequest:kDailySheetsAPIEndPoint
           requestType:SPRequestTypeGET
        parametersDict:parameterDict
           headersDict:[self requestHeaderForCommonService]
               success:success
               failure:failure];
}


- (void)getCMSTextCopiesWithSuccessBlock:(SPServiceSuccessBlock)success
                        withfailureBlock:(SPServiceFailureBlock)failure {
    
    [self buildRequest:kTextCopiesAPIEndPoint
           requestType:SPRequestTypeGET
        parametersDict:@{kType : kTextcopies}
           headersDict:[self requestHeaderForCommonService]
               success:success
               failure:failure];
    
}

- (void)linkChildWithChildCareMemebershipID:(NSString *)childCareMemebershipID
                             childFirstName:(NSString *)firstName
                              childLastName:(NSString *)lastName
                                   childDOB:(NSString *)dob
                                childLinkID:(NSString *)childLinkID
                               SuccessBlock:(SPSuccessBlock)success
                           withfailureBlock:(SPFailureBlock)failure {
    
    NSMutableDictionary *parameterDict = [[NSMutableDictionary alloc] init];
    [parameterDict setObject:[self removeNILfromString:childCareMemebershipID] forKey:@"childcarememid"];
    [parameterDict setObject:[self removeNILfromString:firstName] forKey:@"childfirstname"];
    [parameterDict setObject:[self removeNILfromString:lastName] forKey:@"childlastname"];
    [parameterDict setObject:[self removeNILfromString:dob] forKey:@"dob"];
    [parameterDict setObject:[self removeNILfromString:childLinkID] forKey:@"childlinkid"];
    
    __weak SPServiceManager *weakSelf = self;
    
    [self buildRequest:kChildLinkAPIEndPoint
           requestType:SPRequestTypePOST
        parametersDict:parameterDict
           headersDict:[self requestHeaderForCommonService]
               success:^(NSURLSessionTask *task, NSDictionary *responseObject) {
                   [weakSelf handleReponseDict:responseObject successBlock:success failureBlock:failure];
               } failure:^(NSURLSessionTask *operation, NSError *error) {
                   failure(error.description,nil, error);
               }];
}

- (void)resendActivationMail:(NSString *)emailAddress
                SuccessBlock:(SPSuccessBlock)success
            withfailureBlock:(SPFailureBlock)failure {
    
    NSMutableDictionary *parameterDict = [[NSMutableDictionary alloc] init];
    [parameterDict setObject:[self removeNILfromString:emailAddress] forKey:@"emailaddress"];
    
     __weak SPServiceManager *weakSelf = self;
    
    [self buildRequest:kResendEmailVerificationAPIEndPoint
           requestType:SPRequestTypeGET
        parametersDict:parameterDict
           headersDict:[self requestHeaderForCommonService]
               success:^(NSURLSessionTask *task, NSDictionary *responseObject) {
                    [weakSelf handleReponseDict:responseObject successBlock:success failureBlock:failure];
               } failure:^(NSURLSessionTask *operation, NSError *error) {
                   failure(error.description,nil, error);
               }];
}

- (void)resetPassword:(NSString *)emailAddress
                SuccessBlock:(SPSuccessBlock)success
            withfailureBlock:(SPFailureBlock)failure {
    
    NSMutableDictionary *parameterDict = [[NSMutableDictionary alloc] init];
    [parameterDict setObject:[self removeNILfromString:emailAddress] forKey:@"emailaddress"];
    
    __weak SPServiceManager *weakSelf = self;
    
    [self buildRequest:kResetPasswordAPIEndPoint
           requestType:SPRequestTypeGET
        parametersDict:parameterDict
           headersDict:[self requestHeaderForCommonService]
               success:^(NSURLSessionTask *task, NSDictionary *responseObject) {
                   [weakSelf handleReponseDict:responseObject successBlock:success failureBlock:failure];
               } failure:^(NSURLSessionTask *operation, NSError *error) {
                   failure(error.description,nil, error);
               }];
}




- (NSDictionary *)requestHeaderForAuthentication {
    return @{@"device" : @"iPhone", @"appType" : @"ParentApp"};
}

- (NSDictionary *)requestHeaderForCommonService {
    NSMutableDictionary *headerRequest = [[NSMutableDictionary alloc] init];
    [headerRequest setValue:@"iPhone" forKey:@"device"];
    [headerRequest setValue:@"ParentApp" forKey:@"appType"];
    
    if ([KeyChainManager tokenForUser]) {
        [headerRequest setValue:[KeyChainManager tokenForUser] forKey:@"token"];

    }
    
    return headerRequest;
    
}

- (NSURLSessionDataTask *) buildRequest: (NSString* const)url
                            requestType: (SPRequestType)requestType
                         parametersDict: (NSDictionary*) parameterDict
                            headersDict: (NSDictionary*) headersDict
                                success: (SPServiceSuccessBlock)successBlock
                                failure: (SPServiceFailureBlock)failureBlock{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [self addParametersToRequestHeader:headersDict requestSerialiser:manager.requestSerializer];
    
    NSURLSessionDataTask *task = nil;
    
    NSString *completeURL = [NSString stringWithFormat:@"%@%@",kBaseURLString,url];
    
    DLog(@"completeURL ===== %@",completeURL);
    
    if (requestType == SPRequestTypeGET) {
        task = [manager GET:completeURL parameters:parameterDict progress:nil success:successBlock failure:failureBlock];
        
    }else if (requestType == SPRequestTypePOST){
        
        task = [manager POST:completeURL parameters:parameterDict progress:nil success:successBlock failure:failureBlock];
        
    }else if (requestType == SPRequestTypePUT){
        
        task = [manager PUT:completeURL parameters:parameterDict success:successBlock failure:^(NSURLSessionDataTask *dataDask, id responseObject){
            
            failureBlock(nil,nil);
        }];
    }
    
    return task;
}

- (void)addParametersToRequestHeader:(NSDictionary *)dict requestSerialiser:(AFHTTPRequestSerializer *)headerSerializer {
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [headerSerializer setValue:obj forHTTPHeaderField:key];
    }];
}

- (void)downloadImageWithImageURLString:(NSString *)photoURLString saveTo:(NSString *)folderName successBlock:(SPServiceImageDownloadSuccessBlock)success failureBlock:(SPServiceImageDownloadFailureBlock)failure {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSURL *URL = [NSURL URLWithString:photoURLString];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request
                                                                     progress:^(NSProgress * _Nonnull downloadProgress){  /* update your progress view  */ }
                                                                  destination:^NSURL *(NSURL *targetPath, NSURLResponse *response)
                                              {
                                                  NSURL *folderNamePath = [NSURL URLWithString:folderName];
                                                  return [folderNamePath URLByAppendingPathComponent:[response suggestedFilename]];
                                              }
                                                            completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error)
                                              {
                                                  NSLog(@"File downloaded to: %@", filePath);
                                                  if (error) {
                                                      failure(error.description, error);
                                                  } else {
                                                      success(filePath.absoluteString);
                                                  }
                                              }];
    [downloadTask resume];
}

- (NSString *)removeNILfromString:(NSString *)stringInput {
    return stringInput == nil ? @"" : stringInput;
}

- (void)handleReponseDict:(NSDictionary *)responseDict
             successBlock:(SPSuccessBlock)success
             failureBlock:(SPFailureBlock)failure {
    
    if (responseDict) {
        NSNumber * isSuccessNumber = (NSNumber *)[responseDict objectForKey:kResponseDictSuccess];
        
        if ([isSuccessNumber boolValue] == YES) { // Success is TRUE
            NSString *message = [responseDict objectForKey:kResponseDictMessage];
            success(message, responseDict);
        } else {
            // Success is FALSE
            NSString *errorCode = [responseDict objectForKey:kResponseDictErrorCode];
            NSString *errorDesc = [responseDict objectForKey:kResponseDictErrorDesc];
            failure(errorDesc,errorCode, nil);
        }
    } else {
        failure(kUnHandledErrorServiceError,nil, nil);  // if response is empty
    }
}

@end
