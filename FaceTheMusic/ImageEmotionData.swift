//
//  ImageEmotionData.swift
//  FaceTheMusic
//
//  Created by Tracy Cheng on 11/23/19.
//  Copyright © 2019 Tracy Cheng. All rights reserved.
//

import Foundation
import SwiftUI
import Combine


class ImageEmotionData: ObservableObject {
    
    //don't change this variable name!
    let objectWillChange = PassthroughSubject<ImageEmotionData,Never>()
    
    var emotion: String = "" {
        didSet {
            objectWillChange.send(self)
        }
    }
    
    var img: Image? = nil {
        didSet {
            objectWillChange.send(self)
        }
    }
}
