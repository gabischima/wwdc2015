//
//  ProfessionalViewController.swift
//  GabrielaMauricio
//
//  Created by Gabriela Schirmer Mauricio on 4/21/15.
//  Copyright (c) 2015 Gabriela Schirmer Mauricio. All rights reserved.
//

import Foundation
import UIKit
import MediaPlayer

class ProfessionalViewController: UIViewController { // class for profesisonal interests

    @IBOutlet weak var myVideoView: UIView!
    @IBOutlet weak var myScroll: UIScrollView!
    var moviePlayer : MPMoviePlayerController?

    var play: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playVideo()
    }
    
    func playVideo() {
        let path = NSBundle.mainBundle().pathForResource("IMG_0247", ofType:"m4v")
        let url = NSURL.fileURLWithPath(path!)
        moviePlayer = MPMoviePlayerController(contentURL: url)
        if let player = moviePlayer {
            player.view.frame.size = myVideoView.frame.size
            player.view.frame.origin.x = 0
            player.view.frame.origin.y = 0
            player.view.frame.size.width = myVideoView.frame.size.width
            player.view.frame.size.height = myVideoView.frame.size.height
            player.scalingMode = .AspectFill
            myVideoView.addSubview(player.view)
            player.prepareToPlay()
            player.shouldAutoplay = false
        }
    }
}
