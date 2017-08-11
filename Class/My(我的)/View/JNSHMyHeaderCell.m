//
//  JNSHMyHeaderCell.m
//  JieNiuShenghuo
//
//  Created by rongfeng on 2017/8/4.
//  Copyright © 2017年 China Zhou. All rights reserved.
//

#import "JNSHMyHeaderCell.h"
#import "Masonry.h"
@implementation JNSHMyHeaderCell


- (instancetype)init {
    
    if ([super init]) {
        
        self.showVip = NO;
        
        [self setUpViews];
    }
    
    return self;
}



- (void)setUpViews{
    
    self.backgroundColor = ColorTabBarBackColor;
    
    _headerView = [[UIImageView alloc] init];
    _headerView.layer.cornerRadius = 3;
    _headerView.layer.masksToBounds = YES;
    _headerView.backgroundColor = [UIColor whiteColor];
    [self addSubview:_headerView];
    
    _nickNameLab = [[UILabel alloc] init];
    _nickNameLab.font = [UIFont systemFontOfSize:15];
    _nickNameLab.textColor = [UIColor whiteColor];
    _nickNameLab.textAlignment = NSTextAlignmentLeft;
    
    [self addSubview:_nickNameLab];
    
    
    _phoneLab = [[UILabel alloc] init];
    _phoneLab.font = [UIFont systemFontOfSize:15];
    _phoneLab.textAlignment = NSTextAlignmentLeft;
    _phoneLab.textColor = [UIColor whiteColor];
    
    [self addSubview:_phoneLab];
    
    
    _vipImgView = [[UIImageView alloc] init];
    _vipImgView.image = [UIImage imageNamed:@"my_head_vip"];
    _vipImgView.layer.masksToBounds = YES;
    _vipImgView.layer.cornerRadius = 5;
    _vipImgView.hidden = YES;
    [self addSubview:_vipImgView];
    
    _rightIndicatorView = [[UIImageView alloc] init];
    _rightIndicatorView.image = [UIImage imageNamed:@"my_arror_right_white"];
    
    [self addSubview:_rightIndicatorView];
    
    
}


- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    [_headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self).offset(15);
        make.size.mas_offset(CGSizeMake(46, 46));
    }];
    
    [_nickNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_headerView).offset(2);
        make.left.equalTo(_headerView.mas_right).offset(12);
        make.size.mas_equalTo(CGSizeMake(100, 20));
    }];
    
    [_phoneLab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_nickNameLab.mas_bottom).offset(5);
        make.left.equalTo(_nickNameLab);
        make.size.mas_equalTo(CGSizeMake(120, 20));
    }];
    
    [_vipImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_headerView.mas_right).offset(-3);
        make.centerY.equalTo(_headerView.mas_bottom).offset(-3);
    }];
    
    [_rightIndicatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.equalTo(self).offset(-15);
        make.size.mas_equalTo(CGSizeMake(8, 12));
    }];
    
}

- (void)setShowVip:(BOOL)showVip {
    
    if (showVip) {
        _vipImgView.hidden = NO;
    }else {
        _vipImgView.hidden = YES;
    }
    
}


@end
