//
//  CMSKeyManager.h
//  ManageServices
//
//  Created by Cognizant MSP on 20/10/16.
//  Copyright © 2016 INNO IT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CMSTextCopiesManager : NSObject

+ (instancetype)sharedManager;

- (NSString *)CMSValueForKey:(NSString *)cmsKey;

@end
