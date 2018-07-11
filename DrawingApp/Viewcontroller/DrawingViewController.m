//
//  DrawingViewController.m
//  DrawingApp
//
//  Created by shimaa_khairy on 7/11/18.
//  Copyright © 2018 shimaa_khairy. All rights reserved.
//

#import "DrawingViewController.h"

@interface DrawingViewController ()

@end

@implementation DrawingViewController
int lineThickness = 10;
bool dot ;
CGPoint lastPoint ;
- (void)viewDidLoad {
    [super viewDidLoad];
    _color = UIColor.redColor;
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//begin drawing
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
     dot = true ;
    UITouch *touch = [touches anyObject];
    lastPoint = [touch locationInView:self.view];
}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    dot = false ;
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:self.view];
}
//drawing Line
-(void) drawLineFrom: (CGPoint)fromPoint : (CGPoint)toPoint{
    
}
// change color value
- (IBAction)colorPressed:(UIButton *)sender {
    switch (sender.tag) {
        case 1:
            _color = UIColor.redColor;
            break;
        case 2:
            _color = UIColor.cyanColor;
            break;
        case 3:
            _color = UIColor.blueColor;
            break;
        case 4:
            _color = UIColor.purpleColor;
            break;
        case 5:
            _color = UIColor.orangeColor;
            break;
        case 6:
            _color = UIColor.brownColor;
            break;
            
        default:
            break;
    }
    
    
}

- (IBAction)lineThicknessPressed:(UIButton *)sender {
    if (sender.tag == 1){
        lineThickness = 10;
    }else{
        lineThickness = 20;
    }
}

- (IBAction)eraseDrawing:(UIButton *)sender {
    _mainImageView.image = nil ;
}

- (IBAction)saveImage:(UIButton *)sender {
}

- (IBAction)openImage:(UIButton *)sender {
}
@end
