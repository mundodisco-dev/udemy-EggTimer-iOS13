//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTimes : [String : Int] = ["Hard": 12 * 60 , "Medium": 7 * 60 , "Soft": 5 * 60]
    
    var initialCountDown : Int = 0
    var countDown : Int = 0
    var timer = Timer()
    
    var audioPlayer: AVAudioPlayer!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle!

        progressBar.progress = 0
        titleLabel.text = sender.currentTitle
        if let result = eggTimes[hardness] {
            countDown = result
            initialCountDown = countDown
        }
        
       timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
 

    }
    
    @objc func update() {
        if (countDown > 0) {
//            print("\(countDown) seconds")
            countDown -= 1
            progressBar.progress = 1 - (Float(countDown) / Float(initialCountDown))
//            print(progressBar.progress)
        } else {
            timer.invalidate()
            titleLabel.text = "DONE!"
            soundAlarm()
        }
    }
    
    func soundAlarm() {
        let soundURL = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        
        do {
            try audioPlayer = AVAudioPlayer(contentsOf: soundURL!)
        } catch {
            print (error)
        }
        audioPlayer.play()
    }
    
}
