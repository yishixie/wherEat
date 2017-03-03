//
//  ViewController.swift
//  eat-rhythm
//
//  Created by Yishi Xie on 4/13/16.
//  Copyright © 2016 Yishi Xie. All rights reserved.
//

import UIKit
import AVFoundation

class mode1: UIViewController {
    
    
//    define audio url
    var seawaveAudioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath:Bundle.main.path(forResource: "seawave", ofType: "mp3")!), fileTypeHint:nil)
    
    
//    variables for timer
    var minute = 0
    var second = 0
    var startTimer: Bool = false
    var stopTimeString: String = ""
    var timer = Timer ()
    

    override func viewDidLoad() {
        seawaveAudioPlayer.play()
        
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(mode1.updateTime), userInfo: nil, repeats: true)
        
    }
    

    
    //MARK: update timer function
    func updateTime(){
//        second increment every second
        second += 1
        if second == 60{
            minute += 1
        second = 0
        }
//        9 - 10
        let secondString = second > 9 ? "\(second)" : "0\(second)"
        let minuteString = minute > 9 ? "\(minute)" : "0\(minute)"
        
        stopTimeString = "\(minuteString):\(secondString)"
    }

    
    override func viewDidAppear(_ animated: Bool) {
            seawaveAudioPlayer.play()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        seawaveAudioPlayer.pause()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func tapToMode1Pause(_ sender: AnyObject) {
        seawaveAudioPlayer.pause()
        startTimer = false
        timer.invalidate()
    }
    
//MARK: pass date to mode1pause
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Pass the tap number
        let sendStopTimeString = String(stopTimeString)
        let sendStopSecondCount = second
        let sendStopMinuteCount = minute

        //pass to mode1 pause
            if let secondScene = segue.destination as? mode1pause{
                secondScene.receivedStopTimeString = sendStopTimeString!
                secondScene.receivedStopSecondCount = sendStopSecondCount
                secondScene.receivedStopMinuteCount = sendStopMinuteCount
        }
//        //pass to mode2
//        if segue.identifier == "tapToPassNextTimeCount" {
//            if let nextScene = segue.destinationViewController as? mode2{
//                nextScene.receivedStopSecondCount = sendStopSecondCount
//                nextScene.receivedStopMinuteCount = sendStopMinuteCount}
//            
//            }
//        //pass to mode 5
//        if segue.identifier == "tapToPassPreviousTimeCount" {
//            if let previousScene = segue.destinationViewController as? mode5{
//                previousScene.receivedStopSecondCount = sendStopSecondCount
//                previousScene.receivedStopMinuteCount = sendStopMinuteCount}
//        }
    }

}

