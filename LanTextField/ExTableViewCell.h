//
//  ExTableViewCell.h
//  LanTextField
//
//  Created by quy on 12/3/16.
//  Copyright © 2016 quy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExTableViewCell : UITableViewCell<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITextField *textfield;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *hieghtContraint;
@property (strong,nonatomic)NSMutableArray *arrayData;
-(void)setConTraint:(NSArray*)array;
@end
