//
//  MyCloudController.m
//  one
//
//  Created by kobe on 16/11/24.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import "MyCloudController.h"
#import "segementView.h"
@interface MyCloudController ()
@property(nonatomic,strong)segementView *segmentV;
@end

@implementation MyCloudController
- (segementView *)segmentV{
    if (!_segmentV) {
        _segmentV = [segementView new];
    }
    return _segmentV;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的云购记录";
    [self initUI];
}
- (void)initUI{
    [self.view addSubview:self.segmentV];
    [self updateViewConstraints];
}
- (void)updateViewConstraints{
    [super updateViewConstraints];
    WS(weakSelf);
    [_segmentV mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(weakSelf.view);
        make.height.equalTo(@40);
    }];
    
}




@end
