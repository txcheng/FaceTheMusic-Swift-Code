//
//  CameraView.swift
//  FaceTheMusic
//
//  Created by Tracy Cheng on 10/17/19.
//  Copyright © 2019 Tracy Cheng. All rights reserved.
//

import SwiftUI

struct CameraView: View {
    @Binding var showCamera: Bool
    @Binding var image: Image?
    //string encoding
    @Binding var emotion: String
    @Binding var resultImage: Image?
    
    var body: some View {
        CameraController(isShown: $showCamera, image: $image, emotion: $emotion, resultImage: $resultImage)
    }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        //pass in dummy values
        CameraView(showCamera: .constant(false), image: .constant(nil), emotion: .constant(""), resultImage: .constant(nil))
    }
}
