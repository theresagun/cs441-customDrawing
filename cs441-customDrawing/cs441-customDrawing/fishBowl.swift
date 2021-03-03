//
//  fishBowl.swift
//  cs441-customDrawing
//
//  Created by Theresa Gundel on 3/3/21.
//

import UIKit

class fishBowl: UIView {
    var fishX = 0
    var fishY = 0
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        let color:UIColor = UIColor.yellow
        //drect is creating a rectang;e. could probably do an ellipse?
        let drect = CGRect(x:fishX, y:fishY, width:40, height:50)
        let bpath:UIBezierPath = UIBezierPath(rect: drect)
        
        color.set()
        bpath.stroke()
        UIColor.blue.set()
        
        UIRectFill(drect)
        NSLog("called drawrect")
    }

    @objc func update(){
        //collision detection can happen here
        NSLog("Fishbowl update")
        fishX = fishX + 1
        fishY = fishY + 1
        setNeedsDisplay()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches{
            let point = t.location(in: self)
            //move the fish to the location touched
            fishX = Int(point.x)
            fishY = Int(point.y)
            //to tap the fish we need to get the x and y, compare to the fishx and fishy, then do something if it is the same
        }
    }

}
