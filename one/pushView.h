//
//  pushView.h
//  one
//
//  Created by kobe on 16/11/21.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol pushDelegate <NSObject>
- (void)leftBtnAC;
- (void)rightBtnAC;
@end
@interface pushView : UIView
@property(nonatomic,assign)id<pushDelegate>delegate;
@property(nonatomic,strong)NSString *leftStr;
@property(nonatomic,strong)NSString *rightStr;
@end
