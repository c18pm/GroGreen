//
//  Farm.swift
//  GrowGreen
//
//  Created by Rachel Sterneck on 3/10/16.
//  Copyright © 2016 Mitchell Sweet. All rights reserved.
//

import Foundation
import Firebase

struct Farm {
   
    let email: String
    let name: String
    let produce: String
    let uid: String
    
    let key: String!
    let ref: Firebase?
       // Initialize from Firebase
    init(authData: FAuthData) {
        
        email = authData.providerData["email"] as! String
         name = authData.providerData["name"] as! String
         produce = authData.providerData["produce"] as! String
        uid = authData.uid
        key = ""
        ref = Firebase(url: "https://grogreen.firebaseio.com/farmers")
    }
    
    // Initialize from arbitrary data
    init(uid: String, email: String, produce: String, name: String, key: String = "") {
        self.uid = uid
        self.email = email
        self.produce = produce
        self.name = name
        self.ref = nil
        self.key = key
    }
}