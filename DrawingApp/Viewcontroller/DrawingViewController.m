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
CGFloat lineThickness = 10.0;
bool dot ;
CGPoint lastPoint ;
UIImagePickerController *imagePicker;
- (void)viewDidLoad {
    [super viewDidLoad];
    _tempUndoImage = [UIImage new];
    _tempRedoImage = [UIImage new];
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
    _tempUndoImage = _mainImageView.image;
}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    dot = false ;
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:self.view];
    [self drawLineFrom :lastPoint : currentPoint];
    lastPoint = currentPoint;
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (dot){
        [self drawLineFrom : lastPoint :lastPoint];
    }
    
   
}
//drawing Line
-(void) drawLineFrom: (CGPoint)fromPoint : (CGPoint)toPoint{
    UIGraphicsBeginImageContext(self.view.frame.size);
    [self.mainImageView.image drawInRect:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), fromPoint.x, fromPoint.y);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), toPoint.x, toPoint.y);
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), lineThickness );
   
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), CGColorGetComponents( _color.CGColor)[0],CGColorGetComponents( _color.CGColor)[1],CGColorGetComponents( _color.CGColor)[2],CGColorGetComponents( _color.CGColor)[3]);
    CGContextSetBlendMode(UIGraphicsGetCurrentContext(),kCGBlendModeNormal);
    
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    self.mainImageView.image = UIGraphicsGetImageFromCurrentImageContext();
    [self.mainImageView setAlpha:1.0];
    UIGraphicsEndImageContext();
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
        case 7:
            _color = [UIColor colorWithRed:255/255.0f
                                     green:255/255.0f
                                      blue:255/255.0f
                                     alpha:1.0f];
            break;
            
        default:
            break;
    }
    
    
}

- (IBAction)undoAction:(UIBarButtonItem *)sender {
    _tempRedoImage = _mainImageView.image;
    _mainImageView.image = _tempUndoImage;
}

- (IBAction)redoAction:(UIBarButtonItem *)sender {
    _mainImageView.image = _tempRedoImage;
}

- (IBAction)lineThicknessPressed:(UIButton *)sender {
    if (sender.tag == 1){
        lineThickness = 10.0;
    }else{
        lineThickness = 20.0;
    }
}

- (IBAction)eraseDrawing:(UIButton *)sender {
    _mainImageView.image = nil ;
}

- (IBAction)saveImage:(UIButton *)sender {
}

/// open image to draw on it 
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.mainImageView.image = chosenImage;
    
    [imagePicker dismissViewControllerAnimated:YES completion:NULL];
    
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [imagePicker dismissViewControllerAnimated:YES completion:NULL];
    
}
- (IBAction)openImage:(UIButton *)sender {
    imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    imagePicker.allowsEditing = YES ;
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:imagePicker animated:YES completion:NULL];
}
@end
