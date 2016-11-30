//
//  bellView.m
//  one
//
//  Created by kobe on 16/11/25.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import "bellView.h"

@interface bellView()
@property(nonatomic,strong)UISegmentedControl *segmentV;
@property(nonatomic,strong)UILabel *bellLabel;
@property(nonatomic,strong)UIView *showView;
@property(nonatomic,strong)UILabel *bellTime;
@property(nonatomic,strong)UILabel *way;
@property(nonatomic,strong)UILabel *money;
@end

@implementation bellView
- (UISegmentedControl *)segmentV{
    if (!_segmentV) {
        _segmentV = [[UISegmentedControl alloc] initWithItems:@[@"充值明细",@"消费明细"]];
        _segmentV.selectedSegmentIndex = 0;
        _segmentV.tintColor =[UIColor colorWithRed:251/256.0 green:105/256.0 blue:1/256.0 alpha:1.0];
    }
    return _segmentV;
}
- (UILabel *)bellLabel{
    if (!_bellLabel) {
        _bellLabel = [UILabel new];
        _bellLabel.text = @"总充值金额:¥0.00";
        _bellLabel.textColor = [UIColor colorWithRed:168/255.0 green:168/255.0 blue:168/255.0 alpha:1.0];
        _bellLabel.font = [UIFont systemFontOfSize:12];
        _bellLabel.textAlignment = NSTextAlignmentCenter;
        _bellLabel.layer.borderColor = [UIColor colorWithRed:232/255.0 green:232/255.0 blue:232/255.0 alpha:1.0].CGColor;
        _bellLabel.layer.borderWidth = 1;
    }
    return _bellLabel;
}
- (UIView *)showView{
    if (!_showView) {
        _showView = [UIView new];
        _showView.backgroundColor = [UIColor whiteColor];
        _showView.layer.borderWidth = 1;
        _showView.layer.borderColor = [UIColor colorWithRed:232/255.0 green:232/255.0 blue:232/255.0 alpha:1.0].CGColor;
    }
    return _showView;
}
- (UILabel *)bellTime{
    if (!_bellTime) {
        _bellTime = [UILabel new];
        _bellTime.text = @"充值时间";
        _bellTime.textColor = [UIColor colorWithRed:168/255.0 green:168/255.0 blue:168/255.0 alpha:1.0];
        _bellTime.font = [UIFont systemFontOfSize:14];
        _bellTime.textAlignment = NSTextAlignmentLeft;
    }
    return _bellTime;
}
- (UILabel *)way{
    if (!_way) {
        _way = [UILabel new];
        _way.text = @"资金渠道";
        _way.textColor = [UIColor colorWithRed:168/255.0 green:168/255.0 blue:168/255.0 alpha:1.0];
        _way.font = [UIFont systemFontOfSize:14];
        _way.textAlignment = NSTextAlignmentCenter;
    }
    return _way;
}
- (UILabel *)money{
    if (!_money) {
        _money = [UILabel new];
        _money.text = @"充值贡献";
        _money.textColor = [UIColor colorWithRed:168/255.0 green:168/255.0 blue:168/255.0 alpha:1.0];
        _money.font = [UIFont systemFontOfSize:14];
        _money.textAlignment = NSTextAlignmentRight;
    }
    return _money;
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithRed:247/255.0 green:247/255.0 blue:247/255.0 alpha:1.0];
        
        [self initUI];
    }
    return self;
}
- (void)initUI{
    [self addSubview:self.segmentV];
    [self addSubview:self.bellLabel];
    [self addSubview:self.showView];
    [self.showView addSubview:self.bellTime];
    [self.showView addSubview:self.way];
    [self.showView addSubview:self.money];
    [self updateConstraints];
}
- (void)updateConstraints{
    [super updateConstraints];
    WS(weakSelf);
    [_segmentV mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(30);
        make.right.equalTo(weakSelf.mas_right).offset(-30);
        make.top.equalTo(weakSelf.mas_top).offset(8);
        make.height.equalTo(@32);
    }];
    [_bellLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf).offset(-2);
        make.right.equalTo(weakSelf).offset(2);
        make.top.equalTo(_segmentV.mas_bottom).offset(8);
        make.height.equalTo(@40);
    }];
    [_showView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(_bellLabel);
        make.top.equalTo(_bellLabel.mas_bottom).offset(-1);
        make.height.equalTo(@45);
    }];
    [_bellTime mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_showView.mas_left).offset(10);
        make.centerY.equalTo(_showView.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(80, 20));
    }];
    [_way mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_showView.mas_centerX);
        make.centerY.equalTo(_showView.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(80, 20));
    }];
    [_money mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_showView.mas_right).offset(-10);
        make.centerY.equalTo(_showView.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(80, 20));
    }];
}

@end
