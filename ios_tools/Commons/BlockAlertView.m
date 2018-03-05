//
//  BlockAlertView.m
//  iTripLog
//
//  Created by Ffine on 2017/9/26.
//  Copyright © 2017年 eSocial LLC. All rights reserved.
//

#import "BlockAlertView.h"
#import <objc/runtime.h>

const char *IC_alertView_Block = "IC_alertView_Block";
const char *IC_actionsheet_Block = "IC_actionsheet_Block";

@interface UIAlertView(ICInfomationView_Runtime)
-(void)setClickBlock:(ClickAtIndexBlock)block;
-(ClickAtIndexBlock)clickBlock;
@end

@implementation UIAlertView(ICInfomationView_Runtime)
-(void)setClickBlock:(ClickAtIndexBlock)block{
    objc_setAssociatedObject(self, IC_alertView_Block, block, OBJC_ASSOCIATION_COPY);
}
-(ClickAtIndexBlock)clickBlock{
    return objc_getAssociatedObject(self, IC_alertView_Block);
}
@end

@interface UIActionSheet(ICBlockAc_Runtime)
-(void)setClickBlock:(ClickAtIndexAcBlock)block;
-(ClickAtIndexAcBlock)clickBlock;
@end

@implementation UIActionSheet(ICBlockAc_Runtime)
-(void)setClickBlock:(ClickAtIndexAcBlock)block{
    objc_setAssociatedObject(self, IC_actionsheet_Block, block, OBJC_ASSOCIATION_COPY);
}
-(ClickAtIndexAcBlock)clickBlock{
    return objc_getAssociatedObject(self, IC_actionsheet_Block);
}
@end


@implementation BlockAlertView

+(UIAlertView *)alertWithTitle:(NSString*)title
                       message:(NSString *)messge
             cancleButtonTitle:(NSString *)cancleButtonTitle
             OtherButtonsArray:(NSArray*)otherButtons
                  clickAtIndex:(ClickAtIndexBlock) clickAtIndex;

{
    UIAlertView  *al = [[UIAlertView alloc] initWithTitle:title message:messge delegate:self cancelButtonTitle:cancleButtonTitle otherButtonTitles: nil];
    al.clickBlock = clickAtIndex;
    for (NSString *otherTitle in otherButtons) {
        [al addButtonWithTitle:otherTitle];
    }
    [al show];
    return al;
}

+(UIAlertView *)alertWithTitle:(NSString*)title
                       message:(NSString *)messge
             cancleButtonTitle:(NSString *)cancleButtonTitle
             OtherButtonsArray:(NSArray*)otherButtons
                    alertStyle:(UIAlertViewStyle)alertStyle
                  clickAtIndex:(ClickAtIndexBlock) clickAtIndex{
    
    UIAlertView  *al = [[UIAlertView alloc] initWithTitle:title message:messge delegate:self cancelButtonTitle:cancleButtonTitle otherButtonTitles: nil];
    al.alertViewStyle = alertStyle;
    al.clickBlock = clickAtIndex;
    for (NSString *otherTitle in otherButtons) {
        [al addButtonWithTitle:otherTitle];
    }
    return al;
}

+(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.clickBlock) {
        
        alertView.clickBlock(buttonIndex,alertView);
    }
}

+(UIActionSheet *)actionSheetWithTitle:(NSString*)title
          cancleButtonTitle:(NSString *)cancleButtonTitle
          OtherButtonsArray:(NSArray*)otherButtons
               clickAtIndex:(ClickAtIndexAcBlock) clickAtIndex{
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:title
                                                       delegate:self
                                              cancelButtonTitle:cancleButtonTitle
                                         destructiveButtonTitle:nil
                                              otherButtonTitles:nil];
    sheet.clickBlock = clickAtIndex;
    for (NSString *otherTitle in otherButtons) {
        [sheet addButtonWithTitle:otherTitle];
    }
    return sheet;
}

+(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (actionSheet.clickBlock) {
        
        actionSheet.clickBlock(buttonIndex,actionSheet);
    }
}

@end
