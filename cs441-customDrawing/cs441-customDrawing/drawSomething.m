//
//  drawSomething.m
//  cs441-customDrawing
//
//  Created by Theresa Gundel on 3/1/21.
//

#import "drawSomething.h"

@implementation drawSomething
@synthesize something_x, something_y; //makes getters and setters
@synthesize num_moves;

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    //context lets you draw on the screen
    CGRect bounds = [self bounds];
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [[UIColor redColor]setFill];
    CGContextFillRect(context, bounds);
    
    [[UIColor whiteColor]setFill];
    CGContextFillEllipseInRect(context, CGRectMake(something_x, something_y, 20, 20));

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    for (UITouch *t in touches)
    {
        CGPoint p = [t locationInView:self];
        something_y = p.y;
        something_x = p.x;
        [self setNeedsDisplay];
        ++num_moves;
    }
}

-(void)animate{
    something_y = something_y + 1;
    something_x = something_x + 1;
    [self setNeedsDisplay];
}


@end
