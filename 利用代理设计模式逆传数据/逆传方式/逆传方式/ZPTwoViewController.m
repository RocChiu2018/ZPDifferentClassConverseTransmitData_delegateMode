//
//  ZPTwoViewController.m
//  逆传方式
//
//  Created by apple on 16/7/4.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ZPTwoViewController.h"
#import "ZPStudent.h"

@interface ZPTwoViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *sexTextField;
@property (weak, nonatomic) IBOutlet UITextField *ageTextField;

@end

@implementation ZPTwoViewController

#pragma mark ————— 生命周期 —————
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark ————— 点击添加按钮 —————
- (IBAction)clickAddButton:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
    
    //首先要确定遵循协议的那个类是否已经实现了协议里面的代理方法
    if ([self.delegate respondsToSelector:@selector(twoViewController:didAddStudent:)])
    {
        ZPStudent *student = [[ZPStudent alloc] init];
        student.name = self.nameTextField.text;
        student.sex = self.sexTextField.text;
        student.age = self.ageTextField.text;
        
        //把要逆传的数据(student)作为代理方法的一个参数逆传过去
        [self.delegate twoViewController:self didAddStudent:student];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
