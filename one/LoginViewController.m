//
//  LoginViewController.m
//  one
//
//  Created by kobe on 16/11/23.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UILabel *userLabel;
@property (weak, nonatomic) IBOutlet UILabel *passWord;
@property (weak, nonatomic) IBOutlet UITextField *userTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end

@implementation LoginViewController

- (IBAction)loginBtnAC:(UIButton *)sender {
}
- (IBAction)registerAC:(UIButton *)sender {
    self.hidesBottomBarWhenPushed = YES;
    RegisterViewController *registerVC = [RegisterViewController new];
    [self.navigationController pushViewController:registerVC animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"登录";
    self.view.backgroundColor = [UIColor colorWithRed:247/255.0 green:247/255.0 blue:247/255.0 alpha:1.0];
    [self initUI];
    
}

- (void)initUI{
    self.userLabel.layer.borderWidth = 1;
    self.userLabel.layer.borderColor = [UIColor colorWithRed:236/255.0 green:236/255.0 blue:236/255.0 alpha:1.0].CGColor;
    
    self.passWord.layer.borderWidth = 1;
    self.passWord.layer.borderColor = [UIColor colorWithRed:236/255.0 green:236/255.0 blue:236/255.0 alpha:1.0].CGColor;
    self.loginBtn.layer.cornerRadius = 5;
    
}





@end
