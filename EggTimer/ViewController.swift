//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTime = [
        "Soft" : 300,
        "Medium" : 420,
        "Hard" : 720
    ]

    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle! // Soft, Medium, Hard (Optional)
        
        var secondsToBoil = eggTime[hardness]!
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            if secondsToBoil > 0 {
                print ("\(secondsToBoil) seconds.")
                secondsToBoil -= 1
            } else {
                Timer.invalidate()
            }
        }
    }
    
}
