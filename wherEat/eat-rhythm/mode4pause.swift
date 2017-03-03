//
//  mode4pause.swift
//  eat-rhythm
//
//  Created by Yishi Xie on 4/14/16.
//  Copyright © 4016 Yishi Xie. All rights reserved.
//

import UIKit
import AVFoundation

class mode4pause: UIViewController {
    
    @IBOutlet weak var stopTimeLabel: UILabel!
    
    //variable for receiving data from mode4
    var receivedStopTimeString4: String = ""
    var receivedStopSecondCount4:Int = 0;
    var receivedStopMinuteCount4:Int = 0;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stopTimeLabel.text = receivedStopTimeString4
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
    }
    
    override func viewWillDisappear(_ animated: Bool) {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: pass date to mode4
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Pass the tap number
        let stopTimeString4 = String(receivedStopTimeString4)
        let second4 = receivedStopSecondCount4
        let minute4 = receivedStopMinuteCount4
        
        //pass to mode4 pause
        if let firstScene4 = segue.destination as? mode4{
            firstScene4.stopTimeString4 = stopTimeString4!
            firstScene4.second4 = second4
            firstScene4.minute4 = minute4
        }
    }
    
    
}
