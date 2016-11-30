//
//  classifyCell.m
//  one
//
//  Created by kobe on 16/11/21.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import "classifyCell.h"

@interface classifyCell()
@property(nonatomic,strong)UIImageView *leftImage;
@property(nonatomic,strong)UILabel *label;

@end
@implementation classifyCell

- (UIImageView *)leftImage{
    if (!_leftImage) {
        _leftImage = [UIImageView new];
        _leftImage.image = [UIImage imageNamed:@"sort0_normal"];
        if (self.isSelected) {
           _leftImage.image = [UIImage imageNamed:@"sort0_checked"];
        }
    }
    _leftImage.layer.cornerRadius = 10;
    return _leftImage;
}
- (UILabel *)label{
    if (!_label) {
        _label = [UILabel new];
        _label.text = @"全部分类";
        _label.textColor = [UIColor grayColor];
        if (self.isSelected) {
            _label.textColor = [UIColor orangeColor];
        }
    }
    return _label;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initUI];
    }
    return self;
}
- (void)initUI{
    [self addSubview:self.leftImage];
    [self addSubview:self.label];

    [self updateConstraints];
}
- (void)updateConstraints{
    [super updateConstraints];
    WS(weakSelf);
    [_leftImage mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.left.equalTo(@15);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    [_label mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_leftImage.mas_right).offset(60);
        make.centerY.equalTo(weakSelf);
        make.size.mas_equalTo(CGSizeMake(80, 20));
    }];
    
}
- (void)setIsSelected:(BOOL)isSelected{
    _isSelected = isSelected;
    if (_isSelected) {
        _label.textColor = [UIColor orangeColor];
    }
    else{
       _label.textColor = [UIColor grayColor];
    }
}
- (void)setStr:(NSString *)str{
    _label.text = str;
}
- (void)setImageStr:(NSString *)imageStr{
    _leftImage.image = [UIImage imageNamed:imageStr];
}
@end
