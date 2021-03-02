//
//  ViewController.h
//  cs441-customDrawing
//
//  Created by Theresa Gundel on 3/1/21.
//

#import <UIKit/UIKit.h>
#import "drawSomething.h"

@interface ViewController : UIViewController
@property (nonatomic, strong) CADisplayLink *link; //CoreAnimationDisplay
@property (nonatomic, strong) IBOutlet drawSomething *drawSome;

@end

