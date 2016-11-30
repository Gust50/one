//
//  AnnounceVC.m
//  one
//
//  Created by kobe on 16/11/16.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import "AnnounceVC.h"
#import "SearchVC.h"
#import "pushView.h"
#import "classifyCell.h"
#import "RightCell.h"
@interface AnnounceVC ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,assign)BOOL isOpen;
@property(nonatomic,strong)UITableView *leftTableView;
@property(nonatomic,strong)NSArray *strArray;
@property(nonatomic,strong)NSArray *imageArray;
@property(nonatomic,strong)NSArray *imageSelectArray;
@property(nonatomic,strong)NSIndexPath *index;
@property(nonatomic,assign)BOOL isNotFirst;

@end
static NSString *const cellID = @"cellID";
static NSString *const rightID = @"rightID";

@implementation AnnounceVC
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

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"最新揭晓";
    self.view.backgroundColor = [UIColor whiteColor];
     UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"全部分类▽" style:UIBarButtonItemStylePlain  target:self action:@selector(itemAC)];
     item.tintColor = [UIColor whiteColor];
     [item setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} forState:UIControlStateNormal];
     self.navigationItem.rightBarButtonItem  = item;
    
    [self initUI];
}
- (void)itemAC{
//    kCATransitionFade
//    kCATransitionPush
//    kCATransitionReveal
//    kCATransitionMoveIn
//    @"cube"
//    @"suckEffect"
//    @"oglFlip"
//    @"rippleEffect"
//    @"pageCurl"
//    @"pageUnCurl"
//    @"cameraIrisHollowOpen"
//    @"cameraIrisHollowClose"
    
//    kCATransitionFromLeft
//    kCATransitionFromBottom
//    kCATransitionFromRight
//    kCATransitionFromTop
    
//    UIViewAnimationTransitionNone,
//    UIViewAnimationTransitionFlipFromLeft,
//    UIViewAnimationTransitionFlipFromRight,
//    UIViewAnimationTransitionCurlUp,
//    UIViewAnimationTransitionCurlDown
    _leftTableView.hidden = !_leftTableView.hidden;
    if (_leftTableView.hidden == NO) {
//        [self animationWithView:self.view WithAnimationTransition:UIViewAnimationTransitionCurlDown];
//        [self addBgImageWithImageName:@"add"];
        [self transitionWithType:@"cube" WithSubtype:kCATransitionFromTop ForView:self.view];
    }
    
}

- (void)initUI{
    [self.view addSubview:self.leftTableView];
    self.leftTableView.hidden = YES;
    [self updateViewConstraints];
    [_leftTableView registerClass:[classifyCell class] forCellReuseIdentifier:cellID];
}
- (void)updateViewConstraints{
    [super updateViewConstraints];
    WS(weakSelf);
    [_leftTableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(weakSelf.view);
        make.top.equalTo(@0);
        make.height.equalTo(@(weakSelf.view.height *2/3));
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
        return 7;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
        classifyCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
        cell.str = self.strArray[indexPath.row];
        cell.imageStr = self.imageArray[indexPath.row];

        if ( _index == indexPath)
        {
            cell.isSelected = YES;
            cell.imageStr = self.imageSelectArray[indexPath.row];
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
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    _index = indexPath;
    [self.leftTableView reloadData];
}


#pragma CATransition动画实现
- (void) transitionWithType:(NSString *) type WithSubtype:(NSString *) subtype ForView : (UIView *) view
{
    //创建CATransition对象
    CATransition *animation = [CATransition animation];
    //设置运动时间
    animation.duration = 2;
    //设置运动type
    animation.type = type;
    if (subtype != nil) {
    //设置子类
    animation.subtype = subtype;
    }
    //设置运动速度
    animation.timingFunction = UIViewAnimationOptionCurveEaseInOut;
    [view.layer addAnimation:animation forKey:@"animation"];
}
#pragma 切换画面方式
- (void) animationWithView : (UIView *)view WithAnimationTransition : (UIViewAnimationTransition) transition
{
    [UIView animateWithDuration:2 animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationTransition:transition forView:view cache:YES];
    }];
}
#pragma 给View添加背景图
-(void)addBgImageWithImageName:(NSString *) imageName
{
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:imageName]];
}


//CAAnimation有很多派生类
//CATransition 提供渐变效果:(推拉push效果,消退fade效果,揭开reveal效果)。
//CAAnimationGroup 允许多个动画同时播放。
//CABasicAnimation 提供了对单一动画的实现。
//CAKeyframeAnimation 关键桢动画,可以定义行动路线。
//CAConstraint 约束类,在布局管理器类中用它来设置属性。
//CAConstraintLayoutManager 约束布局管理器,是用来将多个CALayer进行布局的.各个CALayer是通过名称来区分,而布局属性是通过CAConstraint来设置的。
//CATransaction 事务类,可以对多个layer的属性同时进行修改.它分隐式事务,和显式事务。

@end
