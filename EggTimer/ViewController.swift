//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFAudio

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTime = [
        "Soft" : 3,
        "Medium" : 4,
        "Hard" : 7
    ]

    var secondsPast = 1
    var totalTime = 1
    
    var timer = Timer()
    var player: AVAudioPlayer!

    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        
        let hardness = sender.currentTitle! // Soft, Medium, Hard (Optional)
        
        totalTime = eggTime[hardness]!
        
        secondsPast = 0
        progressBar.progress = 0.0
        titleLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if secondsPast < totalTime {
            secondsPast += 1
            progressBar.progress = Float(secondsPast)/Float(totalTime)
        } else {
            timer.invalidate()
            titleLabel.text = "Done!"
            playSound(soundName: "alarm_sound")
        }
    }
    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
}
