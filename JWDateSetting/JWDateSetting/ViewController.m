//
//  ViewController.m
//  JWDateSetting
//
//  Created by jianwei.chen on 15/9/12.
//  Copyright (c) 2015年 jianwei.chen. All rights reserved.
//

#import "ViewController.h"
#import "NSDate+DateSetting.h"

@interface NSDate(ViewController)

@end

@implementation NSDate(ViewController)

- (NSDateFormatter *)sharedDateFormatter
{
    static NSDateFormatter *sDateFormatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (sDateFormatter == nil) {
            sDateFormatter = [[NSDateFormatter alloc] init];
        }
    });
    return sDateFormatter;
}

- (NSString *)fullStyleDateTime {
    [[self sharedDateFormatter] setDateFormat:@"yyyy-MM-dd HH:mm"];
    return [[self sharedDateFormatter] stringFromDate:self];
}

@end

@interface ViewController ()<UITableViewDataSource>

@end

static NSInteger const sOneDayTime = 24 * 60 * 60;

@implementation ViewController{
    UITableView *_tableView;
    NSMutableArray *_dataSources;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    _dataSources = [NSMutableArray arrayWithCapacity:20];
    
    NSDate *currentDate = [NSDate date];
    for (NSInteger i = 0; i < 20; i++) {
        [_dataSources addObject:[currentDate dateByAddingTimeInterval:sOneDayTime *i]];
    }
    [UIApplication sharedApplication];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dateSettingChanged:) name:JWDateSettingChangedNotification object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

#pragma mark -UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_dataSources count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * const reuseIdentifier = @"cellID";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    NSDate *date = _dataSources[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@",[NSDate isDaySetting24Hours]?@"24 小时制时间：":@"12小时制时间",[date fullStyleDateTime]];
    return cell;
}

#pragma mark -Notification
- (void)dateSettingChanged:(NSNotification *)notification{
    [_tableView reloadData];
}
@end
