//
//  BlockAlertView.h
//  iTripLog
//
//  Created by Ffine on 2017/9/26.
//  Copyright © 2017年 eSocial LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef void (^ClickAtIndexBlock)(NSInteger buttonIndex,UIAlertView *alert);
typedef void (^ClickAtIndexAcBlock)(NSInteger buttonIndex,UIActionSheet *alert);
@interface BlockAlertView : NSObject <UIAlertViewDelegate,UIActionSheetDelegate>
+(UIAlertView *)alertWithTitle:(NSString*)title
                       message:(NSString *)messge
             cancleButtonTitle:(NSString *)cancleButtonTitle
             OtherButtonsArray:(NSArray*)otherButtons
                  clickAtIndex:(ClickAtIndexBlock) clickAtIndex;

+(UIAlertView *)alertWithTitle:(NSString*)title
                       message:(NSString *)messge
             cancleButtonTitle:(NSString *)cancleButtonTitle
             OtherButtonsArray:(NSArray*)otherButtons
                    alertStyle:(UIAlertViewStyle)alertStyle
                  clickAtIndex:(ClickAtIndexBlock) clickAtIndex;

+(UIActionSheet *)actionSheetWithTitle:(NSString*)title
                     cancleButtonTitle:(NSString *)cancleButtonTitle
                     OtherButtonsArray:(NSArray*)otherButtons
                          clickAtIndex:(ClickAtIndexAcBlock) clickAtIndex;
@end
