//
//  segementView.m
//  one
//
//  Created by kobe on 16/11/24.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import "segementView.h"

@interface segementView()
@property(nonatomic,strong)UISegmentedControl *segmentV;
@end
@implementation segementView
- (UISegmentedControl *)segmentV{
    if (!_segmentV) {
        _segmentV = [[UISegmentedControl alloc] initWithItems:@[@"全部",@"进行中",@"已揭晓"]];
        _segmentV.selectedSegmentIndex = 1;
        _segmentV.tintColor =[UIColor colorWithRed:251/256.0 green:105/256.0 blue:1/256.0 alpha:1.0];
//        _segmentV.momentary = YES;
//        // 有基本四种样式
//        segmentedControl.segmentedControlStyle = UISegmentedControlStylePlain;
//        segmentedControl.segmentedControlStyle = UISegmentedControlStyleBordered;
//        segmentedControl.segmentedControlStyle = UISegmentedControlStyleBar;
//        segmentedControl.segmentedControlStyle = UISegmentedControlStyleBezeled;

    }
    return _segmentV;
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initUI];
    }
    return self;
}
- (void)initUI{
    [self addSubview:self.segmentV];
    [self updateConstraints];
}
- (void)updateConstraints{
    [super updateConstraints];
    WS(weakSelf);
    [_segmentV mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(30);
        make.right.equalTo(weakSelf.mas_right).offset(-30);
        make.top.equalTo(weakSelf.mas_top).offset(8);
        make.height.equalTo(@32);
    }];
}
@end
