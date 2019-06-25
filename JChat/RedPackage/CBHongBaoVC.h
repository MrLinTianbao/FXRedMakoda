//
//  CBHongBaoVC.h
//  PersonCar
//
//  Created by cheBaidu on 2018/2/6.
//  Copyright © 2018年 车佰度. All rights reserved.
//

#import <UIKit/UIKit.h>

//红包回调
typedef void (^RedBlock)(NSString*,NSString*,NSString*);

@interface CBHongBaoVC : UIViewController

@property (nonatomic, copy)RedBlock redblock;

@end
