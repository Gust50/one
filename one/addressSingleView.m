//
//  addressSingleView.m
//  one
//
//  Created by kobe on 16/11/25.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import "addressSingleView.h"

@interface addressSingleView(){
    CGFloat angle;
}
@property(nonatomic,strong)UIView *mainView;
@property(nonatomic,strong)UILabel *mainLabel;
@property(nonatomic,strong)UIButton *triangleBtn;
@property(nonatomic,strong)UILabel *topLine;
@property(nonatomic,strong)UILabel *leftLine;

@end
@implementation addressSingleView
- (UIView *)mainView{
    if (!_mainView) {
        _mainView = [UIView new];
        _mainView.backgroundColor = [UIColor whiteColor];
    }
    return _mainView;
}
- (UILabel *)mainLabel{
    if (!_mainLabel) {
        _mainLabel = [UILabel new];
        _mainLabel.text = @"请选择";
        _mainLabel.font = [UIFont systemFontOfSize:15];
        _mainLabel.textColor = [UIColor colorWithRed:75/255.0 green:75/255.0 blue:75/255.0 alpha:1.0];
        _mainLabel.textAlignment = NSTextAlignmentLeft;
        _mainLabel.backgroundColor = [UIColor whiteColor];
    }
    return _mainLabel;
}
- (UIButton *)triangleBtn{
    if (!_triangleBtn) {
        _triangleBtn = [UIButton new];
        [_triangleBtn setImage:[UIImage imageNamed:@"down_dark"] forState:UIControlStateNormal];
        [_triangleBtn addTarget:self action:@selector(btnAC:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _triangleBtn;
}
- (void)btnAC:(UIButton *)sender{
    int a = angle/M_PI;
    if (a % 2) {
    if (self.delegate && [self.delegate respondsToSelector:@selector(btnAC:)]) {
        [self.delegate btnAC:sender];
                   }
             }
    CGAffineTransform transformOdd = CGAffineTransformMakeRotation(angle);
    sender.transform = transformOdd;
    angle = angle +M_PI;
   
  
//    NSLog(@"%ld",sender.tag);
}
- (UILabel *)topLine{
    if (!_topLine) {
        _topLine = [UILabel new];
        _topLine.backgroundColor = [UIColor colorWithRed:214/255.0 green:214/255.0 blue:214/255.0 alpha:1.0];
    }
    return _topLine;
}
- (UILabel *)leftLine{
    if (!_leftLine) {
        _leftLine = [UILabel new];
        _leftLine.backgroundColor = [UIColor colorWithRed:214/255.0 green:214/255.0 blue:214/255.0 alpha:1.0];
    }
    return _leftLine;
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        angle = M_PI;
        [self initUI];
    }
    return self;
}
- (void)initUI{
    [self addSubview:self.mainView];
    [self.mainView addSubview:self.mainLabel];
    [self.mainView addSubview:self.triangleBtn];
    [self.mainView addSubview:self.topLine];
    [self.mainView addSubview:self.leftLine];
    [self updateConstraints];
}
- (void)updateConstraints{
    [super updateConstraints];
    WS(weakSelf);
    [_mainView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(weakSelf);
    }];
    [_leftLine mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(_mainView);
        make.width.equalTo(@1);
    }];
    [_topLine mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(_mainView);
        make.height.equalTo(@1);
    }];
    [_mainLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_mainView.mas_left).offset(2);
        make.centerY.equalTo(_mainView.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(60, 20));
    }];
    [_triangleBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_mainView.mas_right).offset(-2);
        make.centerY.equalTo(_mainView.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
}
-(void)setInteger:(NSInteger)integer{
    _triangleBtn.tag = integer;
}

@end
