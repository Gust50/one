//
//  AddressSelectedView.m
//  one
//
//  Created by kobe on 16/11/25.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import "AddressSelectedView.h"
#import "addressSingleView.h"
@interface AddressSelectedView()<addressSingleViewDelegate>
@property(nonatomic,strong)addressSingleView *addressSingleView1;
@property(nonatomic,strong)addressSingleView *addressSingleView2;
@property(nonatomic,strong)addressSingleView *addressSingleView3;
@property(nonatomic,strong)addressSingleView *addressSingleView4;
@end

@implementation AddressSelectedView
- (addressSingleView *)addressSingleView1{
    if (!_addressSingleView1) {
        _addressSingleView1 = [addressSingleView new];
        _addressSingleView1.integer = 101;
        _addressSingleView1.delegate = self;
    }
    return _addressSingleView1;
}
- (addressSingleView *)addressSingleView2{
    if (!_addressSingleView2) {
        _addressSingleView2 = [addressSingleView new];
        _addressSingleView2.integer = 102;
        _addressSingleView2.delegate = self;
    }
    return _addressSingleView2;
}
- (addressSingleView *)addressSingleView3{
    if (!_addressSingleView3) {
        _addressSingleView3 = [addressSingleView new];
        _addressSingleView3.integer = 103;
        _addressSingleView3.delegate = self;
    }
    return _addressSingleView3;
}
- (addressSingleView *)addressSingleView4{
    if (!_addressSingleView4) {
        _addressSingleView4 = [addressSingleView new];
        _addressSingleView4.integer = 104;
        _addressSingleView4.delegate = self;
    }
    return _addressSingleView4;
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithRed:247/255.0 green:247/255.0 blue:247/255.0 alpha:1.0];
        [self initUI];
    }
    return self;
}
- (void)initUI{
    [self addSubview:self.addressSingleView1];
    [self addSubview:self.addressSingleView2];
    [self addSubview:self.addressSingleView3];
    [self addSubview:self.addressSingleView4];
    [self updateConstraints];
}
- (void)updateConstraints{
    [super updateConstraints];
    [_addressSingleView1 mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(@6);
        make.width.equalTo(@((mainWidth -30)/4));
        make.height.equalTo(@40);
//      make.size.mas_equalTo(CGSizeMake((weakSelf.width - 30)/4, 40));
    }];
    [_addressSingleView2 mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_addressSingleView1.mas_right).offset(6);
        make.width.top.height.equalTo(_addressSingleView1);
    }];
    [_addressSingleView3 mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_addressSingleView2.mas_right).offset(6);
        make.width.top.height.equalTo(_addressSingleView1);
        
    }];
    [_addressSingleView4 mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_addressSingleView3.mas_right).offset(6);
        make.width.top.height.equalTo(_addressSingleView1);
    }];
}
-(void)btnAC:(UIButton *)sender{
    if (self.delegate &&[self.delegate respondsToSelector:@selector(btnAC:)]) {
        [self.delegate btnAC:sender];
    }
}

@end
