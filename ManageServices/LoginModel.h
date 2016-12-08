//
//  LoginModel.h
//  ManageServices
//
//  Created by Cognizant MSP on 25/08/16.
//  Copyright © 2016 INNO IT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SPServiceManager.h"
#import "SPCoreDataManager.h"


@interface LoginModel : NSObject

- (void)peformLogin:(NSString *)username
       withPassword:(NSString *)password
   withSuccessBlock:(void (^)(NSString *description, BOOL status)) success
   withFailureBlock:(void (^)(NSString *description, NSInteger statusCode)) failure;

- (void)registerNewParent:(NSString *)username
             withPassword:(NSString *)password
             withFullName:(NSString *)fullName
         withMobileNumber:(NSString *)mobileNumber
         withSuccessBlock:(SPServiceSuccessBlock)success
         withfailureBlock:(SPServiceFailureBlock)failure;

- (void)showDBData;


@end
