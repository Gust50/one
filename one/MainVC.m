//
//  MainVC.m
//  one
//
//  Created by kobe on 16/11/16.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import "MainVC.h"
#import "oneCell.h"
#import "twoCell.h"
#import "OneModel.h"
#import "headView.h"
@interface MainVC ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong)OneModel *oneModel;
@property(nonatomic,strong)NSArray *nameArray;
@property(nonatomic,strong)NSArray *imageArray;
@property(nonatomic,strong)UIView *topView;
@property(nonatomic,strong)UIView *line;
@end
static NSString *const cellID = @"cellID";
static NSString *const twoID = @"twoID";
static NSString *const headID = @"headID";
@implementation MainVC
- (UIView *)topView{
    if (!_topView) {
        _topView = [UIView new];
        _topView.backgroundColor = [UIColor whiteColor];
    }
    return _topView;
}
- (UIView *)line{
    if (!_line) {
        _line = [UIView new];
        _line.backgroundColor = [UIColor grayColor];
    }
    return _line;
}
- (NSArray *)nameArray{
    if (!_nameArray) {
        _nameArray = [NSArray arrayWithObjects:@"新品",@"晒单",@"云购记录", nil];
    }
    return _nameArray;
}
- (NSArray *)imageArray{
    if (!_imageArray) {
        _imageArray = [NSArray arrayWithObjects:@"home_btn_new",@"home_btn_show",@"home_btn_buy", nil];
    }
    return _imageArray;
}
- (UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];
//        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        
    }
    return _collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    self.view.backgroundColor = [UIColor grayColor];
    [self initUI];
}
- (void)initUI{
    [self.view addSubview:self.collectionView];
    [self.view addSubview:self.topView];
    [self.view addSubview:self.line];
    [self updateViewConstraints];
    [_collectionView registerClass:[oneCell class] forCellWithReuseIdentifier:cellID];
    [_collectionView registerClass:[twoCell class] forCellWithReuseIdentifier:twoID];
    [_collectionView registerClass:[headView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headID];
}
- (void)updateViewConstraints{
    [super updateViewConstraints];
    WS(weakSelf);
    [_collectionView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(weakSelf.view);
        make.top.equalTo(weakSelf.view.mas_top).offset(100);
    }];
    [_topView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(weakSelf.view);
        make.bottom.equalTo(_collectionView.mas_top);
    }];
    [_line mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view.mas_left).offset(10);
        make.right.equalTo(weakSelf.view);
        make.centerY.equalTo(_topView.mas_bottom).offset(-20);
        make.height.equalTo(@1);
    }];
}
#pragma mark --- UICollectionViewDelegate ---
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section == 0) {
        return 3;
    }
    else{
        return 4;
    }
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    _oneModel = [OneModel new];
   
   
    if (indexPath.section == 0) {
         oneCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
        cell.name = self.nameArray[indexPath.row];
        cell.image = self.imageArray[indexPath.row];
        
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
    }
    else{
        twoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:twoID forIndexPath:indexPath];
        cell.backgroundColor = [UIColor whiteColor];
        return cell;
    }
}


#pragma mark --- UICollectionViewLayout ---
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return CGSizeMake(60,100);

    }
    else {
        return CGSizeMake((self.view.frame.size.width-2)/2, 60);
    }
   
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    if (section == 0) {
        return 20;
    }
    else{
    return 2;
    }
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    if (section == 0) {
        return 50;
    }
    else{
       return 2;
    }
    
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return CGSizeMake(0, 0);
    }else{
        return CGSizeMake(self.view.frame.size.width, 30);
    }
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    if (section == 0) {
        return UIEdgeInsetsMake(0, 30, 0, 30);
    }
    else{
        return UIEdgeInsetsMake(0, 0, 0, 0);
    }
}
#pragma mark --- UICollectionReusableView ---
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    headView *header;
    if (indexPath.section == 1) {
        
   
        if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
            
            header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headID forIndexPath:indexPath];
        }
        return header;
  
    }else{
        return 0;
    }
    
}

@end
