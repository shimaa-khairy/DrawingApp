//
//  DrawingViewController.h
//  DrawingApp
//
//  Created by shimaa_khairy on 7/11/18.
//  Copyright © 2018 shimaa_khairy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrawingViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *mainImageView;

@property (weak, nonatomic) IBOutlet UIImageView *tempImageView;

@property (strong, nonatomic) UIColor *color;
- (IBAction)colorPressed:(UIButton *)sender;
- (IBAction)lineThicknessPressed:(UIButton *)sender;
- (IBAction)eraseDrawing:(UIButton *)sender;

- (IBAction)saveImage:(UIButton *)sender;
- (IBAction)openImage:(UIButton *)sender;

@end
