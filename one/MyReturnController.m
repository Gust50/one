//
//  MyReturnController.m
//  one
//
//  Created by kobe on 16/11/22.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import "MyReturnController.h"
#import "contentView.h"
#import "myReturnCell.h"
#import "NSString+Size.h"
#define headWidth   40
@interface MyReturnController ()<UITableViewDelegate,UITableViewDataSource,contentViewDelegate>{
    NSString *_text;
}
@property(nonatomic,strong)contentView *contentView;
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *array;
@property(nonatomic,strong)NSMutableArray *timeArray;
@end
static NSString *const cellID = @"cellID";
@implementation MyReturnController
- (contentView *)contentView{
    if (!_contentView) {
        _contentView = [contentView new];
        _contentView.layer.borderWidth = 1;
        _contentView.layer.borderColor = [UIColor colorWithRed:232/255.0 green:232/255.0 blue:232/255.0 alpha:1.0].CGColor;
        _contentView.delegate = self;
    }
    return _contentView;
}
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [UITableView new];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.userInteractionEnabled = YES;
    }
    return _tableView;
}
- (NSMutableArray *)array{
    if (!_array) {
        _array = [NSMutableArray array];
    }
    return _array;
}
- (NSMutableArray *)timeArray{
    if (!_timeArray) {
        _timeArray = [NSMutableArray array];
    }
    return _timeArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的反馈";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    [_tableView registerClass:[myReturnCell class] forCellReuseIdentifier:cellID];
    [self initUI];
}

- (void)initUI{
    [self.view addSubview:self.contentView];
    [self updateViewConstraints];
}

- (void)updateViewConstraints{
    [super updateViewConstraints];
    WS(weakSelf);
    [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view.mas_left).offset(-1);
        make.bottom.equalTo(weakSelf.view.mas_bottom).offset(1);
        make.right.equalTo(weakSelf.view.mas_right).offset(1);
        make.height.equalTo(@50);
    }];
    [_tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(weakSelf.view);
        make.bottom.equalTo(_contentView.mas_top);
    }];

}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *str = self.array[indexPath.section];
    CGSize s = [str textSizeWithFont:[UIFont systemFontOfSize:13] constrainedToSize:CGSizeMake(mainWidth - headWidth - 50, 999) lineBreakMode:NSLineBreakByWordWrapping];
    return s.height + 40;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
     myReturnCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    NSString *str = self.array[indexPath.section];
    cell.text.text = str;
//    CGSize s  = [str textSizeWithFont:cell.text.font constrainedToSize:CGSizeMake(MAXFLOAT, 999) lineBreakMode:NSLineBreakByWordWrapping];
    CGSize s = [str textSizeWithFont:cell.text.font constrainedToSize:CGSizeMake(mainWidth - headWidth - 50, 999) lineBreakMode:NSLineBreakByWordWrapping];
    cell.textWidth = s.width +35;
    cell.textHeight = s.height +20;

    NSLog(@"输入宽度：%f",cell.textWidth);
    NSLog(@"输入高度：%f",cell.textHeight);
//    lblContent.frame = CGRectMake((bubble.frame.size.width - s.width) / 2 + 2, (bubble.frame.size.height - s.height) / 2 - 3 , s.width, s.height);
    

    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView* vvv = [[UIView alloc] initWithFrame:CGRectMake(0, 0, mainWidth, 20)];
    vvv.backgroundColor = [UIColor clearColor];
    UILabel *timeLabel = [UILabel new];
    timeLabel.font = [UIFont systemFontOfSize:11];
    timeLabel.textAlignment = NSTextAlignmentCenter;
    timeLabel.text = [NSString stringWithFormat:@"%@",self.timeArray[section]];
    timeLabel.textColor = [UIColor whiteColor];
    timeLabel.backgroundColor = [UIColor colorWithRed:217/255.0 green:217/255.0 blue:217/255.0 alpha:1.0];
    timeLabel.layer.cornerRadius = 3;
    timeLabel.layer.masksToBounds = YES;

    CGSize s  = [timeLabel.text textSizeWithFont:timeLabel.font constrainedToSize:CGSizeMake(MAXFLOAT, 999) lineBreakMode:NSLineBreakByWordWrapping];
    timeLabel.frame = CGRectMake(self.view.center.x - s.width/2, 5, s.width, 15);
    
    [vvv addSubview:timeLabel];
    return vvv;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.array.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}
#pragma mark --- contentViewDelegate ---
- (void)btnAC:(NSString *)text{
    _text = text;
    [self.array addObject:_text];
    [self addTime];
    [self.tableView reloadData];
    
}
- (void)addTime{
    NSString* date;
    NSDateFormatter* formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"YYYY-MM-dd hh:mm:ss"];
    date = [formatter stringFromDate:[NSDate date]];
    [self.timeArray addObject:date];
}

@end
