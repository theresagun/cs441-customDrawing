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
        let color:UIColor = UIColor.yellow
        //drect is creating a rectangle to later change into ellipse
        let drect = CGRect(x:fishX, y:fishY, width:40, height:50)
        let bpath:UIBezierPath = UIBezierPath(rect: drect)
        
        color.set()
        bpath.stroke()
        
        //stackoverflow code next 3 lines to make the obj an ellipse
        let ovalPath = UIBezierPath(ovalIn: drect)
        UIColor.orange.set()
        ovalPath.fill()
        //end of stackoverflow
        
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
                dx = 1
            }
            else{
                //we are starting at maxX so we want x to decrement
                dx = -1
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

                fishY = Int.random(in: Int(self.bounds.minY)...Int(self.bounds.maxY))
                let poss = [Int(self.bounds.minX), Int(self.bounds.maxX)]
                fishX = Int(poss.randomElement() ?? Int(self.bounds.minX))
                if fishX == Int(self.bounds.minX){
                    //if we are starting at the min x, we want x to increase
                    dx = 1
                }
                else{
                    //we are starting at maxX so we want x to decrement
                    dx = -1
                }
            }
            //to tap the fish we need to get the x and y, compare to the fishx and fishy, then do something if it is the same
        }
    }

}
