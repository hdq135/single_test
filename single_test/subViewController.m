//
//  subViewController.m
//  single_test
//
//  Created by hdq on 15-3-6.
//  Copyright (c) 2015年 hdq. All rights reserved.
//

#import "subViewController.h"
#import "dataModel.h"
#import "ViewController.h"

@interface subViewController ()

@end

@implementation subViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if(self.infoTextView && self.editTextView) {
        self.editTextView.text = self.infoTextView.text;
    }else if(self.editTextView == nil){
        self.infoTextView.text = [[dataModel getDataModel] getCurrentObj];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)add:(id)sender { 
    if([self.navigationItem.title isEqual: @"add"]){
        [[dataModel getDataModel] addObject:self.editTextView.text];
        [(ViewController *)
         [self.navigationController.viewControllers objectAtIndex:0] insertNewObject:nil];
        
    }else if([self.navigationItem.title isEqual: @"edit"]){
        [[dataModel getDataModel] updateObject:self.editTextView.text];
    }
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    //源视图控制器
    subViewController *srcView=segue.sourceViewController;
    //目标视图控制器
    subViewController *destView=segue.destinationViewController;
    if ([srcView.navigationItem.title  isEqual: @"info"] &&
        [destView.navigationItem.title  isEqual: @"add"]) {
        destView.navigationItem.title = @"edit";
        destView.infoTextView = srcView.infoTextView;
    }

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
