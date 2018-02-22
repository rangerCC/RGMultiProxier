//
//  RGScrollDelegate.m
//  Demo
//
//  Created by TingtingYan on 2018/2/23.
//  Copyright © 2018年 ranger. All rights reserved.
//

#import "RGScrollDelegate.h"

@implementation RGScrollDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"RGScrollDelegate => %@", [NSString stringWithFormat:@"%.2f", scrollView.contentOffset.y]);
}

@end
