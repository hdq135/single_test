//
//  ViewController.h
//  single_test
//
//  Created by hdq on 15-3-5.
//  Copyright (c) 2015年 hdq. All rights reserved.
//
 
#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *tableView;
- (void)insertNewObject:(id)sender;
@end
