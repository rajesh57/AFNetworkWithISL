//
//  SPServiceConstants.h
//  ManageServices
//
//  Created by Cognizant MSP on 24/10/16.
//  Copyright © 2016 INNO IT. All rights reserved.
//

#ifndef SPServiceConstants_h
#define SPServiceConstants_h



//*****************************************************

#ifdef DEBUG
#   define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define DLog(...)
#endif

// ALog will always output like NSLog

#define ALog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);

// ULog will show the UIAlertView only when the DEBUG variable is set

#ifdef DEBUG
#   define ULog(fmt, ...)  { UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%s\n [Line %d] ", __PRETTY_FUNCTION__, __LINE__] message:[NSString stringWithFormat:fmt, ##__VA_ARGS__]  delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil]; [alert show]; }
#else
#   define ULog(...)
#endif
//*****************************************************


// SMART PARENT -  BASE URL
static const NSString * const kBaseURLString = @"https://smartparent.com.au/api/v1/";

// SERVIE API END POINTS

//======================================================================
static NSString * const kLoginAPIEndPoint = @"childcare/authenticate";


static NSString * const kChildCareUserProfileUpdateAPIEndPoint = @"childcareuserupdateprofile";

static NSString * const kConfiguratoinAPIEndPoint = @"getconfiguration";

static NSString * const kChildcareuserprofileAPIEndPoint = @"childcareuserprofile";

//childcareid hard coeded now
static NSString * const kGetChildListAPIEndPoint = @"getchildlist?childcareid=1";
//childcareid hard coeded now
static NSString * const kGetChildListMessageAPIEndPoint = @"getchildmessages?childcareid=1";

//childcareid hard coeded now
static NSString * const kGetChildListAttendanceAPIEndPoint = @"getchildattendance?childcareid=1";

//childcareid hard coeded now
static NSString * const kGetChildDiaperDetailsAPIEndPoint = @"getchilddiapers?childcareid=1";


// Keys - Used in Service Request - Childcare User Profile Update:
static NSString * const kName = @"name";
static NSString * const kEmailId = @"emailed";
static NSString * const kPhone = @"phone";
static NSString * const kGender = @"gender";
static NSString * const kModifiedBy = @"modifiedby";

//======================================================================



// SMART PARENT -  BASE URL
//static NSString *baseURLString = @"http://daycare.innoit.com.au/api/v1/";
//static const NSString * const kBaseURLString = @"https://smartparent.com.au/api/v1/";

// SERVIE API END POINTS
static NSString * const kMessagesAPIEndPoint = @"messages";
static NSString * const kPhotosAPIEndPoint = @"photos";
static NSString * const kDailySheetsAPIEndPoint = @"dailysheet";
static NSString * const kParentProfileAPIEndPoint = @"parentprofile";
static NSString * const kChildLinkAPIEndPoint = @"childlink";
static NSString * const kRegisterParentAPIEndPoint = @"registerparent";
//static NSString * const kLoginAPIEndPoint = @"authenticate";
static NSString * const kResendEmailVerificationAPIEndPoint = @"resendemailverification";
static NSString * const kResetPasswordAPIEndPoint = @"resetpassword";
static NSString * const kTextCopiesAPIEndPoint = @"attributes";

// Keys - Used in Service Response
static NSString * const kResponseDictSuccess = @"success";
static NSString * const kResponseDictMessage = @"message";
static NSString * const kResponseDictErrorDesc = @"errorDesc";
static NSString * const kResponseDictErrorCode = @"errorCode";
static NSString * const kUnHandledErrorServiceError = @"Something went wrong";

// Keys - Used in Service Request
static NSString * const kUsername = @"username";
static NSString * const kPassword = @"password";

static NSString * const kFullname = @"fullname";
static NSString * const kMobilenumber = @"mobilenumber";

static NSString * const kTextcopies = @"textcopies";
static NSString * const kType = @"type";

static NSString * const kChildcarememid = @"childcarememid";
static NSString * const kChildfirstname = @"childfirstname";
static NSString * const kChildlastname = @"childlastname";
static NSString * const kDob = @"dob";
static NSString * const kChildlinkid = @"childlinkid";
static NSString * const kKidId = @"kidid";


//===============================
static NSString * const kGetconfigurationAPIEndPoint = @"getconfiguration";



#endif /* SPServiceConstants_h */
