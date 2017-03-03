//
//  mode2pause.swift
//  eat-rhythm
//
//  Created by Yishi Xie on 4/14/16.
//  Copyright © 2016 Yishi Xie. All rights reserved.
//

import UIKit
import AVFoundation

class mode2pause: UIViewController {
    
    
    @IBOutlet weak var stopTimeLabel: UILabel!
    
    //variable for receiving data from mode1
    var receivedStopTimeString2: String = ""
    var receivedStopSecondCount2:Int = 0;
    var receivedStopMinuteCount2:Int = 0;

    
    override func viewDidLoad() {
        super.viewDidLoad()
        stopTimeLabel.text = receivedStopTimeString2
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
    }
    
    override func viewWillDisappear(_ animated: Bool) {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: pass date to mode2
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Pass the tap number
        let stopTimeString2 = String(receivedStopTimeString2)
        let second2 = receivedStopSecondCount2
        let minute2 = receivedStopMinuteCount2
        
        //pass to mode2 pause
        if let firstScene2 = segue.destination as? mode2{
            firstScene2.stopTimeString2 = stopTimeString2!
            firstScene2.second2 = second2
            firstScene2.minute2 = minute2
        }
    }

    
}
