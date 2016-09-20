//
//  ViewController.m
//  UITableView计算高度
//
//  Created by 荣耀iMac on 16/9/19.
//  Copyright © 2016年 wleleven. All rights reserved.
//

#import "ViewController.h"
#import "TestModel.h"
#import "TestCell.h"
#import "UITableView+FDTemplateLayoutCell.h"
#import "SubViewController.h"

static NSString *cellid = @"cellid";

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)NSMutableArray *dataArray;

@property (nonatomic,strong)UITableView *tableView;

@end

@implementation ViewController

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    SubViewController *subViewVC = [[SubViewController alloc]init];
    [self presentViewController:subViewVC animated:YES completion:nil];
}

-(NSMutableArray *)dataArray
{
    if (_dataArray == nil) {
        self.dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    return;
    
    self.tableView.fd_debugLogEnabled = YES;
    
    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor cyanColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    [_tableView registerNib:[UINib nibWithNibName:@"TestCell" bundle:nil] forCellReuseIdentifier:cellid];
    [self loadData];
}

-(void)loadData
{
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSString *dataFilePath = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"json"];
        NSData *data = [NSData dataWithContentsOfFile:dataFilePath];
        NSDictionary *rootDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSMutableArray *feedDicts = rootDict[@"feed"];
        
        NSMutableArray *array = [NSMutableArray array];
        [feedDicts enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [array addObject:[[TestModel alloc]initWithDictionary:obj]];
        }];
        [self.dataArray addObjectsFromArray:array];
        [self.tableView reloadData];
//    });
}



#pragma mark - UITableViewDataSource
#pragma mark - UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TestCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    cell.fd_enforceFrameLayout = NO;
    cell.model = self.dataArray[indexPath.row];

    if (indexPath.row % 2 == 0) {
        cell.backgroundColor = [UIColor redColor];
    } else {
        cell.backgroundColor = [UIColor purpleColor];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
   CGFloat height = [tableView fd_heightForCellWithIdentifier:cellid configuration:^(TestCell *cell) {
       cell.model = self.dataArray [indexPath.row];
    }];
    return height;

}



@end
