//
//  GTNewDirectoryTableViewCell.m
//  GTW
//
//  Created by L on 2018/6/28.
//  Copyright © 2018年 imeng. All rights reserved.
//

#import "GTNewDirectoryTableViewCell.h"

@implementation GTNewDirectoryTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.treeLabel.layer.masksToBounds = YES;
    self.treeLabel.layer.borderColor = [UIColor redColor].CGColor;
    self.treeLabel.layer.borderWidth = 0.5;

}
- (void)setModel:(MultilevelModel *)model{
    self.nameLabel.text = model.name;
    if (model.level == 1) {
        self.topLineView.hidden = YES;
        self.topLineView.hidden = YES;
    }
    if (model.level == self.count) {
        self.bottomLineView.hidden = YES;
    }
    self.lineImageViewConstraintW.constant +=12*model.level;
}
#pragma mark - 自定义
+(GTNewDirectoryTableViewCell *)gt_cellForRowAtIndexPath:(NSIndexPath *)indexPath tableView:(UITableView *)tableView{
    GTNewDirectoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithFormat:@"%ld_%ld",indexPath.row,indexPath.section]];
    if (!cell) {
        NSArray *nibs = [[NSBundle mainBundle]loadNibNamed:@"GTNewDirectoryTableViewCell" owner:nil options:nil];
        cell = nibs.firstObject;
    }
    return cell;
}
@end
