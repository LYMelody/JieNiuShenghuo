//
//  JNSHMyViewController.m
//  JieNiuShenghuo
//
//  Created by rongfeng on 2017/8/2.
//  Copyright © 2017年 China Zhou. All rights reserved.
//

#import "JNSHMyViewController.h"
#import "JNSHMyHeaderCell.h"
#import "JNSHMyCommonCell.h"
#import "Masonry.h"
#import "JNSHVipViewController.h"
#import "JNSYAccountMessageViewController.h"
#import "JNSHSettingViewController.h"
#import "JNSHReallNameController.h"
@interface JNSHMyViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation JNSHMyViewController {
    
    UIImageView *barBackImg;
    UIImageView *headImageView;
    UITableView *table;
}

- (void)viewWillAppear:(BOOL)animated {
    
    
    [super viewWillAppear:animated];

    [table reloadData];
    
}

- (void)viewDidAppear:(BOOL)animated {
    
    barBackImg = self.navigationController.navigationBar.subviews.firstObject;
    barBackImg.alpha = 0;
    self.navigationItem.title = @"";
    
    self.tabBarController.tabBar.translucent = YES;
    
    [super viewDidAppear:animated];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    
    barBackImg.alpha = 1;
    
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    //返回按钮
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:nil];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    //设置按钮
    UIButton *SettingBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [SettingBtn setImage:[UIImage imageNamed:@"my_head_set"] forState:UIControlStateNormal];
    [SettingBtn addTarget:self action:@selector(Setting) forControlEvents:UIControlEventTouchUpInside];
    SettingBtn.frame = CGRectMake(0, 0, 36, 36);
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:SettingBtn];
    
    //取消tableView自动布局
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KscreenWidth, KscreenHeight - 49) style:UITableViewStylePlain];
    table.delegate = self;
    table.dataSource = self;
    table.backgroundColor = ColorTableBackColor;
    table.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 30)];
    table.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, CGFLOAT_MIN)];
    table.scrollIndicatorInsets = UIEdgeInsetsMake(64, 0, 0, 0);
    table.showsVerticalScrollIndicator = YES;
    table.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:table];
    
    //顶部背景色
    headImageView = [[UIImageView alloc] init];
    headImageView.frame = CGRectMake(0, -200, KscreenWidth, 200);
    headImageView.backgroundColor = ColorTabBarBackColor;
    [table addSubview:headImageView];
    
}

//设置按钮跳转
- (void)Setting {
    
    JNSHSettingViewController *SettingVc = [[JNSHSettingViewController alloc] init];
    SettingVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:SettingVc animated:YES];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 16;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identy = @"identy";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identy];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] init];
        if (indexPath.row == 0) {
            cell.backgroundColor = ColorTabBarBackColor;
        }else if (indexPath.row == 1) {
            
            JNSHMyHeaderCell *Cell = [[JNSHMyHeaderCell alloc] init];
            Cell.headerView.image = [UIImage imageNamed:@"my_head_portrait"];
            Cell.nickNameLab.text = @"小二家";
            Cell.phoneLab.text = @"188****8888";
            Cell.showVip = YES;
            cell = Cell;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }else if (indexPath.row == 2|| indexPath.row == 4||indexPath.row == 7 || indexPath.row == 10 || indexPath.row == 14) {
            
            cell.backgroundColor = ColorTableBackColor;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }else if (indexPath.row == 3) {
            
            JNSHMyCommonCell *Cell = [[JNSHMyCommonCell alloc] init];
            Cell.titleImage.image = [UIImage imageNamed:@"my_vip"];
            Cell.titleLab.text = @"会员中心";
            Cell.rightLab.text = @"20天后到期";
            Cell.showBottomLine = YES;
            Cell.showTopLine = YES;
            cell = Cell;
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }else if (indexPath.row == 5) {
            JNSHMyCommonCell *Cell = [[JNSHMyCommonCell alloc] init];
            Cell.titleImage.image = [UIImage imageNamed:@"my_Certification"];
            Cell.titleLab.text = @"实名认证";
            Cell.rightLab.text = @"待审核";
            Cell.showTopLine = YES;
            cell = Cell;
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }else if (indexPath.row == 6) {
            JNSHMyCommonCell *Cell = [[JNSHMyCommonCell alloc] init];
            Cell.titleImage.image = [UIImage imageNamed:@"my_card"];
            Cell.titleLab.text = @"结算卡";
            Cell.rightLab.text = @"待绑定";
            Cell.showBottomLine = YES;
            cell = Cell;
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }else if (indexPath.row == 8) {
            JNSHMyCommonCell *Cell = [[JNSHMyCommonCell alloc] init];
            Cell.titleImage.image = [UIImage imageNamed:@"my_order"];
            Cell.titleLab.text = @"订单";
            Cell.rightLab.text = @"";
            Cell.showTopLine = YES;
            cell = Cell;
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }else if (indexPath.row == 9) {
            JNSHMyCommonCell *Cell = [[JNSHMyCommonCell alloc] init];
            Cell.titleImage.image = [UIImage imageNamed:@"my_coupon"];
            Cell.titleLab.text = @"卡券包";
            Cell.rightLab.text = @"";
            Cell.showBottomLine = YES;
            cell = Cell;
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }else if (indexPath.row == 11) {
            JNSHMyCommonCell *Cell = [[JNSHMyCommonCell alloc] init];
            Cell.titleImage.image = [UIImage imageNamed:@"my_invite-code"];
            Cell.titleLab.text = @"邀请码";
            Cell.rightLab.text = @"";
            Cell.showTopLine = YES;
            cell = Cell;
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }else if (indexPath.row == 12) {
            JNSHMyCommonCell *Cell = [[JNSHMyCommonCell alloc] init];
            Cell.titleImage.image = [UIImage imageNamed:@"my_phone"];
            Cell.titleLab.text = @"客服电话";
            Cell.rightLab.text = @"400-600-7909";
            cell = Cell;
        }else if (indexPath.row == 13) {
            JNSHMyCommonCell *Cell = [[JNSHMyCommonCell alloc] init];
            Cell.titleImage.image = [UIImage imageNamed:@"my_instructions"];
            Cell.titleLab.text = @"使用说明";
            Cell.rightLab.text = @"";
            Cell.showBottomLine = YES;
            cell = Cell;
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }else if (indexPath.row == 15) {
            JNSHMyCommonCell *Cell = [[JNSHMyCommonCell alloc] init];
            Cell.titleImage.image = [UIImage imageNamed:@"my_agent"];
            Cell.titleLab.text = @"代理商";
            Cell.rightLab.text = @"";
            Cell.showBottomLine = YES;
            Cell.showTopLine = YES;
            cell = Cell;
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        
    }
    
    return cell;
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        return 64;
    }else if (indexPath.row == 1) {
        return 74;
    }else if (indexPath.row == 2) {
        return 20;
    }else if (indexPath.row == 4||indexPath.row == 7 || indexPath.row == 10 || indexPath.row == 14){
        return 10;
    }
    
    return 44;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 1) { //个人信息
        JNSYAccountMessageViewController *AccountVc = [[JNSYAccountMessageViewController alloc] init];
        AccountVc.hidesBottomBarWhenPushed = YES;
        
        [self.navigationController pushViewController:AccountVc animated:YES];
        
    }
    
    if (indexPath.row == 3) {  //会员
        JNSHVipViewController *VipVc = [[JNSHVipViewController alloc] init];
        VipVc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:VipVc animated:YES];
    }else if (indexPath.row == 5) {  //实名认证
        
        JNSHReallNameController *RealNameVc = [[JNSHReallNameController alloc] init];
        RealNameVc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:RealNameVc animated:YES];
        
    }
    
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat y = scrollView.contentOffset.y;
    
    //NSLog(@"移动:%f",y);
    
    //控制导航栏的透明度
    if (y >= 64) {
        barBackImg.alpha = 1;
        self.navigationItem.title = @"我";
    }else if (y < 64) {
        barBackImg.alpha = 0;
        self.navigationItem.title = @"";
        
    }
    
    //控制背景色
    if (y < 0) {
        CGRect frame = headImageView.frame;
        frame.origin.y = y;
        frame.size.height = -y;
        headImageView.frame = frame;
    }
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
