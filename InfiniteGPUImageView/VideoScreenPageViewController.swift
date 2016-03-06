//
//  VideoCameraPageViewController.swift
//  InfiniteGPUImageView
//
//  Created by Tyler Neveldine on 3/5/16.
//  Copyright © 2016 Tyler Neveldine. All rights reserved.
//

import UIKit
import GPUImage

class VideoScreenPageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    //Properties
    var videoCamera = VideoCamera()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate = self
        
        videoCamera.startCameraCapture()
        
        //Set initial view controller
        self.setViewControllers([newVideoScreenViewController()], direction: .Forward, animated: false, completion: nil)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        return newVideoScreenViewController()
        
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        return newVideoScreenViewController()
        
    }
    
    func newVideoScreenViewController() -> VideoScreenViewController {
        
        //Prevent memory issues & crashes
        if (videoCamera.targets().count > 3){
            videoCamera.removeTarget(videoCamera.targets().first as! GPUImageInput)
        }
        //Create the new VC and load it so there is a video screen for the camera to target
        let videoScreenViewController = storyboard?.instantiateViewControllerWithIdentifier("videoScreenViewController") as! VideoScreenViewController
        videoScreenViewController.loadView()
        
        let someFilter = GPUImageGrayscaleFilter()
        
        videoCamera.addTarget(someFilter)
        someFilter.addTarget(videoScreenViewController.videoScreenView)
        
        return videoScreenViewController
        
    }
    
}
