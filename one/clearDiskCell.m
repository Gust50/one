//
//  clearDiskCell.m
//  one
//
//  Created by kobe on 16/11/22.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import "clearDiskCell.h"

@interface clearDiskCell()
{
    NSString *cacheSize;
}
@property(nonatomic,strong)UILabel *digitLabel;
@property(nonatomic,strong)UILabel *showlabel;
@end
@implementation clearDiskCell

- (UILabel *)showlabel{
    if (!_showlabel) {
        _showlabel = [UILabel new];
        _showlabel.textAlignment = NSTextAlignmentLeft;
        _showlabel.text = @"清除缓存";
        _showlabel.textColor = [UIColor colorWithRed:135/255.0 green:135/255.0 blue:135/255.0 alpha:1.0];
    }
    return _showlabel;
}
- (UILabel *)digitLabel{
    if (!_digitLabel) {
        _digitLabel = [UILabel new];
        _digitLabel.textAlignment = NSTextAlignmentLeft;
        _digitLabel.text = cacheSize;
        _digitLabel.textColor = [UIColor colorWithRed:208/255.0 green:208/255.0 blue:208/255.0 alpha:1.0];
        _digitLabel.font = [UIFont systemFontOfSize:13];
        _digitLabel.hidden = NO;
    }
    return _digitLabel;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initUI];
    }
    return self;
}
- (void)initUI{
    float tmpSize = [[SDImageCache sharedImageCache] getSize] / 1024 /1024;
    NSString *clearCacheSizeStr = tmpSize >= 1 ? [NSString stringWithFormat:@"%.2fM",tmpSize] : [NSString stringWithFormat:@"%.2fK",tmpSize * 1024];
    cacheSize = clearCacheSizeStr;

    [self addSubview:self.showlabel];
    [self addSubview:self.digitLabel];
    [self updateConstraints];
}
- (void)updateConstraints{
    [super updateConstraints];
    WS(weakSelf);
    [_showlabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(20);
        make.centerY.equalTo(weakSelf);
        make.size.mas_equalTo(CGSizeMake(70, 30));
    }];
    [_digitLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_showlabel.mas_right).offset(10);
        make.centerY.equalTo(weakSelf);
        make.size.mas_equalTo(CGSizeMake(60, 30));
    }];
    
}
- (void)setStr:(NSString *)str{
    _digitLabel.text = str;
    _digitLabel.hidden = YES;
}

@end
