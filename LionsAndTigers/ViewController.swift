//
//  ViewController.swift
//  LionsAndTigers
//
//  Created by ahu on 10/8/14.
//  Copyright (c) 2014 Grand Thunder. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var breedLabel: UILabel!
    
    var myTigers:[Tiger] = []
    var tigerIndex = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var myTiger = Tiger()
        myTiger.name = "Tigger"
        myTiger.breed = "Bengal"
        myTiger.age = 3
        myTiger.image = UIImage(named: "BengalTiger.jpg")
        
        myTigers.append(myTiger)
        
        myImageView.image = myTiger.image
        nameLabel.text = myTiger.name
        ageLabel.text = "\(myTiger.age)"
        breedLabel.text = myTiger.breed
        
        var secondTiger = Tiger()
        secondTiger.name = "Tigress"
        secondTiger.breed = "Indochnese Tiger"
        secondTiger.age = 2
        secondTiger.image = UIImage(named: "IndochineseTiger.jpg")
        
        var thirdTiger = Tiger()
        thirdTiger.name = "Jacob"
        thirdTiger.breed = "Malayan Tiger"
        thirdTiger.age = 2
        thirdTiger.image = UIImage(named: "MalayanTiger.jpg")
        
        var fourthTiger = Tiger()
        fourthTiger.name = "Spar"
        fourthTiger.breed = "Siberian Tiger"
        fourthTiger.age = 5
        fourthTiger.image = UIImage(named: "SiberianTiger.jpg")
        
        myTigers += [secondTiger, thirdTiger, fourthTiger]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func displayTiger(myTiger: Tiger) {
//        myImageView.image = myTiger.image
//        nameLabel.text = myTiger.name
//        ageLabel.text = "\(myTiger.age)"
//        breedLabel.text = myTiger.breed
        
        UIView.transitionWithView(self.view, duration: 5, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
                self.myImageView.image = myTiger.image
                self.nameLabel.text = myTiger.name
                self.ageLabel.text = "\(myTiger.age)"
                self.breedLabel.text = myTiger.breed
            }, completion: {
                (finished:Bool) -> () in
        })
    }
    
    @IBAction func previousButtonPressed(sender: UIBarButtonItem) {
        tigerIndex--
        if (tigerIndex < 0) {
            tigerIndex = myTigers.count - 1
        }
        displayTiger(myTigers[tigerIndex])
    }
    
    @IBAction func nextButtonPressed(sender: AnyObject) {
        tigerIndex++
        if (tigerIndex >= myTigers.count) {
            tigerIndex = 0
        }
        displayTiger(myTigers[tigerIndex])

    }

}

