//
//  ViewController.swift
//  mem
//
//  Created by Julian Jackson on 12/14/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        topSegmentedControl.removeAllSegments()
        bottomSegmentedControl.removeAllSegments()
        
        for choice in topChoices {
            topSegmentedControl.insertSegment(withTitle: choice.emoji,
                                             at: topChoices.count,
                                             animated: false)
        }
        for choice in bottomChoices {
            bottomSegmentedControl.insertSegment(withTitle: choice.emoji,
                                             at: topChoices.count,
                                             animated: false)
        }
        topSegmentedControl.selectedSegmentIndex = 0
        bottomSegmentedControl.selectedSegmentIndex = 0
    }
    
    @IBAction func options(_ sender: Any) {
        updateCaptions()
        
    }
    func updateCaptions(){
        let topIndex = topSegmentedControl.selectedSegmentIndex
        let bottomIndex = bottomSegmentedControl.selectedSegmentIndex
        topCaptionLabel.text = topChoices[topIndex].caption
        bottomCaptionLabel.text = bottomChoices[bottomIndex].caption
    }
    var topChoices:[CaptionOption] = [CaptionOption(emoji: "🕶", caption: "You know what's cool?"), CaptionOption(emoji: "💥", caption: "You know what makes me mad?"), CaptionOption(emoji: "💕", caption: "You know what I love?")]
    
    var bottomChoices:[CaptionOption] = [CaptionOption(emoji: "🐱", caption: "Cats wearing hats"), CaptionOption(emoji: "🐕", caption: "Dogs carrying logs"), CaptionOption(emoji: "🐒", caption: "Monkeys being funky")]

    @IBOutlet weak var topCaptionLabel: UILabel!
    @IBOutlet weak var bottomCaptionLabel: UILabel!
    
    @IBOutlet weak var topSegmentedControl: UISegmentedControl!
    @IBOutlet weak var bottomSegmentedControl: UISegmentedControl!
    
    
    @IBAction func topDragLabel(_ sender: UIPanGestureRecognizer) {
        if sender.state == .changed {
                topCaptionLabel.center = sender.location(in: view)
    }
    
    }
    
    @IBAction func bottomDragLabel(_ sender: UIPanGestureRecognizer) {
        if sender.state == .changed {
                bottomCaptionLabel.center = sender.location(in: view)
}
    }
}
