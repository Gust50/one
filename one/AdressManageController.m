//
//  AdressManageController.m
//  one
//
//  Created by kobe on 16/11/24.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import "AdressManageController.h"
#import "AddViewController.h"
@interface AdressManageController ()
@property(nonatomic,strong)AddViewController *addVC;
@property(nonatomic,strong)UIImageView *imageV;
@end

@implementation AdressManageController
- (UIImageView *)imageV{
    if (!_imageV) {
        _imageV = [UIImageView new];
        _imageV.image = [[UIImage imageNamed:@"mainBg"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        _imageV.backgroundColor = [UIColor clearColor];
    }
    return _imageV;
}
- (AddViewController *)addVC{
    if (!_addVC) {
        _addVC = [AddViewController new];
    }
    return _addVC;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"收货地址管理";
    [self rightItem:@"btnAdd" push:self.addVC];
    [self initUI];
}

- (void)initUI{
    [self.view addSubview:self.imageV];
    [self updateViewConstraints];
}

- (void)updateViewConstraints{
    [super updateViewConstraints];
    WS(weakSelf);
    [_imageV mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(weakSelf.view);
        make.height.width.equalTo(@100);
    }];
}

@end
