//
//  ViewController.m
//  LanTextField
//
//  Created by quy on 12/3/16.
//  Copyright © 2016 quy. All rights reserved.
//

#import "ViewController.h"
#import "ExTableViewCell.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>

@property (strong,nonatomic)NSMutableArray* array;
@property (strong,nonatomic)NSString* text2;
@property (strong,nonatomic)NSString* text1;
@property (nonatomic)CGFloat hieghtCell;
@property (nonatomic,strong) NSIndexPath *indexPath;
@end
static NSString *wExTableViewCell = @"ExTableViewCell";
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.array = [[NSMutableArray alloc]initWithArray:[self allCountries]];
    
    
    [self.tableView registerNib:[UINib nibWithNibName:wExTableViewCell bundle:[NSBundle mainBundle]] forCellReuseIdentifier:wExTableViewCell];
    
    self.text2 = @"";
      self.text1 = @"";
    self.hieghtCell = 44.0f;
    // Do any additional setup after loading the view, typically from a nib.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section == 0){
        return  2;
    }
    return 1;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.section == 0){
        ExTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:wExTableViewCell];
        if(!cell){
            cell = (ExTableViewCell*)[[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:wExTableViewCell];
        }
        
        [cell.textfield addTarget:self action:@selector(texfieldChange:) forControlEvents:(UIControlEventEditingChanged)];
        if(indexPath.row == 0){
              cell.textfield.text = self.text1;
        }else{
              cell.textfield.text = self.text2;
        }
        cell.textfield.delegate = self;
        cell.textfield.tag = indexPath.row;
        return cell;

    }else if (indexPath.section == 1){
        UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"CELL"];
        cell.textLabel.text = @"section 1";
        return  cell;
        
    }else if (indexPath.section == 2){
        UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"CELL"];
        cell.textLabel.text = @"section 2";
        return  cell;
        
    }
    
    return  [UITableViewCell new];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section  == 0){
        if(indexPath == self.indexPath){
            return self.hieghtCell;
        }
        return 44.0f;
    }
    return  44.0f;
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
    UITextField *textfields = [[UITextField alloc]init];
    textfields.text = @"";
    textField.tag = textField.tag;
    [self setUpcell:textfields];
}
-(void)texfieldChange:(UITextField*)textField{
    
   
    
   
    if(textField.tag == 0){
        self.text1 = textField.text;
    }else{
        self.text2 = textField.text;
    }
    
    [self setUpcell:textField];
       // [cell.textfield becomeFirstResponder];
   
       
        
   
    
}
-(void)setUpcell:(UITextField*)textField{
    ExTableViewCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:textField.tag inSection:0]];
    NSPredicate *bPredicate = [NSPredicate predicateWithFormat:@"SELF contains[cd] %@",textField.text];
    
    NSArray *completions;
    
    completions = [NSMutableArray arrayWithArray:[self.array filteredArrayUsingPredicate:bPredicate]];
    
    [cell setConTraint:completions];
    
    self.hieghtCell = 44.0f + completions.count * 44.0f;
    self.indexPath = [NSIndexPath indexPathForRow:textField.tag inSection:0];
    [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:3]] withRowAnimation:(UITableViewRowAnimationNone)];
}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - MLPAutoCompleteTextField Delegate







- (NSArray *)allCountries
{
    NSArray *countries =
    @[
      @"Abkhazia",
      @"Afghanistan",
      @"Aland",
      @"Albania",
      @"Algeria",
      @"American Samoa",
     
      ];
    
    return countries;
}
@end
