//
//  AddressSelectedView.h
//  one
//
//  Created by kobe on 16/11/25.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AddressSelectedViewDelegate <NSObject>
-(void)btnAC:(UIButton *)sender;
@end
@interface AddressSelectedView : UIView
@property(nonatomic,weak)id<AddressSelectedViewDelegate>delegate;
@end
