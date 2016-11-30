//
//  GuideVC.m
//  one
//
//  Created by kobe on 16/11/17.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import "GuideVC.h"
#import "MainTabBar.h"
#import "NavigationVC.h"
@interface GuideVC ()<UIScrollViewDelegate>{
    UIPageControl *_pageControll;
}

@end

@implementation GuideVC

- (void)viewDidLoad {
    [super viewDidLoad];

    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    scrollView.backgroundColor = [UIColor whiteColor];
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.contentSize = CGSizeMake(mainWidth*4, mainHeight);
    scrollView.pagingEnabled = YES;
    scrollView.tag = 200;
    scrollView.delegate = self;
    NSArray *arr = [NSArray arrayWithObjects:@"home_btn_buy",@"home_btn_buy",@"tab-pro-s",@"tab-new-s", nil];
    for (int i = 0; i < 4; i ++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i*mainWidth, 0, mainWidth, mainHeight)];
        imageView.image = [UIImage imageNamed:arr[i]];
        [scrollView addSubview:imageView];
        if (i == 3) {
            UIButton *start = [UIButton buttonWithType:0];
            start.frame = CGRectMake(mainWidth*i + mainWidth/2 - 30, mainHeight - 30, 60, 20);
            start.layer.cornerRadius = 5;
            start.layer.borderWidth = 0.5;
            [start setTitle:@"开始" forState:UIControlStateNormal];
            [start setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            [scrollView addSubview:start];
            [start addTarget:self action:@selector(startAC) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    
    [self.view addSubview:scrollView];
    [self pageControll];
    
    
    
    
    
    
}
- (void)startAC{
    
    MainTabBar *mainTabBar = [MainTabBar new];
    [self presentViewController:mainTabBar animated:YES completion:nil];
}
- (void)pageControll{
    _pageControll = [[UIPageControl alloc] initWithFrame:CGRectMake(0, mainHeight - 50, mainWidth, 20)];
    _pageControll.currentPage = 0;
    _pageControll.numberOfPages = 4;
    _pageControll.pageIndicatorTintColor = [UIColor whiteColor];
    _pageControll.currentPageIndicatorTintColor = [UIColor redColor];
    [_pageControll addTarget:self action:@selector(pageAC:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_pageControll];
    
}
- (void)pageAC:(UIPageControl *)page{
    NSLog(@"移动");
    UIScrollView *scrollView = [self.view viewWithTag:200];
    [scrollView setContentOffset:CGPointMake(mainWidth *_pageControll.currentPage, 0) animated:YES];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    _pageControll.currentPage = scrollView.contentOffset.x/mainWidth;
}
@end
