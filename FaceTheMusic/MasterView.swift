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
                    .transition(.scale)
            }
        }
    }
    //have the MasterView observe the routingObserver
//    @EnvironmentObject var routingObserver: RoutingObserver
//
//    var body: some View {
//        VStack{
//            if routingObserver.viewPage == "page1"{
////                print("Hello main")
//                MainView()
//
//            }
//            else if routingObserver.viewPage == "page2"{
//                TakeAPictureView()
//                //cameraview
////                print("Hello camera")
//
//            }
////            else if routingObserver.viewPage == "music"{
////                //musicview
//////                print("Hello music")
////            }
////            else if routingObserver.viewPage == "about"{
////                //aboutview
//////                print("Hello about")
////            }
//        }
//    }
}

struct MasterView_Previews: PreviewProvider {
    static var previews: some View {
        MasterView().environmentObject(RoutingObserver())
    }
}
