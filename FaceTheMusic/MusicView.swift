//
//  MusicView.swift
//  FaceTheMusic
//
//  Created by Tracy Cheng on 11/22/19.
//  Copyright © 2019 Tracy Cheng. All rights reserved.
//

import SwiftUI

struct MusicView: View {
    @EnvironmentObject var routingObserver: RoutingObserver
    
    var body: some View {
        VStack{
            Button(action: {self.routingObserver.currentPage = "main"}) {
                BackButtonContent()
            }
        }
    }
}

struct MusicView_Previews: PreviewProvider {
    static var previews: some View {
        MusicView()
    }
}
