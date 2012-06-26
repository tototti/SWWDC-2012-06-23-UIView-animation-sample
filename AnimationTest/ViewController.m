//
//  ViewController.m
//  AnimationTest
//
//  Created by tototti on 12/06/17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

// サムネイル画像がクリックされた時
- (IBAction)onThumbPressed:(id)sender
{
    __block __weak UIImageView* iv = _image;
    
    iv.alpha = 0.0;
    iv.frame = _thumbnailImage.frame;
    [iv setHidden:NO];
    
    [UIView animateWithDuration:2.0
                          delay:0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{ 
                         iv.alpha = 1.0;
                         iv.frame = CGRectMake(20, 15, 280, 415);
                     } 
                     completion:nil];
}


// 大きい画像がクリックされた時
- (IBAction)onImagePressed:(id)sender
{
    __block __weak UIImageView* iv = _image;

    [UIView animateWithDuration:0.5
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{ 
                         iv.alpha = 0.0;
                         iv.frame = _thumbnailImage.frame;
                     }
                     completion:nil];
}


// ラベルを落とすボタンの動作
- (IBAction)moveButton:(id)sender {
    __block __weak UILabel* label1 = _label1;
    __block __weak UILabel* label2 = _label2;

    [UIView animateWithDuration:0.5
                          delay:0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{ 
                         // labelにtransformを設定する。
                         CGAffineTransform rotation = CGAffineTransformMakeRotation(M_PI/2);
                         CGAffineTransform translation = CGAffineTransformMakeTranslation(40, 480);
                         label1.transform = CGAffineTransformConcat(rotation, translation);
                         
                         rotation = CGAffineTransformMakeRotation(-M_PI/2);
                         translation = CGAffineTransformMakeTranslation(-120, 480);
                         label2.transform = CGAffineTransformConcat(rotation, translation);
                     } 
                     completion:nil];
}


// ラベルを元に戻すボタンの動作
- (IBAction)reverseButton:(id)sender {
    __block __weak UILabel* label1 = _label1;
    __block __weak UILabel* label2 = _label2;
    
    [UIView animateWithDuration:0.5
                          delay:0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{ 
                         // labelのtransformをリセット
                         label1.transform = CGAffineTransformIdentity;
                         label2.transform = CGAffineTransformIdentity;
                     }
                     completion:nil];
}




// 画像のトランジション
- (void)transitionFromView:(UIView*)fromView ToView:(UIView*)toView {
    [UIView transitionFromView:fromView
                        toView:toView
                      duration:1.0
                       options:UIViewAnimationOptionTransitionFlipFromTop|UIViewAnimationOptionShowHideTransitionViews
                    completion:^(BOOL finished) {
                        // animation completed
                    }];
}


// 画像のトランジション「front」ボタン
- (IBAction)frontAction:(id)sender {
    [self transitionFromView:_backView ToView:_frontView];
}


// 画像のトランジション「back」ボタン
- (IBAction)backAction:(id)sender {
    [self transitionFromView:_frontView ToView:_backView];
}



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    // thumbnailにgestureを追加
    UITapGestureRecognizer *thumbGesture = [[UITapGestureRecognizer alloc] initWithTarget:self 
                                                                                   action:@selector(onThumbPressed:)];
    [_thumbnailImage addGestureRecognizer:thumbGesture];

    // imageにgestureを追加
    UITapGestureRecognizer *imageGesture = [[UITapGestureRecognizer alloc] initWithTarget:self 
                                                                                   action:@selector(onImagePressed:)];
    [_image addGestureRecognizer:imageGesture];
    
}


- (void)viewDidUnload
{
    _thumbnailImage = nil;
    _image = nil;
    _frontView = nil;
    _backView = nil;
    _label1 = nil;
    _label2 = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


@end
