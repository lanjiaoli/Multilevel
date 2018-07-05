//
//  GTNewDirectoryTableViewCell.h
//  GTW
//
//  Created by L on 2018/6/28.
//  Copyright © 2018年 imeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MultilevelModel.h"
@interface GTNewDirectoryTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *roundImageView;
@property (weak, nonatomic) IBOutlet UIImageView *lineImageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lineImageViewConstraintW;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UIImageView *topLineView;
@property (weak, nonatomic) IBOutlet UIImageView *bottomLineView;
@property (weak, nonatomic) IBOutlet UIButton *selectBtn;
@property (weak, nonatomic) IBOutlet UILabel *treeLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *treeLabelWidth;

@property (nonatomic, assign) NSInteger count;//当前session所有数据个数
@property (nonatomic, assign) NSInteger indexRow;//当前Row
@property (nonatomic,strong) MultilevelModel * model ;
@property (nonatomic, copy) void(^currentCellCallBlock)(NSInteger row);
+(GTNewDirectoryTableViewCell *)gt_cellForRowAtIndexPath:(NSIndexPath *)indexPath tableView:(UITableView *)tableView;
@end
