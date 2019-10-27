//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var progresBar: UIProgressView!
    
    let eggTimes : [String : Int] = ["Hard": 12 * 1 , "Medium": 7 * 1 , "Soft": 5 * 1]
    
    var countDown : Int = 0
    var timer = Timer()
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle!

        if let result = eggTimes[hardness] {
            countDown = result
        }
        
       timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
 
        progresBar.progress = 1.0
    }
    
    @objc func update() {
        if (countDown > 0) {
            print("\(countDown) seconds")
            countDown -= 1
            titleLabel.text = "\(countDown) s"
        } else {
            timer.invalidate()
            titleLabel.text = "DONE!"
        }
    }
    
}
