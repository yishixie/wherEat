//
//  mode1pause.swift
//  eat-rhythm
//
//  Created by Yishi Xie on 4/14/16.
//  Copyright © 2016 Yishi Xie. All rights reserved.
//

import UIKit
import AVFoundation

class mode1pause: UIViewController {
    
    @IBOutlet weak var stopTimeLabel: UILabel!
    
    
    //variable for receiving data from mode1
    var receivedStopTimeString: String = ""
    var receivedStopSecondCount:Int = 0;
    var receivedStopMinuteCount:Int = 0;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stopTimeLabel.text = receivedStopTimeString
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
    }
    
    override func viewWillDisappear(_ animated: Bool) {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: pass date to mode1
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Pass the tap number
        let stopTimeString = String(receivedStopTimeString)
        let second = receivedStopSecondCount
        let minute = receivedStopMinuteCount
        
        //pass to mode1 pause
        if let firstScene = segue.destination as? mode1{
            firstScene.stopTimeString = stopTimeString!
            firstScene.second = second
            firstScene.minute = minute
        }
    }
}

