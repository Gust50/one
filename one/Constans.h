//
//  Constans.h
//  one
//
//  Created by kobe on 16/11/16.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#ifndef Constans_h
#define Constans_h

#define mainHeight     [[UIScreen mainScreen] bounds].size.height
#define mainWidth      [[UIScreen mainScreen] bounds].size.width
#define navBarHeight   self.navigationController.navigationBar.frame.size.height

#define mainColor                   [UIColor hexFloatColor:@"ff6600"]
//弱引用
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

#define BG_COLOR                    RGB(248,248,248)
#define BG_GRAY_COLOR               RGB(242,242,242)
#define NAVBAR_COLOR                [UIColor hexFloatColor:@"f68e49"]

#define TABBAR_TEXT_NOR_COLOR       RGB(153, 153, 153)
#define TABBAR_TEXT_HLT_COLOR       mainColor
#define RGB(r,g,b) [UIColor colorWithRed:r/255. green:g/255. blue:b/255. alpha:1.]

#endif /* Constans_h */
