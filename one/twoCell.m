//
//  twoCell.m
//  one
//
//  Created by kobe on 16/11/18.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import "twoCell.h"

@interface twoCell()
@property(nonatomic,strong)UILabel *layerLabel;
@property(nonatomic,strong)UIImageView *imageView;
@end

@implementation twoCell
- (UILabel *)layerLabel{
    if (!_layerLabel) {
        _layerLabel = [UILabel new];
        _layerLabel.layer.borderColor = [UIColor grayColor].CGColor;
        _layerLabel.layer.borderWidth = 1;
    }
    return _layerLabel;
}
- (UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [UIImageView new];
        _imageView.image = [UIImage imageNamed:@"home_btn_new"];
    }
    return _imageView;
}
- (instancetype)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {
        [self initUI];
    }
    return self;
}
- (void)initUI{
    [self addSubview:self.layerLabel];
    [self addSubview:self.imageView];
    [self updateConstraints];
}
- (void)updateConstraints{
    [super updateConstraints];
    WS(weakSelf);
    [_layerLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.equalTo(weakSelf);
    }];
    [_imageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.mas_right).offset(-10);
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.width.equalTo(@50);
        make.top.equalTo(weakSelf.mas_top).offset(5);
    }];
}
@end
