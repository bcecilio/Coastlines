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
    
    private let currentView: UIView
    private var player: AVPlayer
    
    init(_ view: UIView) {
        self.currentView = view
        self.player = AVPlayer()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("required init(coder:) is not implemented.")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        downcastView()
    }
    
    override func loadView() {
        view = currentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    private func setUp() {
        currentView.backgroundColor = PaletteColour.darkBlue.colour
    }
}

extension OnboardingController {
    
    /**
          Downcasts the current View Controller's view in order to decide which background video should be played.
     */
    private func downcastView() {
        if let _ = view as? SecondOnboardingView{
            playBackgroundVideo("IcebergPan")
        } else if let _ = view as? ThirdOnboardingView{
            playBackgroundVideo("IcebergPan2")
        } else if let _ = view as? FourthOnboardingView{
            playBackgroundVideo("coastPan")
        } else if let _ = view as? FifthOnboardingView{
            playBackgroundVideo("IcebergPan3")
        }
    }
    
    /**
            Plays a video on the layer of the current view.
            - Parameters:
                - resource: A string corresponding to the name of a .mov file.
     */
    private func playBackgroundVideo(_ resource: String) {
        guard let path = Bundle.main.path(forResource: resource, ofType: "mov") else {
            return
        }
        
        player = AVPlayer(url: URL(fileURLWithPath: path))
        player.actionAtItemEnd = AVPlayer.ActionAtItemEnd.none
        player.play()
        player.isMuted = true
        
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = view.frame
        playerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        view.layer.insertSublayer(playerLayer, at: 0)
    }
}
