//
//  myReturnCell.m
//  one
//
//  Created by kobe on 16/11/28.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import "myReturnCell.h"

@interface myReturnCell()
{
    CGFloat _textWidth;
    CGFloat _textHeight;
}
@property(nonatomic,strong)UIImageView *textImageView;
@property(nonatomic,strong)UIImageView *iconImageView;
@end

@implementation myReturnCell
- (UIImageView *)textImageView{
    if (!_textImageView) {
        _textImageView = [UIImageView new];
        _textImageView.image = [UIImage imageNamed:@"bubbleMine"];
    }
    return _textImageView;
}
- (UIImageView *)iconImageView{
    if (!_iconImageView) {
        _iconImageView = [UIImageView new];
        _iconImageView.layer.masksToBounds = YES;
        _iconImageView.layer.cornerRadius = 18;
        _iconImageView.image = [UIImage imageNamed:@"defaulthead"];
        
    }
    return _iconImageView;
}
- (UILabel *)text{
    if (!_text) {
        _text = [UILabel new];
        _text.textAlignment = NSTextAlignmentCenter;
        _text.font = [UIFont systemFontOfSize:13];
        _text.numberOfLines = 0;
    }
    return _text;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initUI];
    }
    return self;
}
- (void)initUI{
    [self addSubview:self.textImageView];
    [self addSubview:self.iconImageView];
    [self.textImageView addSubview:self.text];
    [self updateConstraints];
}
- (void)updateConstraints{
    [super updateConstraints];
    WS(weakSelf);
    [_iconImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.mas_right).offset(-10);
        make.bottom.equalTo(weakSelf);
        make.size.mas_equalTo(CGSizeMake(36, 36));
    }];
    [_textImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_iconImageView.mas_centerY).offset(10);
        make.right.equalTo(_iconImageView.mas_left).offset(-2);
        make.size.mas_equalTo(CGSizeMake(_textWidth, _textHeight));
    }];
   
    [_text mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(_textHeight*1.5));
        make.bottom.equalTo(_textImageView.mas_bottom).offset(5);
        make.left.equalTo(_textImageView).offset(4);
        make.width.equalTo(@(_textWidth *0.72));
    }];
}
- (void)setTextWidth:(CGFloat)textWidth{
    _textWidth = textWidth;
}
- (void)setTextHeight:(CGFloat)textHeight{
    _textHeight = textHeight;
}


@end
