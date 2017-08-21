//
//  JNSHCashDeskViewController.m
//  JieNiuShenghuo
//
//  Created by rongfeng on 2017/8/21.
//  Copyright © 2017年 China Zhou. All rights reserved.
//

#import "JNSHCashDeskViewController.h"
#import "Masonry.h"
#import "JNSHAlertView.h"

@interface JNSHCashDeskViewController ()

@end

@implementation JNSHCashDeskViewController {
    
    UILabel *moneyLab;
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    self.title = @"收银台";
    
    self.view.backgroundColor = ColorTabBarBackColor;
    
    self.navigationController.navigationBar.barTintColor = ColorTabBarBackColor;
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    //返回按钮
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:nil];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
//    UIImageView *NavBarBackImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, KscreenWidth, 64)];
//    NavBarBackImg.backgroundColor = ColorTabBarBackColor;
//    [self.view addSubview:NavBarBackImg];
    
    
    //灰色背景
    UIImageView *backImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 64, KscreenWidth, KscreenHeight)];
    backImg.userInteractionEnabled = YES;
    backImg.backgroundColor = ColorTableBackColor;
    
    [self.view addSubview:backImg];
    
    //金额
    UIImageView *cashBackImg = [[UIImageView alloc] init];
    cashBackImg.backgroundColor = [UIColor whiteColor];
    cashBackImg.userInteractionEnabled = YES;
    [backImg addSubview:cashBackImg];
    
    [cashBackImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(backImg).offset([JNSHAutoSize height:40]);
        make.left.right.equalTo(backImg);
        make.height.mas_equalTo([JNSHAutoSize height:101]);
    }];
    
    UILabel *titleLab = [[UILabel alloc] init];
    titleLab.text = @"金额";
    titleLab.textColor = ColorText;
    titleLab.font = [UIFont systemFontOfSize:15];
    titleLab.textAlignment = NSTextAlignmentLeft;
    
    [cashBackImg addSubview:titleLab];
    
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(cashBackImg).offset([JNSHAutoSize height:16]);
        make.left.equalTo(cashBackImg).offset([JNSHAutoSize width:15]);
        make.size.mas_equalTo(CGSizeMake([JNSHAutoSize width:60], [JNSHAutoSize height:15]));
    }];
    
    UILabel *leftLab = [[UILabel alloc] init];
    leftLab.textAlignment = NSTextAlignmentLeft;
    leftLab.text = @"￥";
    leftLab.textColor = ColorText;
    leftLab.font = [UIFont fontWithName:@"ArialMT" size:24];
    [cashBackImg addSubview:leftLab];
    
    
    [leftLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(titleLab);
        make.bottom.equalTo(cashBackImg).offset(-[JNSHAutoSize width:25]);
        make.size.mas_equalTo(CGSizeMake([JNSHAutoSize width:20], [JNSHAutoSize height:18]));
    }];
    
    moneyLab = [[UILabel alloc] init];
    moneyLab.textColor = ColorTabBarBackColor;
    moneyLab.textAlignment = NSTextAlignmentLeft;
    moneyLab.font  = [UIFont fontWithName:@"Arial-BoldMT" size:30];
    moneyLab.text = @"0";
    [cashBackImg addSubview:moneyLab];
    
    [moneyLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(leftLab.mas_right).offset([JNSHAutoSize width:18]);
        make.bottom.equalTo(leftLab).offset([JNSHAutoSize height:2]);
        make.size.mas_equalTo(CGSizeMake(KscreenWidth - [JNSHAutoSize width:60], [JNSHAutoSize height:27]));
    }];
    
    //温馨提示
    UITextView *textView = [[UITextView alloc] init];
    textView.textAlignment = NSTextAlignmentLeft;
    textView.editable = NO;
    textView.backgroundColor = [UIColor clearColor];
    textView.font = [UIFont systemFontOfSize:13];
    textView.userInteractionEnabled = NO;
    textView.textColor = ColorText;
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:@"温馨提示：\n1、会员费率：0.39%+3；非会员费率：0.53%+3；\n2、单笔2万，单卡5万，每日10万；\n3、交易到账时间09：00-21：00。"];
    [attrStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:NSMakeRange(0, 5)];
    [attrStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(8, 12)];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 10;
    
    [attrStr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, attrStr.length)];
    textView.attributedText = attrStr;
    
    [backImg addSubview:textView];
    
    [textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(cashBackImg.mas_bottom).offset([JNSHAutoSize height:36]);
        make.left.equalTo(backImg).offset([JNSHAutoSize width:15]);
        make.size.mas_equalTo(CGSizeMake(KscreenWidth - [JNSHAutoSize width:32], [JNSHAutoSize height:120]));
    }];
    
    //数字键盘
    
    NSArray *array = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@".",@"0",@"X"];
    
    CGFloat width = (KscreenWidth - 2*3)/4.0;
    CGFloat height = [JNSHAutoSize height:64];
    
    for (NSInteger i = 0; i < 4; i++) {
        for (NSInteger j = 0; j < 3; j++) {
            UIButton *numberBtn = [[UIButton alloc] init];
            numberBtn.tag = 3*i + j;
            [numberBtn setTitle:array[3*i+j] forState:UIControlStateNormal];
            numberBtn.backgroundColor = [UIColor whiteColor];
            
            [numberBtn setTitleColor:ColorText forState:UIControlStateNormal];
            numberBtn.titleLabel.font = [UIFont systemFontOfSize:20];
            numberBtn.frame = CGRectMake(j*(width + 2), (KscreenHeight-64) - ((4-i)*(height) + (3- i)*2), width, height);
            [numberBtn addTarget:self action:@selector(numSelect:) forControlEvents:UIControlEventTouchUpInside];
            
            [backImg addSubview:numberBtn];
        }
    }
    
    //删除
    UIButton *delectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    delectBtn.tag = 12;
    [delectBtn setBackgroundColor:[UIColor whiteColor]];
    [delectBtn setImage:[UIImage imageNamed:@"cashier_delete"] forState:UIControlStateNormal];
    [delectBtn setAdjustsImageWhenHighlighted:YES];
    [delectBtn addTarget:self action:@selector(numSelect:) forControlEvents:UIControlEventTouchUpInside];
    delectBtn.frame = CGRectMake(KscreenWidth - width, (KscreenHeight-64) - ((4)*(height) + (3)*2), width, height * 2 + 2);
    
    [backImg addSubview:delectBtn];
    
    //确定
    UIButton *payBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    payBtn.tag = 13;
    [payBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [payBtn setTitle:@"确定" forState:UIControlStateNormal];
    payBtn.titleLabel.font = [UIFont systemFontOfSize:18];
    [payBtn setBackgroundColor:ColorTabBarBackColor];
    [payBtn addTarget:self action:@selector(numSelect:) forControlEvents:UIControlEventTouchUpInside];
    payBtn.frame = CGRectMake(KscreenWidth - width, (KscreenHeight-64) - ((2)*(height) + 2*2), width, height * 2 + 2*2);
    [backImg addSubview:payBtn];
    
}


- (void)numSelect:(UIButton *)sender {

    //NSLog(@"%@",sender.titleLabel.text);
    //NSLog(@"%ld",sender.tag);
    if (sender.tag < 9) {  //1~9
        
        if (moneyLab.text.length > 7) { //限定8位
            return;
        }
        
        if ([moneyLab.text containsString:@"."]) {  //判断小数点后位数
            
            NSArray *array = [moneyLab.text componentsSeparatedByString:@"."];
            NSString *lastStr = array.lastObject;
            if (lastStr.length > 1) {
                
                [self show:@"精确到分" cancle:nil sureStr:@"确定"];
                
                return;
            }
            
        }
        
        if (![moneyLab.text isEqualToString:@"0"]) {
            
            NSString *str = [NSString stringWithFormat:@"%@%@",moneyLab.text,sender.titleLabel.text];
            
            if ([str floatValue] > 20000) {  //金额不能大于2W
                
                [self show:@"金额不能超过20000" cancle:nil sureStr:@"确定"];
                
                return;
            }
            
            moneyLab.text = [NSString stringWithFormat:@"%@%@",moneyLab.text,sender.titleLabel.text];
            
        }else {
            
           
            
            moneyLab.text = [NSString stringWithFormat:@"%@",sender.titleLabel.text];
        }
    }else if (sender.tag == 9) {   //.
        
        if (![moneyLab.text isEqualToString:@"0"] ) {
            
            if ([moneyLab.text containsString:@"."]) {  //判断之前有没有小数点
                return;
            }else {
                
                NSString *laststr = [moneyLab.text substringFromIndex:moneyLab.text.length -1];
                if (![laststr isEqualToString:@"."]) {
                    moneyLab.text = [NSString stringWithFormat:@"%@%@",moneyLab.text,sender.titleLabel.text];
                }
            }
        }
        
    }else if (sender.tag == 10) {  //0
        if (![moneyLab.text isEqualToString:@"0"]) {
            
            if ([moneyLab.text containsString:@"."]) {  //判断小数点后位数
                
                NSArray *array = [moneyLab.text componentsSeparatedByString:@"."];
                NSString *lastStr = array.lastObject;
                if (lastStr.length > 1) {
                    
                    [self show:@"精确到分" cancle:nil sureStr:@"确定"];
                    
                    return;
                }
                
            }
            
            NSString *str = [NSString stringWithFormat:@"%@%@",moneyLab.text,sender.titleLabel.text];
            
            if ([str floatValue] > 20000) {  //金额不能大于2W
                
                [self show:@"金额不能超过20000" cancle:nil sureStr:@"确定"];
                
                return;
            }
            
            moneyLab.text = [NSString stringWithFormat:@"%@0",moneyLab.text];
        }
        
    }else if (sender.tag == 11) {  //X
        if (![moneyLab.text isEqualToString:@"0"]) {
            
            if (1 >= moneyLab.text.length) {
                moneyLab.text = @"0";
            }else{
                moneyLab.text = [moneyLab.text substringToIndex:moneyLab.text.length-1];
            }
        }
        
    }else if (sender.tag == 12) {  //全清
        
        moneyLab.text = @"0";
        
    }else if (sender.tag == 13) {  //确定
        
        NSLog(@"确定");
        
        [self show:@"请进行实名认证" cancle:@"取消" sureStr:@"去认证"];
       
        
    }
    
}

- (void) show:(NSString *)msg cancle:(NSString *)cancleStr sureStr:(NSString *)sureStr {
    
    JNSHAlertView *alert = [[JNSHAlertView alloc] initWithFrame:CGRectMake(0, 0, KscreenWidth, KscreenHeight) cancle:cancleStr sure:sureStr];
    __block typeof(JNSHAlertView) *blockAlert = alert;
    alert.sureAlertBlock = ^{
        [blockAlert dismiss];
    };
    [alert show:msg inView:self.view];
    
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
