//
//  SPCoreDataManager.m
//  ManageServices
//
//  Created by Cognizant MSP on 25/08/16.
//  Copyright © 2016 INNO IT. All rights reserved.
//

#import "SPCoreDataManager.h"
#import <CoreData/CoreData.h>
#import "AppDelegate.h"
#import "SPParentProfile.h"
#import "SPLindedChild.h"
#import "ParentProfile.h"
#import "LinkedChild+CoreDataProperties.h"
#import "ChildCareDetails+CoreDataProperties.h"
#import "CMSTextCopies.h"
#import "PhotoAlbum.h"

@implementation SPCoreDataManager

+ (instancetype)sharedManager {
    static SPCoreDataManager *coreDataManager = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        coreDataManager = [[self alloc] init];
    });
    
    return coreDataManager;
}

- (void)addParentProfile:(SPParentProfile *)parentProfile {
    [self clearDataInEntity:@"ParentProfile"];
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    ParentProfile *cdParentProfile = [NSEntityDescription insertNewObjectForEntityForName:@"ParentProfile"
                                  inManagedObjectContext:appDelegate.managedObjectContext];
    
    cdParentProfile.parentName = parentProfile.fullname;
    cdParentProfile.parentMobileNumber = parentProfile.mobilenumber;
    cdParentProfile.parentEmailId = parentProfile.emailId;
    NSSet *childs = [self addLinkedChild:parentProfile.linkedChilds];
    cdParentProfile.relationship = childs;
    NSError *error;
    if (![appDelegate.managedObjectContext save:&error]) {
        NSLog(@"Failed to save - error: %@", [error localizedDescription]);
    }
    
}

- (NSSet *)addLinkedChild:(NSArray *)linkedChilds {
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    LinkedChild *linkedChild;
    NSMutableSet *linkedChildSets = [[NSMutableSet alloc] init];
    for (SPLindedChild *spLinkedChild in linkedChilds) {
        linkedChild = [NSEntityDescription insertNewObjectForEntityForName:@"LinkedChild"
                                                    inManagedObjectContext:appDelegate.managedObjectContext];
        linkedChild.firstname = spLinkedChild.firstname;
        linkedChild.lastname = spLinkedChild.lastname;
        linkedChild.dob = spLinkedChild.dob;
        linkedChild.childcarememid = [NSString stringWithFormat:@"%@",spLinkedChild.childcarememid];
        linkedChild.childCareDetails = [self childCareDetailsForLinkedChild:spLinkedChild];
        [linkedChildSets addObject:linkedChild];
    }
    return linkedChildSets;
}

- (ChildCareDetails *)childCareDetailsForLinkedChild:(SPLindedChild *) spLinkedChild {
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    ChildCareDetails *childCareDetails = [NSEntityDescription insertNewObjectForEntityForName:@"ChildCareDetails"
                                                                       inManagedObjectContext:appDelegate.managedObjectContext];
    childCareDetails.name = spLinkedChild.childCareDetails.name;
    childCareDetails.type = [NSString stringWithFormat:@"%@",spLinkedChild.childCareDetails.type];
    childCareDetails.membershipId = spLinkedChild.childCareDetails.membershipId;
    childCareDetails.buildingName = spLinkedChild.childCareDetails.buildingName;
    childCareDetails.streetNumber = spLinkedChild.childCareDetails.streetName;
    childCareDetails.unit = spLinkedChild.childCareDetails.unit;
    childCareDetails.streetName = spLinkedChild.childCareDetails.streetName;
    childCareDetails.suburb  = spLinkedChild.childCareDetails.suburb;
    childCareDetails.state = spLinkedChild.childCareDetails.state;
    childCareDetails.postalCode = spLinkedChild.childCareDetails.postalcode;
    childCareDetails.primaryContact = spLinkedChild.childCareDetails.primaryContact;
    childCareDetails.secondaryContact = spLinkedChild.childCareDetails.secondaryContact;
    childCareDetails.website = spLinkedChild.childCareDetails.website;
    
    return childCareDetails;
}

#pragma - CMSTextCopies Methods

- (NSInteger)insertTextCopies:(NSArray *)attributeDictionaryArray {
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    CMSTextCopies *cmsTextCopy;
    
    //Clear all records from CMSTextCopies Entity
    [self clearDataInEntity:@"CMSTextCopies"];
    
    for (NSDictionary *attributeDict in attributeDictionaryArray) {
        cmsTextCopy = [NSEntityDescription insertNewObjectForEntityForName:@"CMSTextCopies"
                                                    inManagedObjectContext:appDelegate.managedObjectContext];
        cmsTextCopy.cmsKey = [attributeDict valueForKey:@"name"];
        cmsTextCopy.cmsValue = [attributeDict valueForKey:@"value"];
    }
    
    NSError *error;
    if (![appDelegate.managedObjectContext save:&error]) {
        NSLog(@"Failed to save - error: %@", [error localizedDescription]);
    }
    
    return attributeDictionaryArray.count;
}

- (NSString *)cmsTextCopiesValueFromLocalDBForCMSKey:(NSString *)cmsKey {
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"CMSTextCopies"];
    request.predicate = [NSPredicate predicateWithFormat:@"%K MATCHES[cd] %@",@"cmsKey",cmsKey];
    NSError *error = nil;
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSArray *results = [appDelegate.managedObjectContext executeFetchRequest:request error:&error];
    NSString *resultCMSValue = nil;
    
    if (error != nil) {
        NSLog(@"Error in reading data from CoreData");
    } else {
        for (CMSTextCopies *cmsCopy in results) {
            resultCMSValue = cmsCopy.cmsValue;
            break;
        }
    }

    return resultCMSValue;
}


#pragma - Helper Methods

- (void)inspectParentProfile {
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"ParentProfile"];
    NSError *error = nil;
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSArray *results = [appDelegate.managedObjectContext executeFetchRequest:request error:&error];
    
    if (error != nil) {
        NSLog(@"Error in reading data from CoreData");
    }
    else {
        for (ParentProfile *profile in results) {
            NSLog(@"parent MobileNumber : %@ \nparent Name : %@ \nparent Email Id : %@ \n", profile.parentMobileNumber, profile.parentName, profile.parentEmailId);
            for (LinkedChild *linkedChild in profile.relationship) {
                NSLog(@"\n\tfirstname : %@ \n\tlast Name : %@ \n\tDOB : %@ \n\tChildcareMem Id : %@ \n\tImage Path : %@ \n", linkedChild.firstname, linkedChild.lastname, linkedChild.dob, linkedChild.childcarememid, linkedChild.imagepath);
                
                NSLog(@"\n\n\t\tbuildingName : %@ \n\t\tMembershipId : %@ \n\t\tName : %@ \n\t\tPostalCode : %@ \n\t\tState : %@ \n\t\tstreetName : %@ \n\t\tstreetNumber : %@ \n\t\tSuburb : %@ \n\t\tprimaryContact : %@\n\t\tWebsite : %@",linkedChild.childCareDetails.buildingName, linkedChild.childCareDetails.membershipId, linkedChild.childCareDetails.name, linkedChild.childCareDetails.postalCode, linkedChild.childCareDetails.state, linkedChild.childCareDetails.streetName, linkedChild.childCareDetails.streetNumber, linkedChild.childCareDetails.suburb,linkedChild.childCareDetails.primaryContact, linkedChild.childCareDetails.website);
            }
        }
    
    }

}

- (void)insertPhotoDetailsForKidId:(NSString *)kidId
                     withPhotoText:(NSString *)photoText
                      withDateTime:(NSString *)dateTime
                  withLocalAddress:(NSString *)localAddress
                 withRemoteAddress:(NSString *)remoteAddress {
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    PhotoAlbum *photoAlbum = [NSEntityDescription insertNewObjectForEntityForName:@"PhotoAlbum"
                                                    inManagedObjectContext:appDelegate.managedObjectContext];
    photoAlbum.kidId = kidId;
    photoAlbum.localAddress = localAddress;
    photoAlbum.remoteAddress = remoteAddress;
    photoAlbum.photoText = photoText;
    photoAlbum.dateTime = dateTime;
    
    NSError *error;
    if (![appDelegate.managedObjectContext save:&error]) {
        NSLog(@"Failed to save - error: %@", [error localizedDescription]);
    }
    
}

- (NSArray *)getPhotoDetailsForKidId:(NSString *)kidId {
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"CMSTextCopies"];
    request.predicate = [NSPredicate predicateWithFormat:@"%K MATCHES[cd] %@",@"kidId",kidId];
    NSError *error = nil;
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSArray *results = [appDelegate.managedObjectContext executeFetchRequest:request error:&error];
    
    if (error != nil) {
        NSLog(@"Error in reading data from CoreData");
        results = nil;
    }
    
    return results;
}

- (void)clearDataInEntity:(NSString *)entityName {
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:entityName];
    NSBatchDeleteRequest *delete = [[NSBatchDeleteRequest alloc] initWithFetchRequest:request];
    
    NSError *deleteError = nil;
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    [appDelegate.persistentStoreCoordinator executeRequest:delete withContext:appDelegate.managedObjectContext error:&deleteError];
    [appDelegate saveContext];
}

@end
