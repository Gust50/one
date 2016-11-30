//
//  MainTabBar.m
//  one
//
//  Created by kobe on 16/11/16.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import "MainTabBar.h"
#import "MainVC.h"
#import "ShopCartVC.h"
#import "AllGoodsVC.h"
#import "MineVC.h"
#import "AnnounceVC.h"
#import "NavigationVC.h"
@interface MainTabBar ()
@property(nonatomic,strong)MainVC *mainVC;
@property(nonatomic,strong)ShopCartVC *shopCartVC;
@property(nonatomic,strong)AllGoodsVC *allGoodsVC;
@property(nonatomic,strong)MineVC *mineVC;
@property(nonatomic,strong)AnnounceVC *announceVC;
@end

@implementation MainTabBar
- (MainVC *)mainVC{
    if (!_mainVC) {
        _mainVC = [MainVC new];
    }
    return _mainVC;
}
- (ShopCartVC *)shopCartVC{
    if (!_shopCartVC) {
        _shopCartVC = [ShopCartVC new];
    }
    return _shopCartVC;
}
- (AllGoodsVC *)allGoodsVC{
    if (!_allGoodsVC) {
        _allGoodsVC = [AllGoodsVC new];
    }
    return _allGoodsVC;
}
- (MineVC *)mineVC{
    if (!_mineVC) {
        _mineVC = [MineVC new];
    }
    return _mineVC;
}
- (AnnounceVC *)announceVC{
    if (!_announceVC) {
        _announceVC = [AnnounceVC new];
    }
    return _announceVC;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [UITabBar appearance].tintColor = BG_COLOR;
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:TABBAR_TEXT_NOR_COLOR} forState:UIControlStateNormal];
    
    [self controller:self.mainVC title:@"首页" image:@"tab-home" selectImage:@"tab-home-s"];
    [self controller:self.shopCartVC title:@"购物车" image:@"tab-cart" selectImage:@"tab-cart-s"];
    [self controller:self.allGoodsVC title:@"所有商品" image:@"tab-pro" selectImage:@"tab-pro-s"];
    [self controller:self.mineVC title:@"我的云购" image:@"tab-mine" selectImage:@"tab-mine-s"];
    [self controller:self.announceVC title:@"最新揭晓" image:@"tab-new" selectImage:@"tab-new-s"];

}

- (void)controller:(UIViewController *)controller title:(NSString *)title image:(NSString *)image selectImage:(NSString *)selectImage{
    NavigationVC *nav = [[NavigationVC alloc] initWithRootViewController:controller];
    
    controller.tabBarItem  = [[UITabBarItem alloc] initWithTitle:title image:[[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:selectImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    [self addChildViewController:nav];
   
}



@end
