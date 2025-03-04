//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let eggBoilTimes = ["Soft": 3, "Medium": 6, "Hard": 12]
    
    var totalTime = 0
    var secondsRemaining = 0
    var selectedEggHardness: String?
    var timer = Timer()
    var player: AVAudioPlayer?
    @IBOutlet weak var titleLable: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        
        selectedEggHardness = sender.currentTitle
        totalTime = (eggBoilTimes[sender.currentTitle!] ?? 0) * 6
        secondsRemaining = (eggBoilTimes[sender.currentTitle!] ?? 0) * 6
        timer =  Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if secondsRemaining > 0 {
            print ("\(secondsRemaining) seconds")
            secondsRemaining -= 1
            progressBar.progress = Float(totalTime - secondsRemaining)/Float(totalTime)
        } else if(secondsRemaining == 0) {
            timer.invalidate()
            titleLable.text = "Your Egg is Boiled!"
            print("It takes \(self.eggBoilTimes[selectedEggHardness!] ?? 0) minutes to boil & now your egg is boiled")
            playSound()
        }
    }
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            guard let player = player else { return }
            
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
}
