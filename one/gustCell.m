//
//  gustCell.m
//  one
//
//  Created by kobe on 16/11/22.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import "gustCell.h"

@interface gustCell()
@property(nonatomic,strong)UISwitch *slider;
@property(nonatomic,strong)UILabel *label;
@end

@implementation gustCell
- (UILabel *)label{
    if (!_label) {
        _label = [UILabel new];
        _label.text = @"2G/3G/4G网络开启无图模式";
        _label.textColor = [UIColor colorWithRed:135/255.0 green:135/255.0 blue:135/255.0 alpha:1.0];
        _label.textAlignment = NSTextAlignmentLeft;
    }
    return _label;
}
- (UISwitch *)slider{
    if (!_slider) {
        _slider = [UISwitch new];
        _slider.layer.cornerRadius = 10;
    }
    return _slider;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initUI];
    }
    return self;
}
- (void)initUI{
    [self addSubview:self.label];
     [self addSubview:self.slider];
    [self updateConstraints];
}
- (void)updateConstraints{
    [super updateConstraints];
    WS(weakSelf);
   
    [_label mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(20);
        make.centerY.equalTo(weakSelf);
        make.size.mas_equalTo(CGSizeMake(220, 20));
    }];
     [_slider mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.right.equalTo(@-20);
        make.size.mas_equalTo(CGSizeMake(40, 30));
    }];
}

-(void)setIsOpen:(BOOL)isOpen{
    [self.slider setSelected:isOpen];
}
@end
