//
//  RGTableDelegate.m
//  Demo
//
//  Created by TingtingYan on 2018/2/23.
//  Copyright © 2018年 ranger. All rights reserved.
//

#import "RGTableDelegate.h"

@implementation RGTableDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"RGTableDelegate => Touched: %tu", indexPath.row);
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"RGTableDelegate => %@", [NSString stringWithFormat:@"%.2f", scrollView.contentOffset.y]);
}

@end
