//
//  CMSKeyManager.m
//  ManageServices
//
//  Created by Cognizant MSP on 20/10/16.
//  Copyright © 2016 INNO IT. All rights reserved.
//

#import "CMSTextCopiesManager.h"
#import "SPDataManager.h"

@implementation CMSTextCopiesManager

+ (instancetype)sharedManager {
    static CMSTextCopiesManager *cmsKeyManager = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        cmsKeyManager = [[self alloc] init];
    });
    
    return cmsKeyManager;
}

- (NSString *)CMSValueForKey:(NSString *)cmsKey {
    return [[SPDataManager sharedManager] cmsTextCopiesForCMSKey:cmsKey];
}

@end
