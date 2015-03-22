//
//  ViewController.m
//  single_test
//
//  Created by hdq on 15-3-5.
//  Copyright (c) 2015年 hdq. All rights reserved.
//

#import "ViewController.h"
#import "dataModel.h"
#import "subViewController.h"

#define IPAD CGRectMake(0,0,768,1024)
#define oldIP CGRectMake(0,0,320,568)
#define IP_6 CGRectMake(0,0,375,667)
#define IP_6P CGRectMake(0,0,414,736)


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UINavigationItem *navItem = self.navigationItem;
    navItem.leftBarButtonItem = self.editButtonItem;
    self.editButtonItem.action=@selector(edit:);
}
- (void)edit:(id)sender {
     
    [self.tableView setEditing:!self.tableView.editing animated:YES];
    // [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}
- (void)insertNewObject:(id)sender {
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITableViewDataSource


- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPat{
}

-(NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section{
    return [[dataModel getDataModel] getCount];
}

-(UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath{
    static NSString *CellIdentifier = @"cell";
  //  UITableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    NSLog(@"%@ row = %ld",indexPath,(long)indexPath.row);
    if(cell == nil)
    {
        cell= [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
        cell.accessoryType=UITableViewCellAccessoryDetailDisclosureButton;
        cell.textLabel.text =[[dataModel getDataModel] getKeyAtIndex:indexPath.row];
    }
    else{
        cell.textLabel.text =[[dataModel getDataModel] getKeyAtIndex:indexPath.row];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [[dataModel getDataModel] setCurrentObj:indexPath.row];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [[dataModel getDataModel] removeAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}



@end
