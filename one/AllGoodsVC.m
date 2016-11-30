//
//  AllGoods.m
//  one
//
//  Created by kobe on 16/11/16.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import "AllGoodsVC.h"
#import "pushView.h"
#import "classifyCell.h"
#import "RightCell.h"
@interface AllGoodsVC ()<pushDelegate,UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)pushView *pushView;
@property(nonatomic,strong)UITableView *leftTableView;
@property(nonatomic,strong)NSArray *strArray;
@property(nonatomic,strong)NSArray *imageArray;
@property(nonatomic,strong)NSArray *imageSelectArray;
@property(nonatomic,strong)NSIndexPath *index;
@property(nonatomic,assign)BOOL isNotFirst;

@property(nonatomic,strong)UITableView *rightTableView;
@property(nonatomic,strong)NSArray *rightArray;
@property(nonatomic,assign)BOOL isNotRightFirst;
@end
static NSString *const cellID = @"cellID";
static NSString *const rightID = @"rightID";
@implementation AllGoodsVC

- (NSArray *)strArray{
    if (!_strArray) {
        _strArray = [NSArray arrayWithObjects:@"全部分类",@"手机数码",@"电脑办公",@"家用电器",@"化妆个护",@"钟表首饰",@"其他商品", nil];
    }
    return _strArray;
}
- (NSArray *)imageArray{
    if (!_imageArray) {
        _imageArray = [NSArray arrayWithObjects:@"sort0_normal",@"sort100_normal",@"sort106_normal",@"sort104_normal",@"sort2_normal",@"sort222_normal",@"sort312_normal", nil];
    }
    return _imageArray;
}
- (NSArray *)imageSelectArray{
    if (!_imageSelectArray) {
        _imageSelectArray = [NSArray arrayWithObjects:@"sort0_checked",@"sort100_checked",@"sort106_checked",@"sort104_checked",@"sort2_checked",@"sort222_checked",@"sort312_checked", nil];
    }
    return _imageSelectArray;
}
- (UITableView *)leftTableView{
    if (!_leftTableView) {
        _leftTableView = [UITableView new];
        _leftTableView.backgroundColor = [UIColor whiteColor];
        _leftTableView.dataSource = self;
        _leftTableView.delegate = self;
    }
    return _leftTableView;
}
- (pushView *)pushView{
    if (!_pushView) {
        _pushView = [pushView new];
        _pushView.backgroundColor = [UIColor colorWithRed:247/255.0 green:247/255.0 blue:247/255.0 alpha:1.0];
        _pushView.delegate = self;
    }
    return _pushView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"所有商品";
    self.view.backgroundColor = [UIColor whiteColor];
    [self initUI];
}

- (UITableView *)rightTableView{
    if (!_rightTableView) {
        _rightTableView = [UITableView new];
        _rightTableView.backgroundColor = [UIColor whiteColor];
        _rightTableView.dataSource = self;
        _rightTableView.delegate = self;
    }
    return _rightTableView;
}

- (NSArray *)rightArray{
    if (!_rightArray) {
        _rightArray = [NSArray arrayWithObjects:@"即将揭晓",@"人气",@"价值(由高到低)",@"价值(由低到高)",@"最新", nil];
    }
    return _rightArray;
}
- (void)initUI{
    [self.view addSubview:self.pushView];
    [self.view addSubview:self.leftTableView];
    self.leftTableView.hidden = YES;
    [self.view addSubview:self.rightTableView];
    self.rightTableView.hidden = YES;
    [self updateViewConstraints];
    [_leftTableView registerClass:[classifyCell class] forCellReuseIdentifier:cellID];
    [_rightTableView registerClass:[RightCell class] forCellReuseIdentifier:rightID];
}
- (void)updateViewConstraints{
    [super updateViewConstraints];
    WS(weakSelf);
    [_pushView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(weakSelf.view);
        make.height.equalTo(@60);
    }];
    [_leftTableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(weakSelf.view);
        make.top.equalTo(_pushView.mas_bottom);
        make.height.equalTo(@(weakSelf.view.height *2/3));
    }];
    [_rightTableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(weakSelf.view);
        make.top.equalTo(_pushView.mas_bottom);
        make.height.equalTo(@(weakSelf.view.height *1/2));
    }];
}
#pragma mark --- pushViewDelegate ---
- (void)leftBtnAC{
    self.rightTableView.hidden = YES;
    self.leftTableView.hidden = NO;
}
- (void)rightBtnAC{
    self.leftTableView.hidden = YES;
    self.rightTableView.hidden = NO;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == self.leftTableView) {
        return 7;
    }else{
        return 5;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.leftTableView) {
               classifyCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
               cell.str = self.strArray[indexPath.row];
               cell.imageStr = self.imageArray[indexPath.row];
        

          if ( _index == indexPath)
              {
               cell.isSelected = YES;
               cell.imageStr = self.imageSelectArray[indexPath.row];
               self.pushView.leftStr = self.strArray[_index.row];
               cell.accessoryType = UITableViewCellAccessoryCheckmark;
               }
          else{
               cell.isSelected = NO;
               cell.imageStr = self.imageArray[indexPath.row];
               cell.accessoryType = UITableViewCellAccessoryNone;
              }
    
    
        if (indexPath.row == 0 && !_isNotFirst) {
              _isNotFirst = YES;
              cell.isSelected = YES;
              cell.imageStr = self.imageSelectArray[indexPath.row];
              cell.accessoryType = UITableViewCellAccessoryCheckmark;
              }
              return cell;
    }
    else{
              RightCell *cell = [tableView dequeueReusableCellWithIdentifier:rightID forIndexPath:indexPath];
              cell.str = self.rightArray[indexPath.row];
        if ( _index == indexPath) {
              cell.isSelected = YES;
              self.pushView.rightStr = self.rightArray[_index.row];
              cell.accessoryType = UITableViewCellAccessoryCheckmark;
              }
          else{
              cell.isSelected = NO;
              cell.accessoryType = UITableViewCellAccessoryNone;
              }
        if (indexPath.row == 0 && !_isNotRightFirst) {
            _isNotRightFirst = YES;
            cell.isSelected = YES;
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
              }
        return cell;
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    _index = indexPath;
    if (tableView == self.leftTableView) {
       [self.leftTableView reloadData];
    }else{
       [self.rightTableView reloadData];
    }
    
    [self performSelector:@selector(hiddenTableView) withObject:nil afterDelay:0.1f];
}
- (void)hiddenTableView{
    self.leftTableView.hidden = YES;
    self.rightTableView.hidden = YES;
}
@end
