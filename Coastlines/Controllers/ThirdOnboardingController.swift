//
//  ThridOnboardingController.swift
//  Coastlines
//
//  Created by Cameron Rivera on 5/31/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit
import AVFoundation

class ThirdOnboardingController: UIViewController {
    
    private let thirdOnboardingView = ThirdOnboardingView()
    private var player: AVPlayer?
    
    override func loadView(){
        view = thirdOnboardingView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
//        playBackgroundVideo()
        setUp()
    }
    
    private func setUp(){
        thirdOnboardingView.backgroundColor = PaletteColour.lightBlue.colour
    }
    
    private func playBackgroundVideo() {
        let path = Bundle.main.path(forResource: "IcebergPan2", ofType: "mov")
        player = AVPlayer(url: URL(fileURLWithPath: path!))
        player!.actionAtItemEnd = AVPlayer.ActionAtItemEnd.none
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.view.frame
        playerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        self.view.layer.insertSublayer(playerLayer, at: 0)
        NotificationCenter.default.addObserver(self, selector: #selector(video), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: player!.currentItem)
        player!.seek(to: CMTime.zero)
        player!.play()
        self.player?.isMuted = true
    }
    
    @objc func video() {
        player!.seek(to: CMTime.zero)
    }
}
