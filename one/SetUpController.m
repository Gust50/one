//
//  SetUpController.m
//  one
//
//  Created by kobe on 16/11/22.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import "SetUpController.h"
#import "gustCell.h"
#import "clearDiskCell.h"
#import "serverController.h"
#import "MyReturnController.h"
@interface SetUpController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@end
static NSString *const cellID = @"cellID";
static NSString *const switchID = @"switchID";
static NSString *const clearDiskID = @"clearDiskID";
@implementation SetUpController
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [UITableView new];
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:247/255.0 green:247/255.0 blue:247/255.0 alpha:1.0];
    [self initUI];
}

- (void)initUI{
    [self.view addSubview:self.tableView];
    [self updateViewConstraints];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    [_tableView registerClass:[gustCell class] forCellReuseIdentifier:switchID];
    [_tableView registerClass:[clearDiskCell class] forCellReuseIdentifier:clearDiskID];
}
- (void)updateViewConstraints{
    [super updateViewConstraints];
    WS(weakSelf);
    [_tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(weakSelf.view);
        make.top.equalTo(weakSelf.view);
        make.height.equalTo(@170);
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 3;
    }
    else{
        return 1;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.textLabel.textColor = [UIColor colorWithRed:135/255.0 green:135/255.0 blue:135/255.0 alpha:1.0];
            cell.textLabel.text = @"意见反馈";
            return cell;
        }else if(indexPath.row == 1){
            gustCell *cell = [tableView dequeueReusableCellWithIdentifier:switchID forIndexPath:indexPath];
            
            return cell;
        }else{
            clearDiskCell *cell = [tableView dequeueReusableCellWithIdentifier:clearDiskID forIndexPath:indexPath];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            return cell;
        }
        
    }else{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
                cell.textLabel.text = @"服务协议";
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                cell.textLabel.textColor = [UIColor colorWithRed:135/255.0 green:135/255.0 blue:135/255.0 alpha:1.0];
                return cell;
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0)
       {
        if (indexPath.row == 0)
        {   self.hidesBottomBarWhenPushed = YES;
                MyReturnController *returnVC = [MyReturnController new];
                [self.navigationController pushViewController:returnVC animated:YES];
            self.hidesBottomBarWhenPushed = NO;
            }
        else if(indexPath.section == 1)
            {
//               gustCell *cell = [tableView dequeueReusableCellWithIdentifier:switchID forIndexPath:indexPath];
//                if (cell.isOpen == NO) {
//                    cell.isOpen = YES;
//                }else{
//                    cell.isOpen = NO;
//                }
                
            }
        else{
             clearDiskCell *cell = [tableView dequeueReusableCellWithIdentifier:clearDiskID forIndexPath:indexPath];
              cell.str = @"";
            }
      }
    else
      {
          serverController *serverVC = [serverController new];
          [self.navigationController pushViewController:serverVC animated:YES];
      }
   
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 1) {
        return 10;
    }
    else{
        return 0;
    }
}


@end
