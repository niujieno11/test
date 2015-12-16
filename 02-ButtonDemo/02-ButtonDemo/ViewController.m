//
//  ViewController.m
//  02-ButtonDemo
//
//  Created by qingyun on 15/9/28.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *headBtn;
@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1.创建btn
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(150, 200, 100, 100);
    
    //2.把btn添加在self.view上
    
    //[self.view addSubview:btn];
    
    btn.backgroundColor = [UIColor redColor];
    
    UIImage *backImage = [UIImage imageNamed:@"dog1"];
    
    [btn setBackgroundImage:backImage forState:UIControlStateNormal];
    [btn setTitle:@"点点试试" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    UIImage *highlightedImage = [UIImage imageNamed:@"dog2"];
    [btn setBackgroundImage:highlightedImage forState:UIControlStateHighlighted];
    [btn setTitle:@"试试就试试" forState:UIControlStateHighlighted];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    //3.对btn添加点击事件
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)btnClick:(UIButton *)sender {
    NSLog(@"%s",__func__);
}

- (IBAction)move:(UIButton *)sender {
    float delta = 20;
    switch (sender.tag) {
        case 1://向上
        {
            //取出当前btn的frame
            CGRect oldFrame = _headBtn.frame;
            // 更改frame
            oldFrame.origin.y -= delta;
            //把更改后的frame赋值给headBtn
            _headBtn.frame = oldFrame;
        }
            break;
        case 2://向左
        {
            //取出当前btn的frame
            CGRect oldFrame = _headBtn.frame;
            // 更改frame
            oldFrame.origin.x -= delta;
            //把更改后的frame赋值给headBtn
            _headBtn.frame = oldFrame;
        }
            break;
        case 3://向下
        {
            CGPoint center = _headBtn.center;
            center.y += delta;
            _headBtn.center = center;
        }
            break;
        case 4://向右
        {
            CGPoint center = _headBtn.center;
            center.x += delta;
            _headBtn.center = center;
        }
            break;
            
        default:
            break;
    }
}
- (IBAction)scale:(UIButton *)sender {
    float delta = 20;
    if (sender.tag == 5) {//放大
        CGRect bounds = _headBtn.bounds;
        bounds.size.height += delta;
        bounds.size.width += delta;
        _headBtn.bounds = bounds;
    }else if (sender.tag == 6){//缩小
        CGRect bounds = _headBtn.bounds;
        bounds.size.height -= delta;
        bounds.size.width -= delta;
        _headBtn.bounds = bounds;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
