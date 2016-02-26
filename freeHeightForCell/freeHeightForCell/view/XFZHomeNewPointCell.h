//
//  XFZHomeNewPointCell.h
//  freeHeightForCell
//
//  Created by CHENZICHU on 15/12/25.
//  Copyright © 2015年 CHENZICHU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserPoint.h"


@interface XFZHomeNewPointCell : UITableViewCell
// 新观点模型
@property (nonatomic, strong) UserPoint *point;
// 底部分割线
@property (weak, nonatomic) IBOutlet UIView *bottomLineView;
@end
