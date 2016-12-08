//
//  SPParentProfile.m
//  ManageServices
//
//  Created by Cognizant MSP on 25/08/16.
//  Copyright © 2016 INNO IT. All rights reserved.
//

#import "SPParentProfile.h"
#import "NSDictionary+SmartParent.h"

@implementation SPParentProfile


+ (SPParentProfile *)parseParentProfileResponse:(NSDictionary *)parentProfileResponseDict {
    NSDictionary *data = [parentProfileResponseDict valueForKey:@"data"];
    SPParentProfile *parentProfile = nil;
    if (data) {
        NSDictionary *personalDetail = [data valueForKey:@"personalDetails"];
        NSArray *parentLinkedKids = [data valueForKey:@"linkedKids"];
        if (personalDetail) {
                parentProfile = [[SPParentProfile alloc] init];
                parentProfile.fullname = [personalDetail valueForKey:@"fullName"];
                parentProfile.mobilenumber = [personalDetail valueForKey:@"mobileNumber"];
                parentProfile.emailId = [personalDetail valueForKey:@"emailAddress"];
                parentProfile.linkedChilds = [SPParentProfile linkedChildsForPersonalDetails:parentLinkedKids];
        }
    }
    
    return parentProfile;
}

+ (NSArray *)linkedChildsForPersonalDetails:(NSArray *)linkedKidsArray {
    NSMutableArray *linkedChilds = [[NSMutableArray alloc] init];
    for (NSDictionary *linkedChildDict in linkedKidsArray) {
       
        SPLindedChild *linkedChild = [[SPLindedChild alloc] init];
        linkedChild.firstname =  [linkedChildDict valueForKey:@"firstName"];
        linkedChild.lastname =  [linkedChildDict valueForKey:@"lastName"];
        linkedChild.dob =  [linkedChildDict valueForKey:@"dob"];
        linkedChild.childcarememid =  [linkedChildDict valueForKey:@"id"];
        linkedChild.imagepath =  [linkedChildDict valueForKey:@"imagePath"];
        linkedChild.linkingid =  [linkedChildDict valueForKey:@"linkingId"];
        linkedChild.childCareDetails = [SPParentProfile childCareDetails:[linkedChildDict valueForKey:@"child_care_details"]];
        [linkedChilds addObject:linkedChild];
    }
    return linkedChilds;
}

+ (SPChildCareDetails *)childCareDetails:(NSDictionary *)childcaredetailsDict {
    SPChildCareDetails *childCareDetails = nil;
    if (childcaredetailsDict) {
        
        childCareDetails = [[SPChildCareDetails alloc] init];
        childCareDetails.name =  [childcaredetailsDict valueForKey:@"name"];
        childCareDetails.type =  [childcaredetailsDict valueForKey:@"type"];
        childCareDetails.membershipId =  [childcaredetailsDict valueForKey:@"membershipId"];
        childCareDetails.buildingName =  [childcaredetailsDict valueForKey:@"buildingName"];
        
        childCareDetails.streetNumber =  [childcaredetailsDict valueForKey:@"streetNumber"];
        childCareDetails.unit =  [childcaredetailsDict valueForKey:@"unit"];
        childCareDetails.streetName =  [childcaredetailsDict valueForKey:@"streetName"];
        childCareDetails.suburb =  [childcaredetailsDict valueForKey:@"suburb"];
        childCareDetails.state =  [childcaredetailsDict valueForKey:@"state"];
        childCareDetails.postalcode =  [childcaredetailsDict valueForKey:@"postalCode"];
        
        childCareDetails.primaryContact =  [childcaredetailsDict valueForKey:@"primaryContact"];
        childCareDetails.secondaryContact =  [childcaredetailsDict valueForKey:@"secondaryContact"];
        childCareDetails.website =  [childcaredetailsDict valueForKey:@"website"];
    }
    
    return childCareDetails;
}

@end
