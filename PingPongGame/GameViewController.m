//
//  ViewController.m
//  PingPongGame
//
//  Created by Anton Scherbaev on 26.04.2021.
//

#import "GameViewController.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define HALF_SCREEN_WIDTH SCREEN_WIDTH/2
#define HALF_SCREEN_HEIGHT SCREEN_HEIGHT/2
#define MAX_SCORE 6

@interface GameViewController ()

@property (strong, nonatomic) UIImageView *paddleTop;
@property (strong, nonatomic) UIImageView *paddleBottom;
@property (strong, nonatomic) UIView *gridView;
@property (strong, nonatomic) UIView *ball;
@property (strong, nonatomic) UITouch *topTouch;
@property (strong, nonatomic) UITouch *bottomTouch;
@property (strong, nonatomic) NSTimer * timer;
@property (nonatomic) float dx;
@property (nonatomic) float dy;
@property (nonatomic) float speed;
@property (strong, nonatomic) UILabel *scoreTop;
@property (strong, nonatomic) UILabel *scoreBottom;


@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configTable];
}

- (void)configTable {
    self.view.backgroundColor = [UIColor colorWithRed:100.0/255.0 green:162.0/255.0 blue:105.0/255.0 alpha:1.0];
    [self setGrid];
    [self setPaddles];
    [self setBall];
    [self setScores];
}

- (void)setGrid {
    self.gridView = [[UIView alloc] initWithFrame:CGRectMake(0, HALF_SCREEN_HEIGHT - 2, SCREEN_WIDTH, 4)];
    self.gridView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];
    [self.view addSubview:self.gridView];
}

- (void)setPaddles {
    self.paddleTop = [[UIImageView alloc] initWithFrame:CGRectMake(30, 40, 90, 60)];
    self.paddleTop.image = [UIImage imageNamed:@"paddleTop"];
    self.paddleTop.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:self.paddleTop];
    
    self.paddleBottom = [[UIImageView alloc] initWithFrame:CGRectMake(30, SCREEN_HEIGHT - 90, 90, 60)];
    self.paddleBottom.image = [UIImage imageNamed:@"paddleBottom"];
    self.paddleBottom.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:self.paddleBottom];
}

- (void)setBall {
    self.ball = [[UIView alloc] initWithFrame:CGRectMake(self.view.center.x - 10, self.view.center.y - 10, 20, 20)];
    self.ball.backgroundColor = [UIColor whiteColor];
    self.ball.layer.cornerRadius = 10;
    self.ball.hidden = YES;
    [self.view addSubview:self.ball];
}

- (void)setScores {
    self.scoreTop = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 70, HALF_SCREEN_HEIGHT - 70, 50, 50)];
    self.scoreTop.textColor = [UIColor whiteColor];
    self.scoreTop.text = @"0";
    self.scoreTop.font = [UIFont systemFontOfSize:40.0 weight:UIFontWeightLight];
    self.scoreTop.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.scoreTop];
    
    self.scoreBottom = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 70, HALF_SCREEN_HEIGHT + 70, 50, 50)];
    self.scoreBottom.textColor = [UIColor whiteColor];
    self.scoreBottom.text = @"0";
    self.scoreBottom.font = [UIFont systemFontOfSize:40.0 weight:UIFontWeightLight];
    self.scoreBottom.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.scoreBottom];
}



@end
