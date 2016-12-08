//
//  LoginModel.m
//  ManageServices
//
//  Created by Cognizant MSP on 25/08/16.
//  Copyright © 2016 INNO IT. All rights reserved.
//

#import "LoginModel.h"
#import "SPServiceManager.h"
#import "SPDataManager.h"


@implementation LoginModel

- (void)peformLogin:(NSString *)username
       withPassword:(NSString *)password
   withSuccessBlock:(void (^)(NSString *description, BOOL status)) success
   withFailureBlock:(void (^)(NSString *description, NSInteger statusCode)) failure {
    
    SPServiceManager *servieManager = [[SPServiceManager alloc] init];
//    [servieManager authenticateUser:username withPassword:password withSuccessBlock:^(NSURLSessionTask *task, NSDictionary *responseObject) {
//        NSString *status = [responseObject valueForKey:@"status"];
//        NSLog(@"Login Description: %@",responseObject);
//        if ([status isEqualToString:@"Success"]) {
//            success(@"Login Successfull", YES);
//        } else {
//            failure(status,404);
//        }
//        
//    } withfailureBlock:^(NSURLSessionTask *operation, NSError *error) {
//        failure(error.description,error.code);
//    }];
    SPDataManager *dm = [[SPDataManager alloc] init];
    [dm getParentProfileDetails:^(SPParentProfile *parentProfile) {
        
    } withfailureBlock:^(SPParentProfile *parentProfile, NSString *errorString) {
        
    }];
    
}

- (void)registerNewParent:(NSString *)username
             withPassword:(NSString *)password
             withFullName:(NSString *)fullName
         withMobileNumber:(NSString *)mobileNumber
         withSuccessBlock:(SPServiceSuccessBlock)success
         withfailureBlock:(SPServiceFailureBlock)failure {
    SPServiceManager *servieManager = [[SPServiceManager alloc] init];
    [servieManager registerParent:username withPassword:password withFullName:fullName withMobileNumber:mobileNumber withSuccessBlock:success withfailureBlock:failure];
}

- (void)showDBData {
   // [[SPCoreDataManager sharedManager] inspectParentProfile];
    [[SPDataManager sharedManager] getDailSheetDetails:^(SPDailySheet *dailySheet) {
        
    } withfailureBlock:^(SPDailySheet *dailySheet, NSString *errorString) {
        
    }];
}

@end
