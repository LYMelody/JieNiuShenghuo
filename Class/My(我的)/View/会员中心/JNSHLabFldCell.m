//
//  JNSHLabFldCell.m
//  JieNiuShenghuo
//
//  Created by rongfeng on 2017/8/10.
//  Copyright © 2017年 China Zhou. All rights reserved.
//

#import "JNSHLabFldCell.h"
#import "Masonry.h"
@implementation JNSHLabFldCell


- (instancetype)init {
    
    if ([super init]) {
        [self setUpViews];
    }
    
    return self;
    
}


- (void)setUpViews{
    
    _leftLab = [[UILabel alloc] init];
    _leftLab.font = [UIFont systemFontOfSize:15];
    _leftLab.textColor = ColorText;
    _leftLab.textAlignment = NSTextAlignmentLeft;
    
    [self.contentView addSubview:_leftLab];
    
    _textFiled = [[UITextField alloc] init];
    _textFiled.textAlignment = NSTextAlignmentLeft;
    _textFiled.font = [UIFont systemFontOfSize:14];
    _textFiled.textColor = ColorLightText;
    
    [self.contentView addSubview:_textFiled];
    
    _bottomLine = [[UIImageView alloc] init];
    _bottomLine.backgroundColor = ColorTableBackColor;
    [self.contentView addSubview:_bottomLine];
    
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    [_leftLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self).offset([JNSHAutoSize width:16]);
        make.size.mas_equalTo(CGSizeMake([JNSHAutoSize width:80], [JNSHAutoSize height:20]));
    }];
    
    [_textFiled mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(_leftLab.mas_right).offset([JNSHAutoSize width:10]);
        make.height.mas_equalTo( [JNSHAutoSize height:20]);
        make.right.equalTo(self).offset(-[JNSHAutoSize width: 10]);
    }];
    
    [_bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.right.equalTo(self);
        make.left.equalTo(self).offset([JNSHAutoSize width:16]);
        make.height.mas_equalTo([JNSHAutoSize height:SeperateLineWidth]);
    }];
    
}


@end
