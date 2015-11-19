//
//  ViewController.m
//  Tinder
//
//  Created by Francisco Rojas Gallegos on 11/19/15.
//  Copyright © 2015 Francisco Rojas. All rights reserved.
//

#import "CardsViewController.h"
#import "DraggableImageView.h"

@interface CardsViewController ()
@property (weak, nonatomic) IBOutlet UIView *contentView;

@end

@implementation CardsViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    DraggableImageView *view = [[DraggableImageView alloc] initWithFrame:CGRectMake(0, 0, self.contentView.frame.size.width, self.contentView.frame.size.height)];
    [self.contentView addSubview:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
