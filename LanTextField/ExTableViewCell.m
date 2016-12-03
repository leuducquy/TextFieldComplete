//
//  ExTableViewCell.m
//  LanTextField
//
//  Created by quy on 12/3/16.
//  Copyright © 2016 quy. All rights reserved.
//

#import "ExTableViewCell.h"
#import "ViewController.h"
#import "QuyTableViewCell.h"
@implementation ExTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.arrayData = [[NSMutableArray alloc]init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerNib:[UINib nibWithNibName:@"QuyTableViewCell" bundle:nil] forCellReuseIdentifier:@"QuyTableViewCell"];

    // Initialization code
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrayData.count;
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    QuyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QuyTableViewCell"];
    cell.titleLabel.text = [self.arrayData objectAtIndex:indexPath.row];
    
    return  cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44.0f;
}
-(void)setConTraint:(NSArray *)array{
    
    self.arrayData = [NSMutableArray arrayWithArray:array];
    
    self.hieghtContraint.constant = 44 * self.arrayData.count;

    [self.tableView reloadData];
    [self.tableView layoutIfNeeded];
    
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
