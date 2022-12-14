//
//  ViewController.swift
//  clickerGameViewControllers
//
//  Created by ETHAN LAUDICK on 9/29/22.
//

import UIKit

class ViewController: UIViewController {

    var clicks = 0
    var clickIncrement = 1
    var critChance = 0
    var incrPriceStored = 50
    
    @IBOutlet weak var clicksNumberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        clicksNumberLabel.text = "Clicks: \(clicks)"
        
    }

    @IBAction func clickMeAction(_ sender: Any) {
        var x = Int.random(in: 1...100)
        if critChance >= x {
            clicks += clickIncrement*5
        } else {
            clicks += clickIncrement
        }
        clicksNumberLabel.text = "Clicks: \(clicks)"
    }
    
    @IBAction func storeButton(_ sender: Any) {
        performSegue(withIdentifier: "storeSegue", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "storeSegue" {
            let blah = segue.destination as! clickStoreViewController
            blah.currentClicks = clicks
            blah.adustedIncrement = clickIncrement
            blah.adjustedCrit = critChance
            blah.incrPrice = incrPriceStored
        }
    }
    
    @IBAction func unwind(_ seg: UIStoryboardSegue){
        //let svc = seg.source as! ViewController
    }
    
    
    
}

