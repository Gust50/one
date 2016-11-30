//
//  AddViewController.m
//  one
//
//  Created by kobe on 16/11/24.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import "AddViewController.h"
#import "AddressSelectedView.h"
@interface AddViewController ()<AddressSelectedViewDelegate>
@property(nonatomic,strong)AddressSelectedView *addressSelectedView;
@property(nonatomic,strong)UITextField *addressTextField;
@property(nonatomic,strong)UITextField *recepterTextField;
@property(nonatomic,strong)UITextField *numberTextField;
@property(nonatomic,strong)UIButton *commitBtn;
@end

@implementation AddViewController
- (AddressSelectedView *)addressSelectedView{
    if (!_addressSelectedView) {
        _addressSelectedView = [AddressSelectedView new];
        _addressSelectedView.delegate = self;
        
    }
    return _addressSelectedView;
}
- (UITextField *)addressTextField{
    if (!_addressTextField) {
        _addressTextField = [UITextField new];
        _addressTextField.layer.cornerRadius = 5;
        _addressTextField.backgroundColor = [UIColor whiteColor];
        _addressTextField.placeholder = @"请输入详细收货地址";
    }
    return _addressTextField;
}
- (UITextField *)recepterTextField{
    if (!_recepterTextField) {
        _recepterTextField = [UITextField new];
        _recepterTextField.layer.cornerRadius = 3;
        _recepterTextField.backgroundColor = [UIColor whiteColor];
        _recepterTextField.placeholder = @"请输入收货人";
    }
    return _recepterTextField;
}
- (UITextField *)numberTextField{
    if (!_numberTextField) {
        _numberTextField = [UITextField new];
        _numberTextField.layer.cornerRadius = 5;
        _numberTextField.backgroundColor = [UIColor whiteColor];
        _numberTextField.placeholder = @"请输入收货手机号";
        _numberTextField.keyboardType = UIKeyboardTypeNumberPad;
    }
    return _numberTextField;
}
- (UIButton *)commitBtn{
    if (!_commitBtn) {
        _commitBtn = [UIButton new];
        [_commitBtn setTitle:@"提交" forState:UIControlStateNormal];
        [_commitBtn setTintColor:[UIColor whiteColor]];
        [_commitBtn setBackgroundColor:[UIColor colorWithRed:255/255.0 green:91/255.0 blue:1/255.0 alpha:1.0]];
        _commitBtn.layer.cornerRadius = 5;
        [_commitBtn addTarget:self action:@selector(btnAC) forControlEvents:UIControlEventTouchUpInside];
    }
    return _commitBtn;
}
- (void)btnAC{
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"新增地址";
    self.view.backgroundColor = [UIColor colorWithRed:247/255.0 green:247/255.0 blue:247/255.0 alpha:1.0];
    [self initUI];
}
- (void)initUI{
    [self.view addSubview:self.addressSelectedView];
    [self.view addSubview:self.addressTextField];
    [self.view addSubview:self.recepterTextField];
    [self.view addSubview:self.numberTextField];
    [self.view addSubview:self.commitBtn];
    [self updateViewConstraints];
}
- (void)updateViewConstraints{
    [super updateViewConstraints];
    WS(weakSelf);
    [_addressSelectedView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(weakSelf.view);
        make.height.equalTo(@50);
    }];
    [_addressTextField mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_addressSelectedView).offset(6);
        make.top.equalTo(_addressSelectedView.mas_bottom).offset(10);
        make.right.equalTo(_addressSelectedView.mas_right).offset(-6);
        make.height.equalTo(@50);
    }];
    [_recepterTextField mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.height.equalTo(_addressTextField);
        make.top.equalTo(_addressTextField.mas_bottom).offset(10);
        make.right.equalTo(weakSelf.view.mas_centerX).offset(-6);
    }];
    [_numberTextField mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.height.equalTo(_recepterTextField);
        make.left.equalTo(weakSelf.view.mas_centerX).offset(6);
        make.right.equalTo(_addressTextField.mas_right);
    }];
    [_commitBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.height.equalTo(_addressTextField);
        make.top.equalTo(_recepterTextField.mas_bottom).offset(10);
    }];
}
- (void)btnAC:(UIButton *)sender{
    NSLog(@"%ld",sender.tag);
//    -(NSArray *)dataSoure{
//        if (!_dataSoure) {
//            NSString *docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
//            NSString *filePath = [docPath stringByAppendingPathComponent:@"area.plist"];
//            _dataSoure=[[NSArray array]initWithContentsOfFile:filePath];
//        }
//        return _dataSoure;
//    }
    
}

@end
