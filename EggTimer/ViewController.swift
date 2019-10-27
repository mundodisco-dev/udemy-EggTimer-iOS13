//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTimes = ["Hard": 12 , "Medium": 7, "Soft": 5]
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle

        if let hardnessKey = eggTimes.index(forKey: hardness!) {
            print(eggTimes[hardnessKey].value)
        }
        
    }
    
}
