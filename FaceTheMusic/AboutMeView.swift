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
         VStack (alignment:.leading){
            Button(action: {self.routingObserver.currentPage = "main"}) {
                 NavigationBarBackButton()
             }.frame(alignment:.leading).padding(.leading, 5)
            Divider()
            Spacer()
         }
     }
}

struct AboutMeView_Previews: PreviewProvider {
    static var previews: some View {
        AboutMeView()
    }
}
