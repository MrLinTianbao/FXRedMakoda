//
//  JCAudioPlayerHelper.swift
//  JChatSwift
//
//  Created by oshumini on 16/2/26.
//  Copyright © 2016年 HXHG. All rights reserved.
//

import UIKit
import AVFoundation

protocol JCAudioPlayerHelperDelegate: NSObjectProtocol {
    func didAudioPlayerBeginPlay(_ AudioPlayer: AVAudioPlayer)
    func didAudioPlayerStopPlay(_ AudioPlayer: AVAudioPlayer)
    func didAudioPlayerPausePlay(_ AudioPlayer: AVAudioPlayer)
}

final class JCAudioPlayerHelper: NSObject {
    
    var player: AVAudioPlayer!
    weak var delegate: JCAudioPlayerHelperDelegate?
    static let sharedInstance = JCAudioPlayerHelper()
    
    private override init() {
        super.init()
    }
    
    func managerAudioWithData(_ data:Data, toplay:Bool) {
        if toplay {
            playAudioWithData(data)
        } else {
            pausePlayingAudio()
        }
    }
    
    func playAudioWithData(_ voiceData:Data) {
        do {
            //AVAudioSessionCategoryPlayback
            if #available(iOS 10.0, *) {
                try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback, mode: AVAudioSession.Mode.default, options: AVAudioSession.CategoryOptions.defaultToSpeaker)
            } else {
                // Fallback on earlier versions
            }
        } catch let error as NSError {
            print("set category fail \(error)")
        }
        
        if player != nil {
            player.stop()
            player = nil
        }
        
        do {
            let pl: AVAudioPlayer = try AVAudioPlayer(data: voiceData)
            pl.delegate = self
            pl.play()
            player = pl
        } catch let error as NSError {
            print("alloc AVAudioPlayer with voice data fail with error \(error)")
        }
        
        UIDevice.current.isProximityMonitoringEnabled = true
    }
    
    func pausePlayingAudio() {
        player?.pause()
    }
    
    func stopAudio() {
        if player != nil && player.isPlaying {
            player.stop()
        }
        UIDevice.current.isProximityMonitoringEnabled = false
        delegate?.didAudioPlayerStopPlay(player)
    }
}


extension JCAudioPlayerHelper: AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        stopAudio()
    }
}
