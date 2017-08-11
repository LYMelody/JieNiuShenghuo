//
//  JNSHAutoSize.m
//  JieNiuShenghuo
//
//  Created by rongfeng on 2017/8/9.
//  Copyright © 2017年 China Zhou. All rights reserved.
//

#import "JNSHAutoSize.h"

@implementation JNSHAutoSize

+ (CGFloat)height:(CGFloat)height {
    
    CGFloat h = 0;
   
    if (KscreenHeight == 568) {         //4.0寸
        h = height * 568/667.0;
    }else if (KscreenHeight == 736) {   //5.5寸
        h = height * 736/667.0;
    }else if (KscreenHeight == 480) {   //3.5寸
        h = height * 480/667.0;
    }else {                             //4.7寸
        h = height;
    }

    return h;
}


+ (CGFloat)width:(CGFloat)width {
    
    CGFloat w = 0;
    
    if (KscreenHeight == 568) {        //4.0寸
        w = width * 320/375.0;
    }else if (KscreenHeight == 736) {  //5.5寸
        w = width * 424/375.0;
    }else if (KscreenHeight == 480) {  //3.5寸
        w = width * 320/375.0;
    }else {                            //4.7寸
        w = width;
    }
    
    return w;
    
}


@end
