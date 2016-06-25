//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Xing Du on 6/13/16.
//  Copyright © 2016 XingDu. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    @IBOutlet weak var SnailButton: UIButton!
    @IBOutlet weak var RabbitButton: UIButton!
    @IBOutlet weak var ChipmunkButton: UIButton!
    @IBOutlet weak var DarthVaderButton: UIButton!
    
    @IBOutlet weak var EchoButton: UIButton!
    @IBOutlet weak var ReverbButton: UIButton!
    @IBOutlet weak var StopButton: UIButton!
    
    
    var recordedAudioURL : NSURL!
    /*
    var audioFile: AVAudioFile!
    var audioEngine : AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode! */
    var stopTimer: NSTimer!
    
    enum ButtonType : Int {case Slow = 0, Fast, Chipmunk, Vader, Echo,Reverb}
    
    @IBAction func playSoundForButton(sender:UIButton){
        /*
        switch(ButtonType(rawValue:sender.tag)!){
        case .Slow:
            playSound(rate:0.5)
        case .Fast:
            playSound(rate: 1.5)
        case .Chipmunk:
            playSound(pitch: 1000)
        case .Vader:
            playSound(pitch: -1000)
        case .Echo:
            playSound(echo:true)
        case .Reverb:
            playSound(reverb:true)
        }*/
        print("Play Sound Button Pressed!")
    }
    
    @IBAction func stopButtonPressed(sender:UIButton){
        print("Stop Audio Button Pressed!")
        //stopAudio()
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "stopRecording") {
            let playSoundsVC = segue.destinationViewController as! PlaySoundsViewController
            let recordedAudioURL = sender as! NSURL
            playSoundsVC.recordedAudioURL = recordedAudioURL
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("PlaySoundsViewController Loaded")
        //setupAudio()
        // Do any additional setup after loading the view, typically from a nib.
    }
   
    /*
    override func viewWillAppear(animated: Bool) {
        configureUI(.NotPlaying)
    }*/
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
