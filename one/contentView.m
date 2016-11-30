//
//  contentView.m
//  one
//
//  Created by kobe on 16/11/22.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import "contentView.h"

@interface contentView()<UITextFieldDelegate>

@property(nonatomic,strong)UITextField *textField;
@property(nonatomic,strong)UIButton *btn;
@end

@implementation contentView

- (UITextField *)textField{
    if (!_textField) {
        _textField = [UITextField new];
        _textField.layer.cornerRadius = 10;
        _textField.placeholder = @"请输入反馈内容";
        _textField.layer.borderWidth = 1;
        _textField.layer.borderColor = [UIColor colorWithRed:232/255.0 green:232/255.0 blue:232/255.0 alpha:1.0].CGColor;
        _textField.delegate = self;
    }
    return _textField;
}
- (UIButton *)btn{
    if (!_btn) {
        _btn = [UIButton new];
        [_btn setTitle:@"发送" forState:UIControlStateNormal];
         [_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _btn.layer.cornerRadius = 6;
        [_btn addTarget:self action:@selector(btnAC:) forControlEvents:UIControlEventTouchUpInside];
            [_btn setBackgroundColor:[UIColor colorWithRed:217/255.0 green:217/255.0 blue:217/255.0 alpha:1.0]];
    }
    return _btn;
}
- (void)btnAC:(NSString *)text{
    NSLog(@"111");
    if (self.delegate && [self.delegate respondsToSelector:@selector(btnAC:)]) {
        [self.delegate btnAC:_textField.text];
    }
    _textField.text = @"";
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initUI];
    }
    return self;
}
- (void)initUI{
    [self addSubview:self.textField];
    [self addSubview:self.btn];
    [self updateConstraints];
}
- (void)updateConstraints{
    [super updateConstraints];
    WS(weakSelf);
    [_textField mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(5);
        make.top.equalTo(weakSelf.mas_top).offset(2);
        make.bottom.equalTo(weakSelf.mas_bottom).offset(-2);
        make.width.equalTo(weakSelf.mas_width).offset(-100);
    }];
    [_btn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_textField.mas_right).offset(7);
        make.right.equalTo(weakSelf.mas_right).offset(-6);
        make.top.equalTo(weakSelf.mas_top).offset(6);
        make.bottom.equalTo(weakSelf.mas_bottom).offset(-5);
    }];
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if ([string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length == 0) {
        BOOL isEmpty = NO;
        if (string.length == 0 && _textField.text.length < 1) {
            isEmpty = YES;
             [_btn setBackgroundColor:[UIColor colorWithRed:217/255.0 green:217/255.0 blue:217/255.0 alpha:1.0]];
          }
        else{
            isEmpty = [_textField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length == 0;
            _btn.enabled = !isEmpty;
            _btn.backgroundColor = isEmpty ? [UIColor colorWithRed:217/255.0 green:217/255.0 blue:217/255.0 alpha:1.0] :[UIColor orangeColor];
        }
    }
    else{
        _btn.enabled = YES;
        _btn.backgroundColor = [UIColor orangeColor];
    }
    return YES;
}

@end
