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
            NavigationBar()
            Divider()
            //put stuff here
            VStack(alignment: .center){
                Text("Welcome to Face the Music!").font(.title).multilineTextAlignment(.center).padding()
                Text("\n\n\tHi! Welcome to my first ever iOS app - Face the Music. I made this application as a side project to test my ability to deal with ML models and design a phone application. \n\n\tThe function of this application is to take in a picture captured by your camera, see if there is a human face in it, and identify the emotion shown. Of course, because no model is perfect, sometimes a face will be detected when there isn't one and vice versa. But, it functions pretty well given the complexity of the demands.\n\n\t All the code is on my github (look up txcheng) and feel free to email me at: txcheng@dons.usfca.edu!")
                    .multilineTextAlignment(.leading)
                .padding()
                
            }
            Spacer()
        }
     }
}

struct AboutMeView_Previews: PreviewProvider {
    static var previews: some View {
        AboutMeView().environmentObject(RoutingObserver())
    }
}
