//
//  ShopCartVC.m
//  one
//
//  Created by kobe on 16/11/16.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import "ShopCartVC.h"
#import "bagView.h"
@interface ShopCartVC ()

@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,strong)UILabel *label;
@property(nonatomic,strong)bagView *bagView;
@end

@implementation ShopCartVC
- (bagView *)bagView{
    if (!_bagView) {
        _bagView = [bagView new];
    }
    return _bagView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"购物车";
    self.view.backgroundColor = [UIColor whiteColor];
    [self initUI];
}
- (void)initUI{
    [self.view addSubview:self.bagView];

    [self updateViewConstraints];
}
- (void)updateViewConstraints{
    [super updateViewConstraints];
    WS(weakSelf);
    [_bagView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(weakSelf.view);
    }];

}

@end
