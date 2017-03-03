//
//  mode4.swift
//  eat-rhythm
//
//  Created by Yishi Xie on 4/13/16.
//  Copyright © 4016 Yishi Xie. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class mode4: UIViewController {
    
    var restaurantAudioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath:Bundle.main.path(forResource: "restaurant", ofType: "mp3")!), fileTypeHint:nil)
    
    //    variables for timer
    var minute4 = 0
    var second4 = 0
    var startTimer4: Bool = false
    var stopTimeString4: String = ""
    var timer4 = Timer ()
    
    override func viewDidLoad() {
        restaurantAudioPlayer.play()
        
        super.viewDidLoad()
        timer4 = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(mode4.updateTime4), userInfo: nil, repeats: true)
    }
    
    func updateTime4(){
        //        second increment every second
        second4 += 1
        if second4 == 60{
            minute4 += 1
            second4 = 0
        }
        //        9 - 10
        let secondString4 = second4 > 9 ? "\(second4)" : "0\(second4)"
        let minuteString4 = minute4 > 9 ? "\(minute4)" : "0\(minute4)"
        
        stopTimeString4 = "\(minuteString4):\(secondString4)"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        restaurantAudioPlayer.play()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        restaurantAudioPlayer.pause()
    }
    
    @IBAction func tapToMode4Pause(_ sender: AnyObject) {
        restaurantAudioPlayer.pause()
        startTimer4 = false
        timer4.invalidate()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK: pass date to mode4pause
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Pass the tap number
        let sendStopTimeString4 = String(stopTimeString4)
        let sendStopSecondCount4 = second4
        let sendStopMinuteCount4 = minute4
        
        //pass to mode4 pause
        if let secondScene4 = segue.destination as? mode4pause{
            secondScene4.receivedStopTimeString4 = sendStopTimeString4!
            secondScene4.receivedStopSecondCount4 = sendStopSecondCount4
            secondScene4.receivedStopMinuteCount4 = sendStopMinuteCount4
            
        }
    }
    
}
