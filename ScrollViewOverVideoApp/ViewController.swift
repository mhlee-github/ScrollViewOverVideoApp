//
//  ViewController.swift
//  ScrollViewOverVideoApp
//
//  Created by mhlee on 2018. 5. 4..
//  Copyright © 2018년 mhlee. All rights reserved.
//

import UIKit
import BMPlayer
import SnapKit

class ViewController: UIViewController {

  
  var videoPlayer: BMPlayer!
//  let videoPlayer = UIView()
  
  let scrollView = ScrollView()
  let shadowView = ShadowView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let screenSize = UIScreen.main.bounds.size
    
    view.backgroundColor = .white

//    BMPlayerConf.allowLog = true
//    BMPlayerConf.shouldAutoPlay = false
    
    videoPlayer = BMPlayer()
    let videoAsset = BMPlayerResource(url: URL(string: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4")!)
    videoPlayer.setVideo(resource: videoAsset)
    
//    videoPlayer.isUserInteractionEnabled = false
    
    scrollView.backgroundColor = .clear
    scrollView.isUserInteractionEnabled = true
    scrollView.contentSize = .init(width: screenSize.width*2, height: screenSize.height)
    scrollView.isPagingEnabled = true
    
    shadowView.backgroundColor = UIColor(displayP3Red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
    
    view.addSubview(videoPlayer)
    view.addSubview(scrollView)
    scrollView.addSubview(shadowView)
    
    view.bringSubview(toFront: scrollView)
    
    videoPlayer.snp.makeConstraints { make in
      make.top.left.bottom.right.equalTo(view)
    }
    
    scrollView.snp.makeConstraints { make in
      make.top.left.bottom.right.equalTo(view)
    }

    shadowView.snp.makeConstraints { make in
      make.left.equalTo(scrollView).offset(screenSize.width)
      make.top.equalTo(scrollView)
      make.size.equalTo(screenSize)
//      make.left.equalTo(scrollView.snp.right)
////      make.right.equalTo(scrollView.snp.right).multipliedBy(2)
//      make.width.equalTo(scrollView.snp.width)
//      make.top.bottom.equalTo(videoPlayer)
//
////      make.size.equalTo(screenSize)
    }
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

class ScrollView: UIScrollView {
  
}

class ShadowView: UIView {
  
}
