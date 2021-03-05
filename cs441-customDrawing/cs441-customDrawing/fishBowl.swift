//
//  fishBowl.swift
//  cs441-customDrawing
//
//  Created by Theresa Gundel on 3/3/21.
//

import UIKit

class fishBowl: UIView {
    @IBOutlet var label: UILabel!
    
    var fishX = 0
    var fishY = 0
    var dx = 1
    var dy = 1
    var score = 0
    var image = UIImage(imageLiteralResourceName: "goldfish.png")
    var isFlipped = false
    
    //make the UIView look like an ellipse
    //stackoverflow
    override func layoutSubviews() {
            super.layoutSubviews()
            layoutOvalMask()
        }

        private func layoutOvalMask() {
            let mask = self.shapeMaskLayer()
            let bounds = self.bounds
            if mask.frame != bounds {
                mask.frame = bounds
                mask.path = CGPath(ellipseIn: bounds, transform: nil)
            }
        }

        private func shapeMaskLayer() -> CAShapeLayer {
            if let layer = self.layer.mask as? CAShapeLayer {
                return layer
            }
            let layer = CAShapeLayer()
            layer.fillColor = UIColor.black.cgColor
            self.layer.mask = layer
            return layer
        }
    //end of stackoverflow
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        //drect is creating a rectangle to put the fish image on
        let drect = CGRect(x:fishX, y:fishY, width:40, height:50)
        image.draw(in: drect) //CG == Core Graphics

        self.label.text = String(score)
        }

    @objc func update(){
        //move fish across screen
        fishX = fishX + dx
        //if we hit the other side of the screen, start a new fish
        if fishX < Int(self.bounds.minX) || fishX > Int(self.bounds.maxX){
            fishY = Int.random(in: Int(self.bounds.minY)...Int(self.bounds.maxY))
            let poss = [Int(self.bounds.minX), Int(self.bounds.maxX)]
            fishX = Int(poss.randomElement() ?? Int(self.bounds.minX))
            if fishX == Int(self.bounds.minX){
                //if we are starting at the min x, we want x to increase
                dx = abs(dx)
                if isFlipped == true{
                    image = image.withHorizontallyFlippedOrientation()
                    isFlipped = false
                }
            }
            else{
                //we are starting at maxX so we want x to decrement
                dx = -abs(dx)
                if isFlipped == false{
                    image = image.withHorizontallyFlippedOrientation()
                    isFlipped = true
                }
            }
        }
        setNeedsDisplay()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches{
            let point = t.location(in: self)
            let dist = abs(Int(point.x) - fishX) + abs(Int(point.y) - fishY)
            if dist < 50 {
                score += 1
                self.label.text = String(score)
                if score % 5 == 0 && score != 0 {
                    if dx > 0{
                        dx += 1
                    }
                    else{
                        dx -= 1
                    }
                }

                fishY = Int.random(in: Int(self.bounds.minY)...Int(self.bounds.maxY))
                let poss = [Int(self.bounds.minX), Int(self.bounds.maxX)]
                fishX = Int(poss.randomElement() ?? Int(self.bounds.minX))
                if fishX == Int(self.bounds.minX){
                    //if we are starting at the min x, we want x to increase
                    dx = abs(dx)
                    if isFlipped == true{
                        image = image.withHorizontallyFlippedOrientation()
                        isFlipped = false
                    }
                }
                else{
                    //we are starting at maxX so we want x to decrement
                    dx = -abs(dx)
                    if isFlipped == false{
                        image = image.withHorizontallyFlippedOrientation()
                        isFlipped = true
                    }
                    
                }
                
            }

        }

    }

}
