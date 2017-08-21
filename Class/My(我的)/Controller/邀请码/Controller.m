//
//  Controller.m
//  JieNiuShenghuo
//
//  Created by rongfeng on 2017/8/18.
//  Copyright © 2017年 China Zhou. All rights reserved.
//

#import "Controller.h"

@interface Controller ()

@end

@implementation Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"邀请";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationController.navigationBar.barTintColor = blueColor;
    
}

- (void)viewWillDisappear:(BOOL)animated {
    
    self.navigationController.navigationBar.barTintColor = ColorTabBarBackColor;
    
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
