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
            VStack(alignment: .center, spacing: 50){
                Text("Welcome to Face the Music!").font(.title).multilineTextAlignment(.center).padding()
                Text("\n\tMaybe I should have a picture here?\n\n\tI made this application as a side project for . ... a;sldfkj adls; kfja; lsdk fja;l sdkf ja;ls dkfj dls; kfjad ls;kf jal ;sdkf jals ;dkf jadls; kfjadl s;kfja ls;dk fjal; dskf jad l;sk fjals ;dkfja dls;k fjal;sd kfjals ;dkfjasd \n\n\tI'm just testing the formatting to see how much I need to write. I can use the newline and tab symbols to make new paragraphs instead of using text over and over, which is good. I should include a picture of George or something.\n\n\t I should have at least three sections and maybe a link to my github.")
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
