//
//  ViewController.m
//  Demo
//
//  Created by TingtingYan on 2018/2/23.
//  Copyright © 2018年 ranger. All rights reserved.
//

#import "ViewController.h"
#import <RGMultiProxier/RGMultiProxier.h>

#import "RGTableDatasource.h"
#import "RGTableDelegate.h"
#import "RGScrollDelegate.h"

@interface ViewController ()<UITableViewDataSource>
@property (nonatomic, strong) UITableView * tableView;

@property (nonatomic, strong) RGProxier <UITableViewDataSource> * multiProxyDatasource;
@property (nonatomic, strong) RGProxier <UITableViewDelegate> * multiProxyDelegate;

@property (nonatomic, strong) RGTableDatasource * tableViewDatasource;
@property (nonatomic, strong) RGTableDelegate * tableViewDelegate;
@property (nonatomic, strong) RGScrollDelegate * scrollViewDelegate;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.tableViewDatasource = [[RGTableDatasource alloc] init];
    self.tableViewDelegate = [[RGTableDelegate alloc] init];
    self.scrollViewDelegate = [[RGScrollDelegate alloc] init];
    
    // 无返回值代理方法，多个代理同时实现时，都执行
    // 有返回值代理方法，多个代理同时实现时，以最后一个代理执行结果为准
    self.multiProxyDelegate = RGMultiProxierForProtocol(UITableViewDelegate, self.tableViewDelegate, self.scrollViewDelegate);
//    self.multiProxyDatasource = RGMultiProxierForProtocol(UITableViewDataSource, self.tableViewDatasource, self);
    self.multiProxyDatasource = RGMultiProxierForProtocol(UITableViewDataSource, self,  self.tableViewDatasource);
    
    self.tableView.delegate = self.multiProxyDelegate;
    self.tableView.dataSource = self.multiProxyDatasource;
    [self.view addSubview:self.tableView];
}

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
    
    cell.textLabel.text = [NSString stringWithFormat:@"ViewController => %tu", indexPath.row];
    
    return cell;
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor whiteColor];
    }
    return _tableView;
}
@end
