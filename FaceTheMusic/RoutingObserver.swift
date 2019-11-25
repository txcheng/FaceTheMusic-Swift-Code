//
//  RoutingObserver.swift
//  FaceTheMusic
//
//  Updates all observing views with state variable data
//
//  Created by Tracy Cheng on 11/22/19.
//  Copyright © 2019 Tracy Cheng. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class RoutingObserver: ObservableObject {
    
    //don't change this variable name!
    let objectWillChange = PassthroughSubject<RoutingObserver,Never>()
    
    var currentPage: String = "main" {
        didSet {
            objectWillChange.send(self)
        }
    }
    
    var emotion: String = ""{
        didSet{
            objectWillChange.send(self)
        }
    }
}
