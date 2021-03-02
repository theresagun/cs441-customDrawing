//
//  drawSomething.h
//  cs441-customDrawing
//
//  Created by Theresa Gundel on 3/1/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface drawSomething : UIView
@property (nonatomic) float something_x, something_y;
@property (nonatomic) int num_moves;
-(void)animate;
@end

NS_ASSUME_NONNULL_END
