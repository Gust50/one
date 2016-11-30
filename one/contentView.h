//
//  contentView.h
//  one
//
//  Created by kobe on 16/11/22.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol contentViewDelegate <NSObject>
- (void)btnAC:(NSString *)text;
@end

@interface contentView : UIView
@property(nonatomic,weak)id<contentViewDelegate>delegate;
@end
