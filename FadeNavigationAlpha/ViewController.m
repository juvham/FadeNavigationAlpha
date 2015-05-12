//
//  ViewController.m
//  FadeNavigationAlpha
//
//  Created by AceElvis on 15/5/11.
//  Copyright (c) 2015年 GouMin. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+fadeContent.h"
#define kScreenHeight   ([UIScreen mainScreen].bounds.size.height)
#define kScreenWidth    ([UIScreen mainScreen].bounds.size.width)
@interface ViewController ()  <UITableViewDataSource,UITableViewDelegate>
{
    
    CGRect originFrame;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIImageView *backImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenWidth)];
    
    _backImageView.frame = CGRectMake(0, 0, kScreenWidth, kScreenWidth);
    view.backgroundColor = [UIColor clearColor];
    self.tableView.tableHeaderView = view;
    
    [view addSubview:_backImageView];
    _backImageView.backgroundColor = [UIColor colorWithHue:(float)(rand() % 100) / 100 saturation:1.0 brightness:1.0 alpha:1.0];
    
    
    UINavigationBar *bar = self.navigationController.navigationBar;
    
    [bar setValue:@(0) forKeyPath:@"backgroundView.alpha"];
    
    [self _initNavigation];
    
}
- (void)_initNavigation {
    //放个Item 试试
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"给你看" style:UIBarButtonItemStylePlain target:self action:@selector(show:)];
    rightItem.tag = 1;
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)show:(UIBarButtonItem *)sender {
    
    NSString *name;
    switch (sender.tag) {
        case 1:
        {
            name = @"1";
            sender.tag = 2;
        }
            break;
        case 2:
            
        {
            name = @"2";
            sender.tag = 1;
        }
            break;
            
            
        default:
            break;
    }
    [_backImageView fadeContent:[UIImage imageNamed:name]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    originFrame = _backImageView.frame;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    static NSString *reuseIdentifier = @"tabelViewCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    
    cell.contentView.backgroundColor =  [UIColor colorWithHue:(float)(rand() % 100) / 100 saturation:1.0 brightness:1.0 alpha:1.0];
    
    return cell;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGPoint offset = scrollView.contentOffset;
    CGFloat alpha;
    if  ( offset.y  > 200  && offset.y  < 400  ) {
        
        alpha =  (offset.y - 200)/(400 - 200);
        
        UINavigationBar *bar = self.navigationController.navigationBar;
        
        [bar setValue:[NSNumber numberWithFloat:alpha] forKeyPath:@"backgroundView.alpha"];
    }

}


@end
