//
//  ZPOneViewController.m
//  逆传方式
//
//  Created by apple on 16/7/4.
//  Copyright © 2016年 apple. All rights reserved.
//

/**
 两个类之间的逆传传值主要有以下的三种方式：
 1、利用代理设计模式逆传数据；
 2、利用block回调的方式逆传数据；
 3、利用通知的方式逆传数据。
 */
#import "ZPOneViewController.h"
#import "ZPTwoViewController.h"
#import "ZPStudent.h"

@interface ZPOneViewController () <ZPTwoViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *sexLabel;
@property (weak, nonatomic) IBOutlet UILabel *ageLabel;

@end

@implementation ZPOneViewController

#pragma mark ————— 生命周期 —————
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark ————— segue方法 —————
/**
 在storyboard文件中不管是自动型的还是手动型的segue在页面跳转之前系统都会自动调用这个方法，一般在这个方法里完成数据在不同视图控制器之间的顺传或者逆传。
 */
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ZPTwoViewController *twoViewController = segue.destinationViewController;
    
    //让本类接受代理协议
    twoViewController.delegate = self;
}

#pragma mark ————— ZPTwoViewControllerDelegate —————
/**
 利用代理设计模式逆传数据：在其他类中调用代理方法的时候把需要逆传的数据作为代理方法的一个参数传递给本类，这样在本类中实现这个代理方法的时候就可以拿到这个逆传过来的数据了；
 这个方法中的student参数就是其他类逆传过来的数据。
 */
-(void)twoViewController:(ZPTwoViewController *)twoViewController didAddStudent:(ZPStudent *)student
{
    self.nameLabel.text = student.name;
    self.sexLabel.text = student.sex;
    self.ageLabel.text = student.age;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
