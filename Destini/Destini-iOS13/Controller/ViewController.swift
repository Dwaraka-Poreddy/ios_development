//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    var storyBrain = StoryBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var newStory =  storyBrain.nextStory(userChoice: "")
        updateUI(newStory)
    }
    
    @IBAction func choiceMade(_ sender: UIButton) {
        var newStory =  storyBrain.nextStory(userChoice: sender.titleLabel!.text!)
        updateUI(newStory)
    }
    
    func updateUI(_ newStory: Story) {
        storyLabel.text = newStory.title
        choice1Button.setTitle(newStory.choice1, for: .normal)
        choice2Button.setTitle(newStory.choice2, for: .normal)
    }
    
}

