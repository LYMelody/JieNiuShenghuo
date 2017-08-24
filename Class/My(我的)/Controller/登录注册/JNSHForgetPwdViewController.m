//
//  JNSHForgetPwdViewController.m
//  JieNiuShenghuo
//
//  Created by rongfeng on 2017/8/24.
//  Copyright © 2017年 China Zhou. All rights reserved.
//

#import "JNSHForgetPwdViewController.h"
#import "JNSHGetCodeCell.h"
#import "JNSHLabFldCell.h"
#import "JNSHCommonButton.h"
@interface JNSHForgetPwdViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation JNSHForgetPwdViewController {
    
    NSTimer *timer;
    NSInteger index;
    JNSHGetCodeCell *CodeCell;
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    self.title = @"忘记密码";
    self.view.backgroundColor = ColorTabBarBackColor;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *backImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, KscreenWidth, 64)];
    backImg.backgroundColor = ColorTabBarBackColor;
    
    [self.view addSubview:backImg];
    
    UITableView *table = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, KscreenWidth, KscreenHeight - 64) style:UITableViewStylePlain];
    table.delegate = self;
    table.dataSource = self;
    table.backgroundColor = ColorTableBackColor;
    table.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:table];
    
    //headerView
    UIImageView *headerView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, KscreenWidth, [JNSHAutoSize height:15])];
    headerView.userInteractionEnabled = YES;
    headerView.backgroundColor = ColorTableBackColor;
    
    table.tableHeaderView = headerView;
    
    //tablefootView
    UIImageView *footView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, KscreenWidth, [JNSHAutoSize height:100])];
    footView.backgroundColor = ColorTableBackColor;
    footView.userInteractionEnabled = YES;
    
    JNSHCommonButton *CommitBtn = [[JNSHCommonButton alloc] initWithFrame:CGRectMake([JNSHAutoSize width:15], [JNSHAutoSize height:40], (KscreenWidth - [JNSHAutoSize width:30]), [JNSHAutoSize height:41])];
    [CommitBtn addTarget:self action:@selector(commit) forControlEvents:UIControlEventTouchUpInside];
    [CommitBtn setTitle:@"保存" forState:UIControlStateNormal];
    CommitBtn.enabled = NO;
    [footView addSubview:CommitBtn];
    
    table.tableFooterView = footView;
    
    //禁止滑动延迟
    table.delaysContentTouches = NO;
    for(id view in table.subviews) {
        
        if ([NSStringFromClass([view class]) isEqualToString:@"UITableViewWrapperView"]) {
            if ([view isKindOfClass:[UIScrollView class]]) {
                UIScrollView *scrrowView = (UIScrollView *)view;
                scrrowView.delaysContentTouches = NO;
            }
            break;
        }
    }
    
}

- (void)commit {
    
    NSLog(@"保存");
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return 3;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identy = @"identy";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identy];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] init];
        if (indexPath.row == 0) {
            
            CodeCell = [[JNSHGetCodeCell alloc] init];
            CodeCell.leftLab.text = @"手机号码";
            CodeCell.textFiled.placeholder = @"请输入手机号码";
            CodeCell.textFiled.keyboardType = UIKeyboardTypeNumberPad;
            CodeCell.showBottom = YES;
            __weak typeof(self) weakSelf = self;
            CodeCell.getcodeBlock = ^{
                __strong typeof(self) strongSelf = weakSelf;
                [strongSelf getcode];
            };
            cell = CodeCell;
        }else if (indexPath.row == 1) {
            JNSHLabFldCell *Cell = [[JNSHLabFldCell alloc] init];
            Cell.leftLab.text = @"设置密码";
            Cell.textFiled.placeholder = @"由6-20位字母、数字或符号组成";
            cell = Cell;
            
        }else if (indexPath.row == 2) {
            JNSHLabFldCell *Cell = [[JNSHLabFldCell alloc] init];
            Cell.leftLab.text = @"验证码";
            Cell.textFiled.placeholder = @"请输入验证码";
            Cell.textFiled.keyboardType = UIKeyboardTypeNumberPad;
            cell = Cell;
        }
        
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;

}

//获取验证码
- (void)getcode {
    
    CodeCell.codeBtn.enabled = NO;
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
    index = 60;
    
}

- (void)countDown {
    
    index--;
    
    if (index < 0) {
        [CodeCell.codeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        [CodeCell.codeBtn setBackgroundColor:ColorTabBarBackColor];
        CodeCell.codeBtn.enabled = YES;
        [timer invalidate];
    }else {
        
        [CodeCell.codeBtn setTitle:[NSString stringWithFormat:@"重新获取%lds",index] forState:UIControlStateNormal];
        [CodeCell.codeBtn setBackgroundColor:GrayColor];
        CodeCell.codeBtn.enabled = NO;
        
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
