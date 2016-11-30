//
//  RegisterViewController.m
//  one
//
//  Created by kobe on 16/11/24.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()
@property(nonatomic,strong)UITextField *textField;
@property(nonatomic,strong)UIButton *btn;
@end

@implementation RegisterViewController
- (UITextField *)textField{
    if (!_textField) {
        _textField = [UITextField new];
        UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectMake(20, 5, 30, 30)];
        icon.image = [UIImage imageNamed:@"sort100_normal"];
        _textField.leftView = icon;
        _textField.leftViewMode = UITextFieldViewModeAlways;
//        _textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        _textField.placeholder = @"请输入您的手机号";
        _textField.keyboardType = UIKeyboardTypeNumberPad;
//        UIKeyboardTypeDefault,                
//        UIKeyboardTypeASCIICapable,
//        UIKeyboardTypeNumbersAndPunctuation,
//        UIKeyboardTypeURL,
//        UIKeyboardTypeNumberPad,
//        UIKeyboardTypePhonePad,
//        UIKeyboardTypeNamePhonePad,
//        UIKeyboardTypeEmailAddress,
//        UIKeyboardTypeTwitter NS_ENUM_AVAILABLE_IOS(5_0),
//        UIKeyboardTypeWebSearch NS_ENUM_AVAILABLE_IOS(7_0),
//        UIKeyboardTypeASCIICapableNumberPad
        _textField.backgroundColor = [UIColor whiteColor];
        _textField.clearButtonMode = UITextFieldViewModeUnlessEditing;
    }
    return _textField;
}
- (UIButton *)btn{
    if (!_btn) {
        _btn = [UIButton new];
        _btn.backgroundColor = [UIColor colorWithRed:255/255.0 green:91/255.0 blue:1/255.0 alpha:1.0];
        [_btn setTitle:@"下一步" forState:UIControlStateNormal];
        _btn.titleLabel.textAlignment = NSTextAlignmentCenter;
        _btn.layer.cornerRadius = 5;
        _btn.titleLabel.font = [UIFont systemFontOfSize:18];
    }
    return _btn;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"注册";
    self.view.backgroundColor = [UIColor colorWithRed:247/255.0 green:247/255.0 blue:247/255.0 alpha:1.0];
    [self initUI];
}

- (void)initUI{
    [self.view addSubview:self.textField];
    [self.view addSubview:self.btn];
    [self updateViewConstraints];
}
- (void)updateViewConstraints{
    [super updateViewConstraints];
    WS(weakSelf);
    [_textField mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(@15);
        make.right.equalTo(weakSelf.view.mas_right).offset(-10);
        make.height.equalTo(@45);
    }];
    [_btn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.height.equalTo(_textField);
        make.top.equalTo(_textField.mas_bottom).offset(20);
    }];
    
}



@end
