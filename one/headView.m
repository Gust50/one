//
//  headView.m
//  one
//
//  Created by kobe on 16/11/21.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import "headView.h"

@interface headView()
@property(nonatomic,strong)UILabel *headerTimeLabel;
@property(nonatomic,strong)UIButton *btn;
@end

@implementation headView
- (UIButton *)btn{
    if (!_btn ) {
        _btn = [UIButton new];
        [_btn setImage:[UIImage imageNamed:@"DetailArow"] forState:UIControlStateNormal];
    }
    return _btn;
}
- (UILabel *)headerTimeLabel{
    if (!_headerTimeLabel) {
        _headerTimeLabel = [UILabel new];
        
        _headerTimeLabel.text = @"最新揭晓";
        _headerTimeLabel.textAlignment = NSTextAlignmentLeft;
        _headerTimeLabel.textColor = [UIColor blackColor];
        _headerTimeLabel.font = [UIFont systemFontOfSize:19];
    }
    return _headerTimeLabel;
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
//        self.backgroundColor = [UIColor grayColor];
        self.layer.borderWidth = 1;
        self.layer.borderColor = [UIColor grayColor].CGColor;
        [self initUI];
    }
    return self;
}
- (void)initUI{
    [self addSubview:self.headerTimeLabel];
    [self addSubview:self.btn];
    [self updateConstraints];
}
- (void)updateConstraints{
    [super updateConstraints];
    WS(weakSelf);
    [_headerTimeLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.left.equalTo(weakSelf.mas_left).offset(20);
        make.bottom.equalTo(weakSelf.mas_bottom).offset(-3);
        make.width.equalTo(@100);
    }];
    [_btn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.mas_right).offset(-10);
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.bottom.equalTo(weakSelf.mas_bottom).offset(-3);
        make.width.equalTo(@10);
    }];
}
@end
