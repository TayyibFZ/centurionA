//
//  dataHubView.swift
//  Centurion
//
//  Created by Tayyib Fayyaz on 5/13/18.
//  Copyright © 2018 Tayyib Fayyaz. All rights reserved.
//
//

import UIKit
import Moscapsule
import Foundation

let mqttConfig = MQTTConfig(clientId: "iOS", host: "192.168.1.2", port: 1883, keepAlive: 9999)
let mqttClient = MQTT.newConnection(mqttConfig)


class dataHubView: UIViewController{
    
    @IBOutlet weak var humidityL: UILabel!
    @IBOutlet weak var waterL: UILabel!
    @IBOutlet weak var tempL: UILabel!
    @IBOutlet weak var refreshM: UIButton!
    @IBAction func backMain(_ sender: Any) {
        self.performSegue(withIdentifier: "backMainSegue" , sender: self)
        
    }
    @IBOutlet weak var backMain: UIButton!
    @IBAction func dataSwitch(_ sender: UISwitch) {
        if( sender.isOn == true){
            mqttClient.connectTo(host: "192.168.1.2", port: 1883, keepAlive: 60)
            mqttClient.subscribe("return/temp", qos: 2)
            print("temp suscribed")
            mqttClient.subscribe("return/water", qos: 2)
            print("water suscribed")
            mqttClient.subscribe("return/humid", qos: 2)
            print("humid suscribed")
            //mqttClient.connectTo(host: "10.0.0.40", port: 1883, keepAlive: 60)
        } else {
            mqttClient.disconnect()
        }
    }
   /* @IBAction func refreshM(_ sender: Any) {
         DispatchQueue.main.async {        print("TEST!")
        mqttClient.connectTo(host: "172.20.10.5", port: 1883, keepAlive: 60)
        mqttClient.subscribe("return/temp", qos: 2)
        print("temp suscribed")
        mqttClient.subscribe("return/water", qos: 2)
        print("water suscribed")
        mqttClient.subscribe("return/humid", qos: 2)
        print("humid suscribed")
        //mqttClient.connectTo(host: "10.0.0.40", port: 1883, keepAlive: 60)
        }
    } */
    
    
    
    override func viewDidLoad() {
        mqttConfig.onConnectCallback = { returnCode in
            // DispatchQueue.main.async {
            if returnCode == ReturnCode.success {
                print("Connected!")
            }
            else {
                print("Error")
            }
        }
        // }
        mqttConfig.onMessageCallback = { mqttMessage in
            DispatchQueue.main.async {
                let deku = mqttMessage.payloadString
                if mqttMessage.topic == "return/temp" {
                    print("temp")
                    self.tempL.text = deku
                } else if mqttMessage.topic == "return/water"{
                    print("water")
                    self.waterL.text = deku
                } else if mqttMessage.topic == "return/humid"{
                    print("humid")
                    self.humidityL.text = deku
                }
            }
        }
        super.viewDidLoad()
     
            backMain.layer.cornerRadius = backMain.frame.size.height/2
            backMain.layer.masksToBounds = true
            backMain.setGradientBackground(colorOne: Colors.white, colorTwo: Colors.blue)
           /* refreshM.layer.cornerRadius = backMain.frame.size.height/2
            refreshM.layer.masksToBounds = true
            refreshM.setGradientBackground(colorOne: Colors.red, colorTwo: Colors.veryDarkGrey)*/
            view.setGradientBackground(colorOne: Colors.blue, colorTwo: Colors.green)
        // Do any additional setup after loading the view, typically from a nib.
      
 
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}



