//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import AVFoundation
import AudioToolbox

class ViewController: UIViewController, AVAudioPlayerDelegate{
    
    var player : AVAudioPlayer?// 1 version
    var audioPlayer: AVAudioPlayer!
    
    
    let noteFileNames: [String] = [
        "note1",
        "note2",
        "note3",
        "note4",
        "note5",
        "note6",
        "note7"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func notePressed(_ sender: UIButton) { 
        playSound(noteName: noteFileNames[sender.tag - 1])
    }
    
    
    func playSound(noteName: String){
        let soundURL =  Bundle.main.url(forResource: noteName, withExtension: "wav")
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
//          try! audioPlayer =  AVAudioPlayer(contentsOf: soundURL!) можно так без кетча но лучше не надо
            audioPlayer.play()
        }
        catch {
            print(error)
        }
        /*if let soundURL = Bundle.main.url(forResource: noteFileNames[noteTag-1], withExtension: "wav") {
            var mySound: SystemSoundID = 0
            AudioServicesCreateSystemSoundID(soundURL as CFURL, &mySound)
            AudioServicesPlaySystemSound(mySound)
        }*/
        
        /*let path = Bundle.main.path(forResource: noteFileNames[noteTag - 1], ofType:"wav")!
        let url = URL(fileURLWithPath: path)
        
        do {
            
            let sound = try AVAudioPlayer(contentsOf: url)
            self.player = sound
            sound.numberOfLoops = 1
            sound.prepareToPlay()
            sound.play()
        } catch {
            print("error loading file")
            // couldn't load file :(
        }*/
        
    }

}

