//
//  RGTableDatasource.m
//  Demo
//
//  Created by TingtingYan on 2018/2/23.
//  Copyright © 2018年 ranger. All rights reserved.
//

#import "RGTableDatasource.h"

@implementation RGTableDatasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * reuseIdentifier = @"Cell";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"RGTableDatasource => %tu", indexPath.row];
    
    return cell;
}

@end
