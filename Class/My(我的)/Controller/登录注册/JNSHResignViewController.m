//
//  JNSHResignViewController.m
//  JieNiuShenghuo
//
//  Created by rongfeng on 2017/8/24.
//  Copyright © 2017年 China Zhou. All rights reserved.
//

#import "JNSHResignViewController.h"
#import "JNSHGetCodeCell.h"
#import "JNSHLabFldCell.h"
#import "Masonry.h"
#import "JNSHCommonButton.h"
@interface JNSHResignViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation JNSHResignViewController {
    
    NSTimer *timer;
    NSInteger index;
    JNSHGetCodeCell *CodeCell;
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    self.title = @"账户注册";
    self.view.backgroundColor = ColorTabBarBackColor;
    
    //self.navigationController.navigationBar.hidden = NO;
    
    self.navigationController.navigationBar.barTintColor = ColorTabBarBackColor;
    //设置导航栏标题颜色
    [self.navigationController.navigationBar setTitleTextAttributes:@{
                                                                      NSForegroundColorAttributeName:[UIColor whiteColor]
                                                                      }];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *tabbarBackimg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, KscreenWidth, 64)];
    tabbarBackimg.backgroundColor = ColorTabBarBackColor;
    [self.view addSubview:tabbarBackimg];
    
    UITableView *table = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, KscreenWidth, KscreenHeight-64) style:UITableViewStylePlain];
    table.delegate = self;
    table.dataSource = self;
    table.backgroundColor = ColorTableBackColor;
    table.separatorStyle = UITableViewCellSeparatorStyleNone;
    table.scrollEnabled = NO;
    
    
    
    [self.view addSubview:table];
    
    //headerView
    
    UIImageView *headerView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, KscreenWidth, [JNSHAutoSize height:15])];
    headerView.backgroundColor = ColorTableBackColor;
    
    table.tableHeaderView = headerView;
    
    //footView
    
    UIImageView *footView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, KscreenWidth, [JNSHAutoSize height:120])];
    footView.userInteractionEnabled = YES;
    //记住密码
    UIButton *remberBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [remberBtn setImage:[UIImage imageNamed:@"---checkmark"] forState:UIControlStateNormal];
    [remberBtn setImage:[UIImage imageNamed:@"unchecked"] forState:UIControlStateSelected];
    [remberBtn addTarget:self action:@selector(rember:) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:remberBtn];
    
    [remberBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(footView).offset([JNSHAutoSize width:16]);
        make.top.equalTo(footView).offset([JNSHAutoSize height:15]);
        make.size.mas_equalTo(CGSizeMake([JNSHAutoSize width:14], [JNSHAutoSize height:15]));
    }];
    
    UILabel *rightLab = [[UILabel alloc] init];
    rightLab.text = @"同意用户协议";
    rightLab.font = [UIFont systemFontOfSize:13];
    rightLab.textColor = ColorTabBarBackColor;
    rightLab.textAlignment = NSTextAlignmentLeft;
    [footView addSubview:rightLab];
    
    [rightLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(remberBtn);
        make.left.equalTo(remberBtn.mas_right).offset([JNSHAutoSize width:5]);
        make.size.mas_equalTo(CGSizeMake([JNSHAutoSize width:200], [JNSHAutoSize height:15]));
    }];
    
    JNSHCommonButton *ResignBtn = [[JNSHCommonButton alloc] init];
    [ResignBtn setTitle:@"注册" forState:UIControlStateNormal];
    [ResignBtn addTarget:self action:@selector(resign) forControlEvents:UIControlEventTouchUpInside];
    ResignBtn.enabled = NO;
    [footView addSubview:ResignBtn];
    
    [ResignBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(remberBtn.mas_bottom).offset([JNSHAutoSize height:60]);
        make.left.equalTo(footView).offset([JNSHAutoSize width:15]);
        make.right.equalTo(footView).offset(-[JNSHAutoSize width:15]);
        make.height.mas_equalTo([JNSHAutoSize height:41]);
    }];
    
    
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

    
    //客服电话
    
    UILabel *lab = [[UILabel alloc] init];
    lab.font = [UIFont systemFontOfSize:14];
    lab.textAlignment = NSTextAlignmentCenter;
    lab.textColor = ColorTabBarBackColor;
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:@"客服电话：400-1200-1200"];
    [attr addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, 5)];
    
    lab.attributedText = attr;
    
    [table addSubview:lab];
    
    [lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(self.view).offset(-[JNSHAutoSize height:40]);
        make.size.mas_equalTo(CGSizeMake(KscreenWidth, [JNSHAutoSize height:20]));
    }];
    
    
    
}
//注册
- (void)resign {
    
    NSLog(@"注册");
    
}


//同意
- (void)rember:(UIButton *)btn {
    
    btn.selected = !btn.selected;
    
    NSLog(@"同意");
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 5;
    
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
            CodeCell.showBottom = YES;
            CodeCell.textFiled.keyboardType = UIKeyboardTypeNumberPad;
            
            __weak typeof(self) weakSelf = self;
            
            CodeCell.getcodeBlock = ^{
                __strong typeof(self) strongSelf = weakSelf;
                [strongSelf getcode];
            };

            
            cell = CodeCell;
        }else if (indexPath.row == 1) {
            
            JNSHLabFldCell *Cell = [[JNSHLabFldCell alloc] init];
            Cell.leftLab.text = @"设置密码";
            Cell.textFiled.placeholder = @"由6-20位字母、书籍或符号组成";
            cell = Cell;
            
        }else if (indexPath.row == 2) {
            cell.backgroundColor = ColorTableBackColor;
            
        }else if (indexPath.row == 3) {
            JNSHLabFldCell *Cell = [[JNSHLabFldCell alloc] init];
            Cell.leftLab.text = @"验证码";
            Cell.textFiled.placeholder = @"请输入验证码";
            Cell.textFiled.keyboardType = UIKeyboardTypeNumberPad;
            cell = Cell;
        }else if (indexPath.row == 4) {
            JNSHLabFldCell *Cell = [[JNSHLabFldCell alloc] init];
            Cell.leftLab.text = @"邀请码";
            Cell.textFiled.placeholder = @"邀请码为11位手机号码";
            Cell.textFiled.keyboardType = UIKeyboardTypeNumberPad;
            cell = Cell;
        }
    }
    cell.selectionStyle = UITableViewCellSeparatorStyleNone;
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 2) {
        return 15;
    }
    
    return 41;
    
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
        
        [CodeCell.codeBtn setTitle:[NSString stringWithFormat:@"重新获取%lds",(long)index] forState:UIControlStateNormal];
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
