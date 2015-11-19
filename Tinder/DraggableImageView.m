//
//  DraggableImageView.m
//  Tinder
//
//  Created by Francisco Rojas Gallegos on 11/19/15.
//  Copyright © 2015 Francisco Rojas. All rights reserved.
//

#import "DraggableImageView.h"

@interface DraggableImageView ()

@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIImageView *mainImageView;
@property (assign, nonatomic) CGPoint imageCenter;
@property (assign, nonatomic) CGFloat degrees;

@end

@implementation DraggableImageView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initSubViews];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubViews];
    }
    return self;
}

- (CGFloat) degreesToRadians: (CGFloat) degrees {
    return degrees * M_PI / 180.0;
}

- (void)initSubViews {
    UINib *nib = [UINib nibWithNibName:@"DraggableImageView" bundle:nil];
    [nib instantiateWithOwner:self options:nil];
    self.contentView.frame = self.bounds;
    [self addSubview:self.contentView];

    CGAffineTransform translate = CGAffineTransformMakeTranslation(0,0);
    CGAffineTransform transform = CGAffineTransformRotate( translate, [self degreesToRadians:-10]);
    self.contentView.transform = transform;
}

- (IBAction)onImagePan:(UIPanGestureRecognizer *)sender {
    CGPoint location = [sender locationInView:self.contentView];
    NSLog(@"Gesture changed at: %@", NSStringFromCGPoint(location));
    if (sender.state == UIGestureRecognizerStateBegan) {
        self.degrees = 0;
        self.imageCenter = self.mainImageView.center;
    } else if (sender.state == UIGestureRecognizerStateChanged) {
        CGPoint translation = [sender translationInView:self.contentView];

        self.mainImageView.center = CGPointMake(self.imageCenter.x + translation.x,
                                                self.imageCenter.y);

        NSLog(@"Gesture changed at: %@", NSStringFromCGPoint(location));
    } else if (sender.state == UIGestureRecognizerStateEnded) {
        NSLog(@"Gesture ended at: %@", NSStringFromCGPoint(location));
    }
}

@end
