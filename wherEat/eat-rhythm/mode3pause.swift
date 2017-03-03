//
//  mode3pause.swift
//  eat-rhythm
//
//  Created by Yishi Xie on 4/14/16.
//  Copyright © 3016 Yishi Xie. All rights reserved.
//

import UIKit
import AVFoundation

class mode3pause: UIViewController {
    
    
    @IBOutlet weak var stopTimeLabel: UILabel!
    
    //variable for receiving data from mode3
    var receivedStopTimeString3: String = ""
    var receivedStopSecondCount3:Int = 0;
    var receivedStopMinuteCount3:Int = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stopTimeLabel.text = receivedStopTimeString3
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
    }
    
    override func viewWillDisappear(_ animated: Bool) {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: pass date to mode3
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Pass the tap number
        let stopTimeString3 = String(receivedStopTimeString3)
        let second3 = receivedStopSecondCount3
        let minute3 = receivedStopMinuteCount3
        
        //pass to mode3 pause
        if let firstScene3 = segue.destination as? mode3{
            firstScene3.stopTimeString3 = stopTimeString3!
            firstScene3.second3 = second3
            firstScene3.minute3 = minute3
        }
    }
    
}
