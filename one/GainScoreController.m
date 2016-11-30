//
//  GainScoreController.m
//  one
//
//  Created by kobe on 16/11/24.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import "GainScoreController.h"
@interface GainScoreController ()
@property(nonatomic,strong)UIImageView *imageV;
@end
@implementation GainScoreController

- (UIImageView *)imageV{
    if (!_imageV) {
        _imageV = [UIImageView new];
        _imageV.image = [[UIImage imageNamed:@"mainBg"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        _imageV.backgroundColor = [UIColor clearColor];
    }
    return _imageV;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"获得分商品";
    
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
