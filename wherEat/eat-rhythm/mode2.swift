//
//  mode2.swift
//  eat-rhythm
//
//  Created by Yishi Xie on 4/13/16.
//  Copyright © 2016 Yishi Xie. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class mode2: UIViewController {
    
    var homeAudioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath:Bundle.main.path(forResource: "home", ofType: "mp3")!), fileTypeHint:nil)
    
    
    //    variables for timer
    var minute2 = 0
    var second2 = 0
    var startTimer2: Bool = false
    var stopTimeString2: String = ""
    var timer2 = Timer ()
    
    
    
    
    override func viewDidLoad() {
        homeAudioPlayer.play()
        
        super.viewDidLoad()
            timer2 = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(mode2.updateTime2), userInfo: nil, repeats: true)
        
    }
    
    func updateTime2(){
        //        second increment every second
        second2 += 1
        if second2 == 60{
            minute2 += 1
            second2 = 0
        }
        //        9 - 10
        let secondString2 = second2 > 9 ? "\(second2)" : "0\(second2)"
        let minuteString2 = minute2 > 9 ? "\(minute2)" : "0\(minute2)"
        
        stopTimeString2 = "\(minuteString2):\(secondString2)"
    }
    

    
    override func viewDidAppear(_ animated: Bool) {
        homeAudioPlayer.play()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        homeAudioPlayer.pause()
    }
    
    

    @IBAction func tapToMode2Pause(_ sender: AnyObject) {
        homeAudioPlayer.pause()
        startTimer2 = false
        timer2.invalidate()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: pass date to mode1pause
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Pass the tap number
        let sendStopTimeString2 = String(stopTimeString2)
        let sendStopSecondCount2 = second2
        let sendStopMinuteCount2 = minute2
        
        //pass to mode1 pause
        if let secondScene2 = segue.destination as? mode2pause{
            secondScene2.receivedStopTimeString2 = sendStopTimeString2!
            secondScene2.receivedStopSecondCount2 = sendStopSecondCount2
            secondScene2.receivedStopMinuteCount2 = sendStopMinuteCount2

    }
    }
}
