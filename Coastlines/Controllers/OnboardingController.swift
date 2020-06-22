//
//  SecondOnboardingControllerViewController.swift
//  Coastlines
//
//  Created by Cameron Rivera on 5/31/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit
import AVFoundation

class OnboardingController: UIViewController {

    private let secondOnboardingView: UIView
    
    private var player: AVPlayer?
    
    init(_ view: UIView){
        self.secondOnboardingView = view
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("required init(coder:) is not implemented.")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animateChevrons()
    }
    
    override func loadView(){
        view = secondOnboardingView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playBackgroundVideo()
        setUp()
    }
    
    private func setUp(){
        secondOnboardingView.backgroundColor = PaletteColour.lightBlue.colour
    }
}

extension OnboardingController {
    
    private func animateChevrons(){
        if let displayView = view as? SecondOnboardingView{
            displayView.animateNextButton()
        } else if let displayView = view as? ThirdOnboardingView{
            displayView.animateChevrons()
        } else if let displayView = view as? FourthOnboardingView{
            displayView.animateChevrons()
        } else if let displayView = view as? FifthOnboardingView{
            displayView.animatePrevButton()
        }
    }
    
    private func playBackgroundVideo() {
        let path = Bundle.main.path(forResource: "IcebergPan", ofType: "mov")
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
