//
//  MainView.swift
//  FaceTheMusic
//
//  This is the main menu view
//  Upon button press, the user will be able to navigate to the indicated function/view
//
//  Created by Tracy Cheng on 10/17/19.
//  Copyright © 2019 Tracy Cheng. All rights reserved.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var routingObserver: RoutingObserver
    
    var body: some View {
        VStack {
            Spacer()
            //Title
            Text("Face the Music")
            .font(.largeTitle)
            
            Spacer()
            //Navigate to the Camera
            Button(action: {self.routingObserver.currentPage = "camera"})
            {
                MenuButtonContent()
            }
            //space from the left and right edges
            .padding([.leading, .trailing], 20)
            
            Spacer()
        }
    }
//
//    var body: some View {
//        VStack{
//            Button(action: {self.routingObserver.viewPage = "page2"}) {
//                NextButtonContent()
//            }
//            Spacer()
//            //Title
//            Text("Face the Music")
//                .font(.largeTitle)
//
//            Spacer()
//
//            //Navigate to Camera
//            Button(action:{
//                self.routingObserver.viewPage = "camera"
////                print(self.routingObserver.viewPage)
//            }){
//                Text("Take a picture!")
//                    //Make all the buttons the same width
//                .frame(minWidth: 0, maxWidth: .infinity)
//                .padding()
//                .background(Color.blue)
//                .foregroundColor(Color.white)
//                    //rounded corners
//                .cornerRadius(60)
//            }
//                //space from the edge
//            .padding([.leading, .trailing], 20)
//
//            Spacer()
//
//            //Navigate to music
//            Button(action:{
//                self.routingObserver.viewPage = "music"
//                print(self.routingObserver.viewPage)
//            }){
//                Text("Customize music")
//                .frame(minWidth: 0, maxWidth: .infinity)
//                .padding()
//                .background(Color.blue)
//                .foregroundColor(Color.white)
//                .cornerRadius(60)
//            }
//            .padding([.leading, .trailing], 20)
//
//            Spacer()
//
//            //Navigate to more information
//            Button(action:{
//                self.routingObserver.viewPage = "about"
//                print(self.routingObserver.viewPage)
//            }){
//                Text("About me")
//                .frame(minWidth: 0, maxWidth: .infinity)
//                .padding()
//                .background(Color.blue)
//                .foregroundColor(Color.white)
//                .cornerRadius(60)
//            }
//            .padding([.leading, .trailing], 20)
//
//            Spacer()
//        }
//    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(RoutingObserver())
    }
}

struct MenuButtonContent : View {
    var body: some View {
        return Text("Take a picture!")
                            //Make all the buttons the same width
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                            //rounded corners
                        .cornerRadius(60)
    }
}
