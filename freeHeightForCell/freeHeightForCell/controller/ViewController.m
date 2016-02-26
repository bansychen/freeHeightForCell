//
//  ViewController.h
//  freeHeightForCell
//
//  Created by CHENZICHU on 15/12/25.
//  Copyright © 2015年 CHENZICHU. All rights reserved.
//

#import "ViewController.h"
#import "XFZHomeNewPointCell.h"

#define kXFZHomeNewPointCell @"XFZHomeNewPointCell"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *pointsList;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"最新观点";
    [self initWithData];
    [self registerTableViewCell];
}

- (void)initWithData
{
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"newpoints" ofType:@"plist"]];

    NSMutableArray *pointsList = [NSMutableArray array];
    for(int i=0 ;i<array.count;i++)
    {
        UserPoint *point = [[UserPoint alloc] initWithDict:array[i]];
        [pointsList addObject:point];
    }
    self.pointsList = pointsList;
}

- (void)registerTableViewCell
{
    UINib *nib = [UINib nibWithNibName:kXFZHomeNewPointCell bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:nib forCellReuseIdentifier:kXFZHomeNewPointCell];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.pointsList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XFZHomeNewPointCell *cell = [tableView dequeueReusableCellWithIdentifier:kXFZHomeNewPointCell];
    cell.point = self.pointsList[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XFZHomeNewPointCell *cell = [tableView dequeueReusableCellWithIdentifier:kXFZHomeNewPointCell];
    cell.point = self.pointsList[indexPath.row];
    [cell layoutIfNeeded];
    return CGRectGetMaxY(cell.bottomLineView.frame);
}
@end
