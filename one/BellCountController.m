//
//  BellCountController.m
//  one
//
//  Created by kobe on 16/11/24.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import "BellCountController.h"
#import "bellView.h"
@interface BellCountController ()
@property(nonatomic,strong)bellView *bellView;
@end

@implementation BellCountController
- (bellView *)bellView{
    if (!_bellView) {
        _bellView = [bellView new];
    }
    return _bellView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"账单明细";
    [self initUI];
}
- (void)initUI{
    [self.view addSubview:self.bellView];
    [self updateViewConstraints];
}
- (void)updateViewConstraints{
    [super updateViewConstraints];
    WS(weakSelf);
    [_bellView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(weakSelf.view);
    }];
}
@end
