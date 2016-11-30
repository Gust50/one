//
//  NavigationVC.m
//  one
//
//  Created by kobe on 16/11/16.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import "NavigationVC.h"

@interface NavigationVC ()
@property(nonatomic,strong)UIButton *leftBtn;
@end

@implementation NavigationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:16.0],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    UINavigationBar *bar = [UINavigationBar appearance];
    bar.barTintColor = [UIColor orangeColor];
    bar.translucent = NO;
    
//   self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"btnback"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(leftBtnAC)];
}
//- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
//    
//    if (self.viewControllers > 0) {
//      viewController.hidesBottomBarWhenPushed = YES;
////      viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btnback"] style:UIBarButtonItemStylePlain target:self action:@selector(leftBtnAC)];
//    }
//    [self pushViewController:viewController animated:YES];
//}

//- (void)leftBtnAC{
//    [self popViewControllerAnimated:YES];
//}


@end
