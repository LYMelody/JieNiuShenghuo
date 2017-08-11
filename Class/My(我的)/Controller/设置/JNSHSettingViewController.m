//
//  JNSHSettingViewController.m
//  JieNiuShenghuo
//
//  Created by rongfeng on 2017/8/8.
//  Copyright © 2017年 China Zhou. All rights reserved.
//

#import "JNSHSettingViewController.h"
#import "JNSHCommon.h"
#import "JNSHAccountInfoCell.h"
#import "JNSHSexCell.h"
#import "JNSYHighLightImageView.h"
#import "Masonry.h"
#import "JNSHReSetPwdViewController.h"
#import "JNSHUserProtocolViewController.h"
#import "JNSHAboutUsViewController.h"
#import "JNSHFeedBackViewController.h"
@interface JNSHSettingViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation JNSHSettingViewController {
    
    UITableView *table;
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    self.title = @"设置";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    [table reloadData];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //返回按钮
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:nil];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    
    table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KscreenWidth, KscreenHeight) style:UITableViewStylePlain];
    table.delegate = self;
    table.dataSource = self;
    table.backgroundColor = ColorTableBackColor;
    table.separatorStyle = UITableViewCellSeparatorStyleNone;
    table.showsVerticalScrollIndicator = NO;
    table.delaysContentTouches = NO;   //禁止滑动延迟
    table.tableHeaderView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 0, 15)];
    
    UITapGestureRecognizer *tapGus = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(logOut)];
    tapGus.numberOfTapsRequired =1;
    
    
    JNSYHighLightImageView *logOutBackView = [[JNSYHighLightImageView alloc] initWithFrame:CGRectMake(0, 20, KscreenWidth, 44)];
    logOutBackView.backgroundColor = [UIColor whiteColor];
    logOutBackView.userInteractionEnabled = YES;
    [logOutBackView addGestureRecognizer:tapGus];
    
   
    
    //上线
    UIImageView *TopLine = [[UIImageView alloc] init];
    TopLine.backgroundColor = ColorLineSeperate;
    [logOutBackView addSubview:TopLine];
    
    [TopLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(logOutBackView);
        make.height.mas_equalTo(SeperateLineWidth);
    }];
    
    //下线
    UIImageView *bottomLine = [[UIImageView alloc] init];
    bottomLine.backgroundColor = ColorLineSeperate;
    [logOutBackView addSubview:bottomLine];
    
    [bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(logOutBackView);
        make.height.mas_equalTo(SeperateLineWidth);
    }];
    
    
    UILabel *logOutLab = [[UILabel alloc] init];
    logOutLab.text = @"退出登录";
    logOutLab.font = [UIFont systemFontOfSize:15];
    logOutLab.textAlignment = NSTextAlignmentCenter;
    logOutLab.textColor = ColorTabBarBackColor;
    [logOutBackView addSubview:logOutLab];
    
    [logOutLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(logOutBackView);
        make.size.mas_equalTo(CGSizeMake([JNSHAutoSize width:100], [JNSHAutoSize height:15]));
    }];
    
    table.tableFooterView = logOutBackView;
    
    [self.view addSubview:table];
    
}

- (void)logOut {
    
    NSLog(@"退出登录");
    
}

- (BOOL)touchesShouldCancelInContentView:(UIView *)view
{
    if ([view isKindOfClass:[UIImageView class]])
    {
        return YES;
    }
    
    return [table touchesShouldCancelInContentView:view];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 6;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identy = @"identy";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identy];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] init];
        
        if (indexPath.row == 0) {
            
            JNSHSexCell *Cell = [[JNSHSexCell alloc] init];
            Cell.leftLab.text = @"登录密码";
            Cell.showTopLine = YES;
            cell = Cell;
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }else if (indexPath.row == 1) {
            JNSHSexCell *Cell = [[JNSHSexCell alloc] init];
            Cell.leftLab.text = @"用户协议";
            cell = Cell;
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            
        }else if (indexPath.row == 2) {
            JNSHSexCell *Cell = [[JNSHSexCell alloc] init];
            Cell.leftLab.text = @"关于我们";
            cell = Cell;
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }else if (indexPath.row == 3) {
            JNSHSexCell *Cell = [[JNSHSexCell alloc] init];
            Cell.leftLab.text = @"意见反馈";
            cell = Cell;
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }else if (indexPath.row == 4) {
            JNSHAccountInfoCell *Cell = [[JNSHAccountInfoCell alloc] init];
            Cell.leftLab.text = @"当前版本";
            Cell.rightLab.text = @"1.0.0";
            Cell.isLast = YES;
            cell = Cell;
            cell.accessoryType = UITableViewCellAccessoryNone;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }else {
            
            cell.backgroundColor = ColorTableBackColor;
            cell.accessoryType = UITableViewCellAccessoryNone;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 5) {
        return 20;
    }
    
    return 44;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        JNSHR_eSetPwdViewController *ReVc  = [[JNSHR_eSetPwdViewController alloc] init];
        ReVc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:ReVc animated:YES];
    }else if (indexPath.row == 1) {
        JNSHUserProtocolViewController *UserProtocolVc = [[JNSHUserProtocolViewController alloc] init];
        UserProtocolVc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:UserProtocolVc animated:YES];
    }else if (indexPath.row == 2) {
        JNSHAboutUsViewController *AboutUsVc = [[JNSHAboutUsViewController alloc] init];
        AboutUsVc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:AboutUsVc animated:YES];
    }else if (indexPath.row == 3) {
        JNSHFeedBackViewController *FeedBackVc = [[JNSHFeedBackViewController alloc] init];
        FeedBackVc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:FeedBackVc animated:YES];
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
