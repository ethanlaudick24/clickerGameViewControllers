//
//  clickStoreViewController.swift
//  clickerGameViewControllers
//
//  Created by ETHAN LAUDICK on 10/3/22.
//

import UIKit

class clickStoreViewController: UIViewController {
    
    var currentClicks: Int!
    var adustedIncrement: Int!
    var incrPrice = 50
    var adjustedCrit: Int!
    
    @IBOutlet weak var clickDisplayLabel: UILabel!
    
    @IBOutlet weak var currentCritChanceLabel: UILabel!
    
    @IBOutlet weak var currentIncrLabel: UILabel!
    
    @IBOutlet weak var incrPriceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        clickDisplayLabel.text = "Current Clicks: \(currentClicks!)"
        
        incrPriceLabel.text = "Price: \(incrPrice)"
        
        currentIncrLabel.text = "Current Increment: \(adustedIncrement!)"
        
        currentCritChanceLabel.text = "Current Crit Chance: \(adjustedCrit!)/100"
    }
    

    @IBAction func increaseClickIncrement(_ sender: Any) {
        if currentClicks >= incrPrice{
            currentClicks -= incrPrice
            adustedIncrement += 1
            clickDisplayLabel.text = "Current Clicks: \(currentClicks!)"
            incrPrice *= 2
            incrPriceLabel.text = "Price: \(incrPrice)"
            currentIncrLabel.text = "Current Increment: \(adustedIncrement!)"
        }
    }
    
    @IBAction func increaseRandomChance(_ sender: Any) {
        if currentClicks >= 100 && adjustedCrit < 100{
            currentClicks -= 100
            adjustedCrit += 1
            clickDisplayLabel.text = "Current Clicks: \(currentClicks!)"
            currentCritChanceLabel.text = "Current Crit Chance: \(adjustedCrit!)/100"
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if isMovingFromParent{
            performSegue(withIdentifier: "unwindToMain", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "unwindToMain"{
            let main = segue.destination as! ViewController
            main.clicks = currentClicks
            main.clickIncrement = adustedIncrement
            main.critChance = adjustedCrit
            main.incrPriceStored = incrPrice
            main.clicksNumberLabel.text = "Clicks: \(currentClicks!)"
        }
    }
    
    

}
