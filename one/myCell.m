//
//  myCell.m
//  one
//
//  Created by kobe on 16/11/22.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import "myCell.h"

@interface myCell()
@property(nonatomic,strong)UIImageView *imageV;
@property(nonatomic,strong)UILabel *label;
@end

@implementation myCell
- (UIImageView *)imageV{
    if (!_imageV) {
        _imageV = [UIImageView new];
        _imageV.image = [UIImage imageNamed:@"home_btn_show"];
        
    }
    return _imageV;
}
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
    
    [self addSubview:self.imageV];
    [self addSubview:self.label];
    [self updateConstraints];
}
- (void)updateConstraints{
    [super updateConstraints];
    WS(weakSelf);
    [_imageV mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(10);
        make.centerY.equalTo(weakSelf);
        make.size.mas_equalTo(CGSizeMake(30, 30));
        
    }];
    [_label mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_imageV.mas_right).offset(15);
        make.centerY.equalTo(weakSelf);
        make.size.mas_equalTo(CGSizeMake(120, 20));
    }];
    
}
- (void)setStr:(NSString *)str{
    _label.text = str;
}
- (void)setImageStr:(NSString *)imageStr{
    _imageV.image = [UIImage imageNamed:imageStr];
}

@end
