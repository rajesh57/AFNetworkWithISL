//
//  SPPhoto.m
//  ManageServices
//
//  Created by Cognizant MSP on 15/11/16.
//  Copyright © 2016 INNO IT. All rights reserved.
//

#import "SPPhoto.h"

@implementation SPPhoto

+ (NSArray *)parsePhotoAlbumResponse:(NSDictionary *)photosResponseDict {
    NSMutableArray *photoURLs= nil;
    NSDictionary *data = [photosResponseDict valueForKey:@"data"];
    SPPhoto *photo = nil;
    if (data) {
        NSArray *photosArray = [data valueForKey:@"photos"];
        photoURLs = [[NSMutableArray alloc] init];
        for (NSDictionary *photoDict in photosArray) {
            if (photoDict) {
                photo = [[SPPhoto alloc] init];
                photo.dateTime = [photoDict valueForKey:@"datetime"];
                photo.photoText = [photoDict valueForKey:@"photoName"];
                photo.remoteAddress = [photoDict valueForKey:@"photourl"];
                [photoURLs addObject:photo];
            }
        }
    }

    return photoURLs;
}


@end
