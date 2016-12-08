//
//  ViewController.m
//  ManageServices
//
//  Created by Cognizant MSP on 25/08/16.
//  Copyright © 2016 INNO IT. All rights reserved.
//

#import "ViewController.h"
#import "LoginModel.h"
#import "CMSTextCopiesManager.h"

//=========

#import "SPDataManager.h"

#import "SPChilddiapersDetailsTest.h"
#import "SPChilddiaperRoomDetailsTest.h"
#import "SPChildDiapersTest.h"


//==========
@interface ViewController ()

@property (nonatomic, strong) LoginModel *loginModel;
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (nonatomic, strong) SPChilddiapersDetailsTest *childDiaperDetails;


- (IBAction)loginAction:(id)sender;
- (IBAction)inspectDBAction:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.loginModel = [[LoginModel alloc] init];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginAction:(id)sender {
    
   // [self getChildAttedanceDetails];
    
   // [self getChildDiaperDetails];
    
    [self updateChildCareUserProfile];
    
    
   /* [self.loginModel peformLogin:self.usernameTextField.text withPassword:self.passwordTextField.text withSuccessBlock:^(NSString *description, BOOL status) {
        dispatch_async(dispatch_get_main_queue(), ^{
            UIAlertController * alert=   [UIAlertController
                                          alertControllerWithTitle:@"Login Status"
                                          message:description
                                          preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
                [self.loginModel registerNewParent:@"testUser1216" withPassword:@"test" withFullName:@"Test 1216" withMobileNumber:@"1234567890" withSuccessBlock:^(NSURLSessionTask *task, NSDictionary *responseObject) {
                    NSLog(@"Success:   %@",responseObject);
                } withfailureBlock:^(NSURLSessionTask *operation, NSError *error) {
                    NSLog(@"ERROR:   %@",error.description);
                }];
            }];
            [alert addAction:cancelAction];
            [self presentViewController:alert animated:YES completion:nil];
        });
    } withFailureBlock:^(NSString *description, NSInteger statusCode) {
        dispatch_async(dispatch_get_main_queue(), ^{
            UIAlertController * alert=   [UIAlertController
                                          alertControllerWithTitle:@"Login Status"
                                          message:description
                                          preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) { }];
            [alert addAction:cancelAction];
            [self presentViewController:alert animated:YES completion:nil];
        });
    }];*/
    
}


#pragma  mark ======= SERVICE CALL METHODS ===================

-(void)getChildAttedanceDetails {
    // childcare id need to pass
    // Now hardcoded
    [[SPDataManager sharedManager] getChildAttendanceWithChildCareId:@"" successBlock:^(NSArray *childAttendanceList) {
        
        NSString *loginDate =[childAttendanceList objectAtIndex:0];
        
        DLog(@"childList Messagecount ==== %lu",(unsigned long)[childAttendanceList count]);
        DLog(@"childList  Message description ==== %@",[childAttendanceList description]);
    } withfailureBlock:^(NSString *errorTitle, NSString *errorDescription) {
        
    }];
    
}

- (void)getChildDiaperDetails {
    
    [[SPDataManager sharedManager] getChildDiaperDetailswithchildCareID:@"" withsuccessBlock:^(SPChilddiapersDetailsTest *childDiaperDetails) {
        self.childDiaperDetails = childDiaperDetails;
        SPChilddiaperRoomDetailsTest *diaperRoomList =[self.childDiaperDetails.diaperRooms objectAtIndex:0];
        
        DLog( @"diaperRoomList logindate==== %@",diaperRoomList.loginDate);
        
        DLog( @"diaperRoomList diapersArray==== %@",diaperRoomList.diapersArray);

        DLog( @"diaperRoomList count==== %lu",(unsigned long)[self.childDiaperDetails.diaperRooms count]);
        DLog( @"diaperRoomList diapersArray count==== %lu",(unsigned long)[diaperRoomList.diapersArray count]);
        
    } withfailureBlock:^(NSString *errorTitle, NSString *errorDescription) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            //            [SVProgressHUD dismiss];
             });
    }];
    
}

- (void)updateChildCareUserProfile {
    
     NSString  *name = @"Test";
     NSString  *emailed = @"test@gmail.com";
     NSString  *phone = @"3214569870";
     NSString  *gender = @"male";
     NSString  *modifiedby = @"RAJESH";
 
    [[SPDataManager sharedManager] PostChildCareUserProfileUpdate:name withEmailID:emailed withPhone:phone withGender:gender withModifiedBy:modifiedby withsuccessBlock:^(NSString *msgDescription, BOOL status) {
        DLog(@"status ==== %d",status)
        DLog("msgDescription  === %@",msgDescription);
        
    } withFailueBlock:^(NSString *msgtitle, NSString *msgDescription, NSInteger statusCode) {
        
    }];
}
- (IBAction)inspectDBAction:(id)sender {
  [self.loginModel showDBData];
//    NSLog(@"\n\n CMS Key: PARENT_LOGIN_INVALID_CREDENTIALS_DESC \n CMS Value: %@",[[CMSTextCopiesManager sharedManager] CMSValueForKey:@"PARENT_LOGIN_INVALID_CREDENTIALS_DESC"]);
//    NSLog(@"\n\n CMS Key: PARENT_LOGIN_INVALID_CREDENTIALS_INV \n CMS Value: %@",[[CMSTextCopiesManager sharedManager] CMSValueForKey:@"PARENT_LOGIN_INVALID_CREDENTIALS_INV"]);
    
}
@end
