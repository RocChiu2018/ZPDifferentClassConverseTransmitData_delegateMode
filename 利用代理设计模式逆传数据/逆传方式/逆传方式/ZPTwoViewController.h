//
//  ZPTwoViewController.h
//  逆传方式
//
//  Created by apple on 16/7/4.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZPTwoViewController, ZPStudent;

@protocol ZPTwoViewControllerDelegate <NSObject>

@optional

-(void)twoViewController:(ZPTwoViewController *)twoViewController didAddStudent:(ZPStudent *)student;

@end

@interface ZPTwoViewController : UIViewController

@property (nonatomic, weak) id <ZPTwoViewControllerDelegate> delegate;

@end
