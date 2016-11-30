//
//  bagView.m
//  one
//
//  Created by kobe on 16/11/21.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import "bagView.h"

@interface bagView()
@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,strong)UILabel *label;
@end
@implementation bagView

- (UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [UIImageView new];
        _imageView.image = [UIImage imageNamed:@"cart2"];
    }
    return _imageView;
}
- (UILabel *)label{
    if (!_label) {
        _label = [UILabel new];
        _label.text = @"购物车为空";
        _label.textAlignment = NSTextAlignmentCenter;
        _label.font = [UIFont systemFontOfSize:15];
        _label.textColor = [UIColor grayColor];
    }
    return _label;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
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
        make.centerX.equalTo(weakSelf.mas_centerX);
        make.centerY.equalTo(weakSelf.mas_centerY).offset(-80);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    [_label mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(_imageView);
        make.top.equalTo(_imageView.mas_bottom).offset(10);
        make.height.equalTo(@20);
    }];

}
@end
