//
//  mode.swift
//  eat-rhythm
//
//  Created by Yishi Xie on 4/1/16.
//  Copyright © 3016 Yishi Xie. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class mode3: UIViewController {
    
    var parkAudioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath:Bundle.main.path(forResource: "park", ofType: "mp3")!), fileTypeHint:nil)
    //    variables for timer
    var minute3 = 0
    var second3 = 0
    var startTimer3: Bool = false
    var stopTimeString3: String = ""
    var timer3 = Timer ()
    
    
    override func viewDidLoad() {
        parkAudioPlayer.play()
        
        super.viewDidLoad()
        timer3 = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(mode3.updateTime3), userInfo: nil, repeats: true)
    }
    
    func updateTime3(){
        //        second increment every second
        second3 += 1
        if second3 == 60{
            minute3 += 1
            second3 = 0
        }
        //        9 - 10
        let secondString3 = second3 > 9 ? "\(second3)" : "0\(second3)"
        let minuteString3 = minute3 > 9 ? "\(minute3)" : "0\(minute3)"
        
        stopTimeString3 = "\(minuteString3):\(secondString3)"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        parkAudioPlayer.play()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        parkAudioPlayer.pause()
    }
    
    @IBAction func tapToMode3Pause(_ sender: AnyObject) {
        parkAudioPlayer.pause()
        startTimer3 = false
        timer3.invalidate()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: pass date to mode3pause
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Pass the tap number
        let sendStopTimeString3 = String(stopTimeString3)
        let sendStopSecondCount3 = second3
        let sendStopMinuteCount3 = minute3
        
        //pass to mode3 pause
        if let secondScene3 = segue.destination as? mode3pause{
            secondScene3.receivedStopTimeString3 = sendStopTimeString3!
            secondScene3.receivedStopSecondCount3 = sendStopSecondCount3
            secondScene3.receivedStopMinuteCount3 = sendStopMinuteCount3
            
        }
    }
}
