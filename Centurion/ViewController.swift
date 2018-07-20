//
//  ViewController.swift
//  Centurion
//
//  Created by Tayyib Fayyaz on 5/13/18.
//  Copyright © 2018 Tayyib Fayyaz. All rights reserved.
//

import UIKit
import Foundation
import Moscapsule

class ViewController: UIViewController{
    
    @IBOutlet weak var dataHub: UIButton!
    @IBOutlet weak var backCam: UIButton!
    @IBOutlet weak var sway: UIButton!
    @IBAction func dataHub(_ sender: Any) {
        self.performSegue(withIdentifier: "dataHubSegue" , sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataHub.layer.cornerRadius = dataHub.frame.size.height/2
        dataHub.layer.masksToBounds = true
        dataHub.setGradientBackground(colorOne: Colors.blue, colorTwo: Colors.white)
        
        
        sway.layer.cornerRadius = sway.frame.size.height/2
        sway.layer.masksToBounds = true
        sway.setGradientBackground(colorOne: Colors.orange, colorTwo: Colors.red)
        
        backCam.layer.cornerRadius = backCam.frame.size.height/2
        backCam.layer.masksToBounds = true
        backCam.setGradientBackground(colorOne: Colors.orange, colorTwo: Colors.red)
        
        view.setGradientBackground(colorOne: Colors.green, colorTwo: Colors.blue)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}
