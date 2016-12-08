//
//  SPPhoto.h
//  ManageServices
//
//  Created by Cognizant MSP on 15/11/16.
//  Copyright © 2016 INNO IT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SPPhoto : NSObject

@property (nonatomic, copy) NSString *kidId;
@property (nonatomic, copy) NSString *localAddress;
@property (nonatomic, copy) NSString *remoteAddress;
@property (nonatomic, copy) NSString *dateTime;
@property (nonatomic, copy) NSString *photoText;

+ (NSArray *)parsePhotoAlbumResponse:(NSDictionary *)photosResponseDict;

@end
