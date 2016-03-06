//
//  VideoCamera.swift
//  Unleash Your Demon
//
//  Created by Tyler Neveldine on 3/5/16.
//  Copyright © 2016 Tyler Neveldine. All rights reserved.
//

import UIKit
import GPUImage

class VideoCamera: GPUImageVideoCamera {
    
    override init() {
        super.init(sessionPreset: AVCaptureSessionPreset1280x720, cameraPosition: AVCaptureDevicePosition.Front)
        horizontallyMirrorFrontFacingCamera = true
        outputImageOrientation = UIInterfaceOrientation.Portrait
    }
    
}
