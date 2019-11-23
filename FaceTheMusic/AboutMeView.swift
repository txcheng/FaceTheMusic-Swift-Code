//
//  AboutMeView.swift
//  FaceTheMusic
//
//  Created by Tracy Cheng on 11/22/19.
//  Copyright © 2019 Tracy Cheng. All rights reserved.
//

import SwiftUI

struct AboutMeView: View {
    @EnvironmentObject var routingObserver: RoutingObserver
    
    var body: some View {
        VStack{
            Button(action: {self.routingObserver.currentPage = "main"}) {
                BackButtonContent()
            }
        }
    }
}

struct AboutMeView_Previews: PreviewProvider {
    static var previews: some View {
        AboutMeView()
    }
}

//
//struct BackButtonContent : View {
//    var body: some View {
//        return Text("Go back to menu")
//            .foregroundColor(.white)
//            .frame(width: 200, height: 50)
//            .background(Color.blue)
//            .cornerRadius(15)
//            .padding(.top, 50)
//    }
//}
