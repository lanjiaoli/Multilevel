//
//  ViewController.m
//  Multilevel
//
//  Created by L on 2018/6/29.
//  Copyright © 2018年 L. All rights reserved.
//

#import "ViewController.h"
#import "MultilevelModel.h"
#import "LevelViewModel.h"
#import "GTNewDirectoryTableViewCell.h"

@interface ViewController ()
@property (nonatomic,strong) NSMutableArray *allDataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getData];
}
- (void)getData{
    [self.allDataArray removeAllObjects];
    for (int i = 0; i<10; i++) {
        LevelViewModel *levelModel = [LevelViewModel new];
        MultilevelModel * model = [[MultilevelModel alloc]init];
        model.name = [NSString stringWithFormat:@"1-%d",i];
        model.level = 1;
        [levelModel.modelArray addObject:model];
        [self.allDataArray addObject:levelModel];
    }
}

#pragma mark - tableView Delegate With DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    LevelViewModel *levelModel = self.allDataArray[section];
    return levelModel.modelArray.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.allDataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    GTNewDirectoryTableViewCell *cell = [GTNewDirectoryTableViewCell gt_cellForRowAtIndexPath:indexPath tableView:tableView];
    
    MultilevelModel* model = [self modelWitIndexPath:indexPath];
    LevelViewModel *levelModel = self.allDataArray[indexPath.section];
    cell.count = levelModel.modelArray.count;
    cell.model = model;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self addDataWithLevelindexPath:indexPath];
    [self.tableView reloadData];
}
#pragma mark  - TabeleView Height
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 5.0;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.0001;
}
#pragma mark - lazy Loading
-(NSMutableArray *)allDataArray{
    if (!_allDataArray) {
        _allDataArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _allDataArray;
}

- (MultilevelModel *)modelWitIndexPath:(NSIndexPath *)indexPath{
    LevelViewModel *levelModel = self.allDataArray[indexPath.section];
    MultilevelModel * model = levelModel.modelArray[indexPath.row];
    return model;
}
- (void)addDataWithLevelindexPath:(NSIndexPath *)indexPath{
    LevelViewModel *levelModel = self.allDataArray[indexPath.section];
    MultilevelModel *currentModel = levelModel.modelArray[indexPath.row];
    currentModel.isShow =!currentModel.isShow;
    if (!currentModel.isShow) {
        NSMutableArray *removeModels = [NSMutableArray arrayWithCapacity:1];
        for (NSInteger i = indexPath.row+1; i<levelModel.modelArray.count; i++) {
            MultilevelModel * model = levelModel.modelArray[i];
            if (model.level == currentModel.level) {
                break;//跳出循环
            }
            [removeModels addObject:model];
        }
        for (MultilevelModel * model in removeModels) {
            [levelModel.modelArray removeObject:model];
        }
    }else{
        for (int i = 0; i<1; i++) {
            MultilevelModel * model = [[MultilevelModel alloc]init];
            model.level = currentModel.level +1;
            model.name = [NSString stringWithFormat:@"%ld-%d",model.level,i];
            [levelModel.modelArray insertObject:model atIndex:indexPath.row+1 +i];
        }
    }
}

@end
