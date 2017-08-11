//
//  JNSHAlertView.m
//  JieNiuShenghuo
//
//  Created by rongfeng on 2017/8/11.
//  Copyright © 2017年 China Zhou. All rights reserved.
//

#import "JNSHAlertView.h"
#import "Masonry.h"

@implementation JNSHAlertView

- (id)initWithFrame:(CGRect)frame {
    
    if ([super initWithFrame:frame]) {
        
        _color = blueColor;
        
        [self setUpViews];
    }
    
    return self;
    
}


- (void)setUpViews{
    
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.0];
    self.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
    tap.numberOfTapsRequired = 1;
    
    [self addGestureRecognizer:tap];
    
    
    _contentView = [[UIView alloc] init];
    _contentView.backgroundColor = [UIColor whiteColor];
    _contentView.layer.cornerRadius = 3;
    _contentView.layer.masksToBounds = YES;
    _contentView.frame = CGRectMake((KscreenWidth - 211)/2.0, KscreenHeight, [JNSHAutoSize width:211], [JNSHAutoSize height:106]);

    _contentView.center = self.center;
    _contentView.hidden = YES;
    [self addSubview:_contentView];
    
    _messageLab = [[UILabel alloc] initWithFrame:CGRectMake(0, [JNSHAutoSize height:28], [JNSHAutoSize width:211], [JNSHAutoSize height:15])];
    _messageLab.font = [UIFont systemFontOfSize:15];
    _messageLab.textColor = ColorText;
    _messageLab.textAlignment = NSTextAlignmentCenter;
    
    [_contentView addSubview:_messageLab];
    
    _sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_sureBtn setTitle:@"确定" forState:UIControlStateNormal];
    [_sureBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _sureBtn.layer.cornerRadius = 3;
    _sureBtn.layer.masksToBounds = YES;
    _sureBtn.backgroundColor = blueColor;
    _sureBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    _sureBtn.frame = CGRectMake([JNSHAutoSize width:(111)]/2.0, [JNSHAutoSize height:62], [JNSHAutoSize width:100], [JNSHAutoSize height:26]);
    [_sureBtn addTarget:self action:@selector(sure) forControlEvents:UIControlEventTouchUpInside];
    [_contentView addSubview:_sureBtn];

}

- (void)sure {
    
    [self dismiss];
    
}

- (void)show:(NSString *)message inView:(UIView *)view {
    
    if (!view) {
        return;
    }
    
    [view addSubview:self];
    [view addSubview:_contentView];
    
    _messageLab.text = message;
    
    [UIView animateWithDuration:0.2 animations:^{
        
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.2];
        _contentView.hidden = NO;
        _contentView.center = self.center;
        _contentView.transform = CGAffineTransformMakeScale(1.2, 1.2);
        
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.1 animations:^{
            _contentView.transform = CGAffineTransformMakeScale(0.9, 0.9);
        } completion:^(BOOL finished) {
            _contentView.transform = CGAffineTransformMakeScale(1, 1);
        }];
    }];
    
    
}

- (void)dismiss {
    
    [UIView animateWithDuration:0.3 animations:^{
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
//        _contentView.frame = CGRectMake((KscreenWidth - 211)/2.0, KscreenHeight,  [JNSHAutoSize width:211], [JNSHAutoSize height:106]);
        _contentView.hidden = YES;
        
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        
        [_contentView removeFromSuperview];
    }];
    
}

- (void)setColor:(UIColor *)color {
    
    _color = color;
    
    [_sureBtn setBackgroundColor:color];
    
    
    
}

@end
