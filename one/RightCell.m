//
//  RightCell.m
//  one
//
//  Created by kobe on 16/11/22.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import "RightCell.h"

@interface RightCell()
@property(nonatomic,strong)UILabel *label;
@end

@implementation RightCell

- (UILabel *)label{
    if (!_label) {
        _label = [UILabel new];
        _label.textAlignment = NSTextAlignmentLeft;
    }
    return _label;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initUI];
    }
    return self;
}
- (void)initUI{
    [self addSubview:self.label];
    [self updateConstraints];
}
- (void)updateConstraints{
    [super updateConstraints];
    WS(weakSelf);
    [_label mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(75);
        make.centerY.equalTo(weakSelf);
        make.size.mas_equalTo(CGSizeMake(120, 20));
    }];
}

- (void)setStr:(NSString *)str{
    _label.text = str;
}
- (void)setIsSelected:(BOOL)isSelected{
    if (isSelected) {
        _label.textColor = [UIColor orangeColor];
    }
    else{
        _label.textColor = [UIColor grayColor];
    }
}
@end
