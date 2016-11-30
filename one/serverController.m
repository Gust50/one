
//
//  serverController.m
//  one
//
//  Created by kobe on 16/11/22.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import "serverController.h"

@interface serverController ()
@property(nonatomic,strong)UILabel *label;
@end

@implementation serverController
- (UILabel *)label{
    if (!_label) {
        _label = [UILabel new];
        NSString *str1 = @"        欢迎您使用并访问一元购IOS客户端，本APP中所有的数据均来自一元云购(www.lyyg.com)平台，真实有效,并对数据不做任何保留。                                                                                    ";
        NSString *str2 = @"        我们的服务宗旨就是：为广大云购朋友提供免费的便利。";
        NSString *str3 = @"        此客户端并非一元云购开发的官方产品，由于为了广大云购朋友能够在手机上也能玩云购，我们才开发此APP，我们也是一元购的忠实玩家。";
        NSString *str4 = @"        一切规则以官方平台：一元云购为准。";
        NSString *str5 = @"        本人保留声明条款的最终解释和不定时修改的权利。";
        _label.text = [NSString stringWithFormat:@"%@\n\n%@\n\n%@\n\n%@\n\n%@",str1,str2,str3,str4,str5];
        _label.numberOfLines = 0;
        _label.font = [UIFont systemFontOfSize:13];
    }
    return _label;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"服务协议";
    self.view.backgroundColor = [UIColor whiteColor];
    [self initUI];
}

- (void)initUI{
    [self.view addSubview:self.label];
    [self updateViewConstraints];
}
- (void)updateViewConstraints{
    [super updateViewConstraints];
    WS(weakSelf);
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(weakSelf.view);
        make.height.equalTo(@200);
    }];
}


@end
