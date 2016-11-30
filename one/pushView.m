//
//  pushView.m
//  one
//
//  Created by kobe on 16/11/21.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import "pushView.h"

@interface pushView()
@property(nonatomic,strong)UIView *leftView;
@property(nonatomic,strong)UIView *rightView;
@property(nonatomic,strong)UIView *line;
@property(nonatomic,strong)UIButton *leftBtn;
@property(nonatomic,strong)UILabel *leftLabel;
@property(nonatomic,strong)UIButton *rightBtn;
@property(nonatomic,strong)UILabel *rightLabel;
@end

@implementation pushView

- (UIView *)leftView{
    if (!_leftView) {
        _leftView = [UIView new];
    }
    return _leftView;
}

- (UIView *)rightView{
    if (!_rightView) {
        _rightView = [UIView new];
    }
    return _rightView;
}
- (UIView *)line{
    if (!_line) {
        _line = [UIView new];
        _line.backgroundColor = [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1.0];
    }
    return _line;
}
- (UIButton *)leftBtn{
    if (!_leftBtn) {
        _leftBtn = [UIButton new];
        [_leftBtn setImage:[UIImage imageNamed:@"down"] forState:UIControlStateNormal];
        [_leftBtn addTarget:self action:@selector(leftBtnAC) forControlEvents:UIControlEventTouchUpInside];
    }
    return _leftBtn;
}
- (void)leftBtnAC{
    if (self.delegate && [self.delegate respondsToSelector:@selector(leftBtnAC)]) {
        [self.delegate leftBtnAC];
    }
}
- (UILabel *)leftLabel{
    if (!_leftLabel) {
        _leftLabel = [UILabel new];
        _leftLabel.text = @"全部分类";
        _leftLabel.textAlignment = NSTextAlignmentCenter;
        _leftLabel.textColor = [UIColor grayColor];
    }
    return _leftLabel;
}
- (UIButton *)rightBtn{
    if (!_rightBtn) {
        _rightBtn = [UIButton new];
        [_rightBtn setImage:[UIImage imageNamed:@"down"] forState:UIControlStateNormal];
        [_rightBtn addTarget:self action:@selector(rightBtnAC) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightBtn;
}
- (void)rightBtnAC{
    if (self.delegate && [self.delegate respondsToSelector:@selector(rightBtnAC)]) {
        [self.delegate rightBtnAC];
    }
}
- (UILabel *)rightLabel{
    if (!_rightLabel) {
        _rightLabel = [UILabel new];
        _rightLabel.text = @"即将揭晓";
        _rightLabel.textAlignment = NSTextAlignmentCenter;
        _rightLabel.textColor = [UIColor grayColor];
    }
    return _rightLabel;
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initUI];
    }
    return self;
}
- (void)initUI{
    [self addSubview:self.leftView];
    [self addSubview:self.rightView];
    [self.leftView addSubview:self.leftBtn];
    [self.leftView addSubview:self.leftLabel];
    [self.rightView addSubview:self.rightBtn];
    [self.rightView addSubview:self.rightLabel];
    [self addSubview:self.line];
    [self updateConstraints];
}
- (void)updateConstraints{
    [super updateConstraints];
    WS(weakSelf);
    [_leftView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(weakSelf);
        make.right.equalTo(weakSelf.mas_centerX).offset(-1);
    }];
    [_rightView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.top.bottom.equalTo(weakSelf);
        make.left.equalTo(weakSelf.mas_centerX).offset(1);
    }];
    [_line mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(weakSelf);
        make.centerX.equalTo(weakSelf.mas_centerX);
        make.width.equalTo(@1);
    }];
    [_leftLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(_leftView);
        make.size.mas_equalTo(CGSizeMake(80, 40));
    }];
    [_leftBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.right.equalTo(_leftLabel.mas_left).offset(-5);
        make.size.mas_equalTo(CGSizeMake(25, 25));
    }];
    [_rightLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(_rightView);
        make.size.mas_equalTo(CGSizeMake(120, 40));
    }];
    [_rightBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.right.equalTo(_rightLabel.mas_left).offset(5);
        make.size.mas_equalTo(CGSizeMake(25, 25));
    }];
}
- (void)setLeftStr:(NSString *)leftStr{
    _leftLabel.text = leftStr;
}
- (void)setRightStr:(NSString *)rightStr{
    _rightLabel.text = rightStr;
}
@end
