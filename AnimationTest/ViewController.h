//
//  ViewController.h
//  AnimationTest
//
//  Created by tototti on 12/06/17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    __weak IBOutlet UIImageView *_thumbnailImage;
    __weak IBOutlet UIImageView *_image;
    
    __weak IBOutlet UIImageView *_frontView;
    __weak IBOutlet UIImageView *_backView;
    
    __weak IBOutlet UILabel *_label1;
    __weak IBOutlet UILabel *_label2;
}

- (IBAction)moveButton:(id)sender;
- (IBAction)reverseButton:(id)sender;

- (IBAction)frontAction:(id)sender;
- (IBAction)backAction:(id)sender;

@end
