//
//  ViewController.swift
//  cs441-customDrawing
//
//  Created by Theresa Gundel on 3/3/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var fishBowl: fishBowl!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let displayLink = CADisplayLink(target: self, selector: #selector(update))
        displayLink.add(to: RunLoop.main, forMode: RunLoop.Mode.default)
    }
    
    @objc func update(){
        fishBowl.update()
    }

}

