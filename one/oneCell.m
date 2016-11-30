//
//  oneCell.m
//  one
//
//  Created by kobe on 16/11/18.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import "oneCell.h"

@interface oneCell()
@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,strong)UILabel *label;
@end

@implementation oneCell
- (UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [UIImageView new];
        _imageView.image = [UIImage imageNamed:@""];
    }
    return _imageView;
}
- (UILabel *)label{
    if (!_label) {
        _label = [UILabel new];
        _label.text = @"新品";
        _label.textAlignment = NSTextAlignmentCenter;
        _label.tintColor = [UIColor grayColor];
        _label.backgroundColor = [UIColor whiteColor];
        _label.font = [UIFont systemFontOfSize:14.5];
    }
    return _label;
}
- (instancetype)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {
        [self initUI];
    }
    return self;
}
- (void)initUI{
    [self addSubview:self.imageView];
    [self addSubview:self.label];
    [self updateConstraints];
}
- (void)updateConstraints{
    [super updateConstraints];
    WS(weakSelf);
    [_imageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(weakSelf);
        make.height.equalTo(@60);
    }];
    [_label mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.mas_centerX);
        make.width.equalTo(_imageView.mas_width);
        make.bottom.equalTo(weakSelf.mas_bottom).offset(-10);
        make.height.equalTo(@20);
    }];
}
- (void)setName:(NSString *)name{
    _label.text = name;
   
}
- (void)setImage:(NSString *)image{
     _imageView.image = [UIImage imageNamed:image];
}
@end
