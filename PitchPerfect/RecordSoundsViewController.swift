//
//  RecordSoundsViewController.swift
//  PitchPerfect
//
//  Created by Xing Du on 6/8/16.
//  Copyright © 2016 XingDu. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {
    
    @IBOutlet weak var recordButton: UIButton!
    
    @IBOutlet weak var Recording_label: UILabel!
    
    @IBOutlet weak var stopRecordingButton: UIButton!
    
    var audioRecorder:AVAudioRecorder!

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    enum LabelType : Int {case record = 0, stop }
    
    func recordLabel(text: String ,record: Bool, stop :Bool){
       
        Recording_label.text = text
        recordButton.enabled = record
        stopRecordingButton.enabled = stop
    }

    @IBAction func recordAudio(sender: AnyObject) {
        print("record buttons pressed")
        
        recordLabel("Recording in progress",record: false, stop: true) //abstract method
        let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory,.UserDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = NSURL.fileURLWithPathComponents(pathArray)
        print(filePath)
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord)
        
        try! audioRecorder = AVAudioRecorder(URL: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.meteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }
 
    @IBAction func stopRecording(sender: AnyObject) {
        print("stop Recording button pressed")
        recordLabel("Tap to Record",record : true, stop: false)//abstract method
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
        stopRecordingButton.enabled = false
    }
    
    func audioRecorderDidFinishRecording (recorder:AVAudioRecorder,successfully flag:Bool){
        print("AVAudioRecorder finished saving recording")
        if (flag){
            performSegueWithIdentifier("stopRecording", sender: audioRecorder.url)
        }else{
            print("Saving of Recording Failed")
        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "stopRecording") {
            let playSoundsVC = segue.destinationViewController as! PlaySoundsViewController
            let recordedAudioURL = sender as! NSURL
            playSoundsVC.recordedAudioURL = recordedAudioURL
        }
    }
}
