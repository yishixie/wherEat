//
//  mode5.swift
//  eat-rhythm
//
//  Created by Yishi Xie on 4/13/16.
//  Copyright © 2016 Yishi Xie. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class mode5: UIViewController {
    
    var campAudioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath:Bundle.main.path(forResource: "camp", ofType: "mp3")!), fileTypeHint:nil)
    
    
    //    variables for timer
    var minute5 = 0
    var second5 = 0
    var startTimer5: Bool = false
    var stopTimeString5: String = ""
    var timer5 = Timer ()

    
    
    override func viewDidLoad() {
        campAudioPlayer.play()
        super.viewDidLoad()
        timer5 = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(mode5.updateTime5), userInfo: nil, repeats: true)
    }

    func updateTime5(){
        //        second increment every second
        second5 += 1
        if second5 == 60{
            minute5 += 1
            second5 = 0
        }
        //        9 - 10
        let secondString5 = second5 > 9 ? "\(second5)" : "0\(second5)"
        let minuteString5 = minute5 > 9 ? "\(minute5)" : "0\(minute5)"
        
        stopTimeString5 = "\(minuteString5):\(secondString5)"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        campAudioPlayer.play()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        campAudioPlayer.pause()
    }
    
    @IBAction func tapToMode5Pause(_ sender: AnyObject) {
        campAudioPlayer.pause()
        startTimer5 = false
        timer5.invalidate()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: pass date to mode5pause
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Pass the tap number
        let sendStopTimeString5 = String(stopTimeString5)
        let sendStopSecondCount5 = second5
        let sendStopMinuteCount5 = minute5
        
        //pass to mode5 pause
        if let secondScene5 = segue.destination as? mode5pause{
            secondScene5.receivedStopTimeString5 = sendStopTimeString5!
            secondScene5.receivedStopSecondCount5 = sendStopSecondCount5
            secondScene5.receivedStopMinuteCount5 = sendStopMinuteCount5
            
        }
    }
    
}
