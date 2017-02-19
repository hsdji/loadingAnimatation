//
//  ViewController.m
//  Animatation
//
//  Created by 小飞 on 17/2/19.
//  Copyright © 2017年 小飞. All rights reserved.
//

#import "ViewController.h"
#import "PFProgressView.h"
@interface ViewController ()
{
    PFProgressView *_LoadView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    _LoadView=[PFProgressView progressView];
    
    _LoadView.frame=CGRectMake(0, 0, 100*[UIScreen mainScreen].bounds.size.width/200.0f, 100*[UIScreen mainScreen].bounds.size.width/200.0f);
    
    _LoadView.center=self.view.center;
    
    [self.view addSubview: _LoadView ];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
