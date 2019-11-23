//
//  MasterView.swift
//  FaceTheMusic
//
//  Created by Tracy Cheng on 11/22/19.
//  Copyright © 2019 Tracy Cheng. All rights reserved.
//

import SwiftUI

struct MasterView: View {
    @EnvironmentObject var routingObserver: RoutingObserver
    
    var body: some View {
        VStack {
            if routingObserver.currentPage == "main" {
                MainView()
            } else if routingObserver.currentPage == "camera" {
                TakeAPictureView()
            }
            else if routingObserver.currentPage == "music"{
                MusicView()
            }
            else if routingObserver.currentPage == "about"{
                AboutMeView()
            }
        }
    }
}

struct MasterView_Previews: PreviewProvider {
    static var previews: some View {
        MasterView().environmentObject(RoutingObserver())
    }
}
