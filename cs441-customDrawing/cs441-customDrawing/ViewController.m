//
//  ViewController.m
//  cs441-customDrawing
//
//  Created by Theresa Gundel on 3/1/21.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize link;
@synthesize drawSome;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //creates an obj connected to OS, which knows what to draw to screen. this obj sends a message. vc class called by display link. call the method tick.
    link = [CADisplayLink displayLinkWithTarget:self selector:@selector(tick:)];
    //OS has a main loop. we are adding this link to the loop for the OS to do.
    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    //5 frames per second so lower CPU
    [link setPreferredFramesPerSecond:5];
    [link setPaused:NO];
}

-(void) tick:(CADisplayLink *)sender
{
    [drawSome animate];
}

@end
