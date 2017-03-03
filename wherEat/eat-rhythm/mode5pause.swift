//
//  mode5pause.swift
//  eat-rhythm
//
//  Created by Yishi Xie on 4/14/16.
//  Copyright © 2016 Yishi Xie. All rights reserved.
//

import UIKit
import AVFoundation

class mode5pause: UIViewController {
    
    @IBOutlet weak var stopTimeLabel: UILabel!
    
    //variable for receiving data from mode5
    var receivedStopTimeString5: String = ""
    var receivedStopSecondCount5:Int = 0;
    var receivedStopMinuteCount5:Int = 0;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stopTimeLabel.text = receivedStopTimeString5
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
    }
    
    override func viewWillDisappear(_ animated: Bool) {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: pass date to mode5
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Pass the tap number
        let stopTimeString5 = String(receivedStopTimeString5)
        let second5 = receivedStopSecondCount5
        let minute5 = receivedStopMinuteCount5
        
        //pass to mode5 pause
        if let firstScene5 = segue.destination as? mode5{
            firstScene5.stopTimeString5 = stopTimeString5!
            firstScene5.second5 = second5
            firstScene5.minute5 = minute5
        }
    }
    
    
}
