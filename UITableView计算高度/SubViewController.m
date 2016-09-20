//
//  SubViewController.m
//  UITableView计算高度
//
//  Created by 荣耀iMac on 16/9/19.
//  Copyright © 2016年 wleleven. All rights reserved.
//

#import "SubViewController.h"
#import "SubCell.h"
#import "SubModel.h"
#import "UITableView+FDTemplateLayoutCell.h"
#import "Masonry.h"
#import "MASConstraint.h"

@interface SubViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *data;

@end

@implementation SubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.view.backgroundColor = [UIColor purpleColor];
//    return;
    
    self.title = @"基于约束自适应高度的单元格";
    self.tableView = [[UITableView alloc] init];
}

-(void)setTableView:(UITableView *)tableView
{
    _tableView = tableView;

    [self.view addSubview: self.tableView];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[SubCell class] forCellReuseIdentifier:NSStringFromClass([SubCell class])];
    
    
//    self.tableView.frame = self.view.bounds;
    
    
    [self.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
//    [self.tabelView remakeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.view);
//    }];
    
}

#pragma mark - UITabelView 代理方法.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger number = self.data.count;
    
    return number;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SubCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([SubCell class]) forIndexPath: indexPath];
//    cell.fd_enforceFrameLayout = NO;
    SubModel * model = [self.data objectAtIndex: indexPath.row];
    
    cell.model = model;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    CGFloat height = [tableView fd_heightForCellWithIdentifier: NSStringFromClass([SubCell class]) cacheByIndexPath:indexPath configuration:^(SubCell * cell) {
        SubModel * model = [self.data objectAtIndex: indexPath.row];
        
        cell.model = model;
    }];
    
    return height;
}


- (NSMutableArray *)data
{
    if (nil == _data) {
        _data = [NSMutableArray arrayWithCapacity: 42];
        
        NSArray * dataArray = @[
                                @{@"img": @"https://camo.githubusercontent.com/be57d040ec0ce5d6467fb73564c6bcb6c76d5a7b/687474703a2f2f6472696262626c652e73332e616d617a6f6e6177732e636f6d2f75736572732f363431302f73637265656e73686f74732f313235343433392f666f726d2d616e696d6174696f6e2d5f6769665f2e676966", @"intro": @"如果再看到关于纯代码,xib或storyboard,使用哪种方式进行UI布局更合适的讨论,请推荐他们先试用下 Masonry. Masonry,像xib一样快速,同时拥有作为纯代码方式的灵活性 — github关注度 7800 + 是有原因的!"},
                                @{@"img": @"https://camo.githubusercontent.com/be57d040ec0ce5d6467fb73564c6bcb6c76d5a7b/687474703a2f2f6472696262626c652e73332e616d617a6f6e6177732e636f6d2f75736572732f363431302f73637265656e73686f74732f313235343433392f666f726d2d616e696d6174696f6e2d5f6769665f2e676966", @"intro": @"无论如何,你总是需要一个提示框."},
                                @{@"img": @"https://camo.githubusercontent.com/be57d040ec0ce5d6467fb73564c6bcb6c76d5a7b/687474703a2f2f6472696262626c652e73332e616d617a6f6e6177732e636f6d2f75736572732f363431302f73637265656e73686f74732f313235343433392f666f726d2d616e696d6174696f6e2d5f6769665f2e676966", @"intro": @"SVProgressHUD是简单易用的显示器,用于指示一个持续进行的任务的进度."},
                                @{@"img": @"https://camo.githubusercontent.com/be57d040ec0ce5d6467fb73564c6bcb6c76d5a7b/687474703a2f2f6472696262626c652e73332e616d617a6f6e6177732e636f6d2f75736572732f363431302f73637265656e73686f74732f313235343433392f666f726d2d616e696d6174696f6e2d5f6769665f2e676966", @"intro": @"RestKit 是一个用于更好支持RESTful风格服务器接口的iOS库,可直接将联网获取的json/xml数据转换为iOS对象."},
                                @{@"img": @"https://camo.githubusercontent.com/be57d040ec0ce5d6467fb73564c6bcb6c76d5a7b/687474703a2f2f6472696262626c652e73332e616d617a6f6e6177732e636f6d2f75736572732f363431302f73637265656e73686f74732f313235343433392f666f726d2d616e696d6174696f6e2d5f6769665f2e676966", @"intro": @"FMDB 是SQLite的Objective-C封装库."},
                                @{@"img": @"https://camo.githubusercontent.com/be57d040ec0ce5d6467fb73564c6bcb6c76d5a7b/687474703a2f2f6472696262626c652e73332e616d617a6f6e6177732e636f6d2f75736572732f363431302f73637265656e73686f74732f313235343433392f666f726d2d616e696d6174696f6e2d5f6769665f2e676966", @"intro": @"Pop 是一个可扩展的动画引擎,可用于实现任意iOS对象的任意属性的动态变化,支持一般动画,弹性动画和渐变动画三种类型."},
                                @{@"img": @"https://camo.githubusercontent.com/be57d040ec0ce5d6467fb73564c6bcb6c76d5a7b/687474703a2f2f6472696262626c652e73332e616d617a6f6e6177732e636f6d2f75736572732f363431302f73637265656e73686f74732f313235343433392f666f726d2d616e696d6174696f6e2d5f6769665f2e676966", @"intro": @"高度可定制的应用欢迎页通用解决方案,可高度定制,不要仅限于现有的demo"},
                                @{@"img": @"https://camo.githubusercontent.com/be57d040ec0ce5d6467fb73564c6bcb6c76d5a7b/687474703a2f2f6472696262626c652e73332e616d617a6f6e6177732e636f6d2f75736572732f363431302f73637265656e73686f74732f313235343433392f666f726d2d616e696d6174696f6e2d5f6769665f2e676966", @"intro": @"JVFloatLabeledTextField 是注重用户体验的”浮动标签模式”(Float Label Patter)的第一个实现,可以有效解决移动设备上进行表单输入时,无法边看表单提示边进行输入的困境,用户体验非常好."},
                                @{@"img": @"https://camo.githubusercontent.com/be57d040ec0ce5d6467fb73564c6bcb6c76d5a7b/687474703a2f2f6472696262626c652e73332e616d617a6f6e6177732e636f6d2f75736572732f363431302f73637265656e73686f74732f313235343433392f666f726d2d616e696d6174696f6e2d5f6769665f2e676966", @"intro": @"用于为应用添加常用的上拉加载更多与下拉刷新效果,适用 UIScrollView、UITableView、UICollectionView、UIWebView."},
                                @{@"img": @"https://camo.githubusercontent.com/be57d040ec0ce5d6467fb73564c6bcb6c76d5a7b/687474703a2f2f6472696262626c652e73332e616d617a6f6e6177732e636f6d2f75736572732f363431302f73637265656e73686f74732f313235343433392f666f726d2d616e696d6174696f6e2d5f6769665f2e676966", @"intro": @"iOS-blur使用一种巧妙的方式,为任意视图添加一种非常奇妙的模糊效果."}
                                
                                ];
        
        [dataArray enumerateObjectsUsingBlock:^(NSDictionary * dict, NSUInteger idx, BOOL *stop) {
            SubModel * model = [[SubModel alloc] init];
            
            model.img = @"https://raw.githubusercontent.com/ealeksandrov/EAIntroView/master/Screenshot02.png";
            model.intro = [dict objectForKey: @"intro"];
            
            [_data addObject: model];
        }];
        
    }
    
    return _data;
}

@end
