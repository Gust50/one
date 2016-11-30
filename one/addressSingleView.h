//
//  addressSingleView.h
//  one
//
//  Created by kobe on 16/11/25.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol addressSingleViewDelegate <NSObject>
- (void)btnAC:(UIButton *)sender;
@end

@interface addressSingleView : UIView
@property(nonatomic,assign)NSInteger integer;
@property(nonatomic,weak)id<addressSingleViewDelegate>delegate;
@end
