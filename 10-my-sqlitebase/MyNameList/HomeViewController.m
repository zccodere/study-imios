//
//  HomeViewController.m
//  MyNameList
//
//  Created by zc on 2017/6/5.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import "HomeViewController.h"
#import "StudentModel.h"
#import "SQLManager.h"

@interface HomeViewController ()
@property (strong,nonatomic) NSMutableArray *studentArray;//数据源-模型
@end

@implementation HomeViewController

#define HomeCellIdentifier (@"StudentCell")

- (void)viewDidLoad {
    [super viewDidLoad];
    self.studentArray = [[NSMutableArray alloc] init];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _studentArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:HomeCellIdentifier forIndexPath:indexPath];
    
    // 等待给CELL赋值
    
    if(self.studentArray.count > 0){
        StudentModel *model = [self.studentArray objectAtIndex:indexPath.row];
        cell.textLabel.text = model.idNum;
        cell.detailTextLabel.text = model.name;
    }
    
    
    return cell;
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return YES;
}


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50.f;
}

- (IBAction)addUserDone:(UIStoryboardSegue *)sender{
    StudentModel *model = [[StudentModel alloc] init];
    model.idNum = @"100";
    StudentModel *result = [[SQLManager shareManager] searchWithIdNum:model];
    
    [_studentArray addObject:result];
    [self.tableView reloadData];
    
}

@end
