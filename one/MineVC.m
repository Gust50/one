//
//  MineVC.m
//  one
//
//  Created by kobe on 16/11/16.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import "MineVC.h"
#import "SetUpController.h"
#import "myCell.h"
#import "LoginViewController.h"
#import "MyCloudController.h"
#import "GainScoreController.h"
#import "MyBellController.h"
#import "BellCountController.h"
#import "AdressManageController.h"
@interface MineVC ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UIButton *rightButton;
@property(nonatomic,strong)UIView *topView;
@property(nonatomic,strong)UILabel *label;
@property(nonatomic,strong)UIButton *loginBtn;
@property(nonatomic,strong)NSArray *iconArray;
@property(nonatomic,strong)NSArray *nameArray;
@property(nonatomic,strong)UITableView *tableView;
@end
static NSString *const cellID = @"cellID";
@implementation MineVC

- (UIButton *)rightButton{
        if (!_rightButton) {
            _rightButton = [UIButton buttonWithType:0];
            _rightButton.frame = CGRectMake(0, 0, 20, 20);
            [_rightButton setImage:[UIImage imageNamed:@"setting_down"] forState:UIControlStateNormal];
            [_rightButton addTarget:self action:@selector(btnAC) forControlEvents:UIControlEventTouchUpInside];
        }
        return _rightButton;
}
- (void)btnAC{
    SetUpController *setUpVC = [SetUpController new];
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:setUpVC animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}

- (UIView *)topView{
    if (!_topView) {
        _topView = [UIView new];
    }
    return _topView;
}
- (UILabel *)label{
    if (!_label) {
        _label = [UILabel new];
        _label.text = @"欢迎来到1元云购";
        _label.font = [UIFont systemFontOfSize:15];
        _label.textColor = [UIColor colorWithRed:116/255.0 green:116/255.0 blue:116/255.0 alpha:1.0];
        _label.textAlignment = NSTextAlignmentCenter;
    }
    return _label;
}
- (UIButton *)loginBtn{
    if (!_loginBtn) {
        _loginBtn = [UIButton new];
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        [_loginBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        [_loginBtn addTarget:self action:@selector(loginAC) forControlEvents:UIControlEventTouchUpInside];
        _loginBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        _loginBtn.backgroundColor = [UIColor whiteColor];
    }
    return _loginBtn;
}
- (void)loginAC{
    LoginViewController *loginVC = [LoginViewController new];
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:loginVC animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}
- (NSArray *)iconArray{
    if (!_iconArray) {
        _iconArray = [NSArray arrayWithObjects:@"me1",@"me2",@"me3",@"me6",@"me7", nil];
    }
    return _iconArray;
}
- (NSArray *)nameArray{
    if (!_nameArray) {
        _nameArray = [NSArray arrayWithObjects:@"我的云购记录",@"获得分商品",@"我的账单",@"账户明细",@"收货地址管理", nil];
    }
    return _nameArray;
}
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [UITableView new];
       _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        UIView *view = [UIView new];
        view.backgroundColor = [UIColor colorWithRed:247/255.0 green:247/255.0 blue:247/255.0 alpha:1.0];
        _tableView.tableFooterView = view;
        [_tableView setScrollEnabled:NO];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;

    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的云购";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.rightButton];
    self.view.backgroundColor = [UIColor colorWithRed:247/255.0 green:247/255.0 blue:247/255.0 alpha:1.0];
    [self initUI];
    
}
- (void)initUI{
    [self.view addSubview:self.topView];
    [self.topView addSubview:self.label];
    [self.topView addSubview:self.loginBtn];
    [self.view addSubview:self.tableView];
    
    [self updateViewConstraints];
    [_tableView registerClass:[myCell class] forCellReuseIdentifier:cellID];
}
- (void)updateViewConstraints{
    [super updateViewConstraints];
    WS(weakSelf);
    [_topView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(weakSelf.view);
        make.height.equalTo(@120);
    }];
    
    [_label mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.view);
        make.bottom.equalTo(_topView.mas_centerY).offset(-10);
        make.size.mas_equalTo(CGSizeMake(120, 20));
    }];
    [_loginBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_topView.mas_centerY);
        make.centerX.equalTo(weakSelf.view);
        make.size.mas_equalTo(CGSizeMake(160, 40));
    }];
    [_tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(weakSelf.view);
        make.top.equalTo(_topView.mas_bottom);
        make.height.equalTo(@200);
    }];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    myCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.imageStr = self.iconArray[indexPath.row];
    cell.str = self.nameArray[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.row) {
        case 0:{
            MyCloudController *myCloundVC = [MyCloudController new];
            [self push:myCloundVC];
            
            break;
        }
        case 1:{
            GainScoreController *gainScoreVC = [GainScoreController new];
            [self push:gainScoreVC];
            break;
        }
        case 2:{
            MyBellController *myBellVC = [MyBellController new];
            [self push:myBellVC];
            break;
        }
        case 3:{
            BellCountController *bellCountVC = [BellCountController new];
            [self push:bellCountVC];
            break;
        }
        case 4:{
            AdressManageController *addressManageVC = [AdressManageController new];
            [self push:addressManageVC];
            break;
        }
            
        default:
            break;
    }
    
}
- (void)push:(UIViewController *)viewController{
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:viewController animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}
@end
