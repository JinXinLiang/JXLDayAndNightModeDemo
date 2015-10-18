//
//  JXLTableViewCell.m
//  JXLDayAndNightMode
//
//  Created by Eiwodetianna on 10/17/15.
//  Copyright © 2015 jinxinliang. All rights reserved.
//

#import "JXLTableViewCell.h"
#import "JXLDayAndNightMode.h"

@implementation JXLTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
        UISwitch *switchView = [[UISwitch alloc] initWithFrame:CGRectMake(0, 0, 80, 40)];
        if (JXLDayAndNightModeDay == [[JXLDayAndNightManager shareManager] contentMode]) {
            switchView.on = NO;
        } else {
            switchView.on = YES;
        }
        self.accessoryView = switchView;
        [switchView addTarget:self action:@selector(switchValueChange:) forControlEvents:UIControlEventValueChanged];
        
        
        
        
        [self jxl_setDayMode:^(UIView *view) {
            JXLTableViewCell *cell = (JXLTableViewCell *)view;
            cell.backgroundColor = [UIColor whiteColor];
            cell.contentView.backgroundColor = [UIColor whiteColor];
            cell.textLabel.backgroundColor = [UIColor whiteColor];
            cell.textLabel.textColor = [UIColor blackColor];
        } nightMode:^(UIView *view) {
            JXLTableViewCell *cell = (JXLTableViewCell *)view;
            cell.backgroundColor = [UIColor blackColor];
             cell.contentView.backgroundColor = [UIColor blackColor];
            cell.textLabel.backgroundColor = [UIColor blackColor];
            cell.textLabel.textColor = [UIColor whiteColor];
        }];

    }
    
    return self;
}

- (void)switchValueChange:(UISwitch *)switchView {
    if (switchView.on) {
        
        [[JXLDayAndNightManager shareManager] nightMode];
    } else {
        [[JXLDayAndNightManager shareManager] dayMode];
    }
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
