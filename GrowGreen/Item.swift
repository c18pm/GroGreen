//
//  Item.swift
//  GrowGreen
//
//  Created by Rachel Sterneck on 3/10/16.
//  Copyright © 2016 Mitchell Sweet. All rights reserved.
//

import Foundation
import Firebase

struct Item {
    
    let key: String!
    let name: String!
    let ref: Firebase?
    
    // Initialize from arbitrary data
    init(name: String, key: String = "") {
        self.key = key
        self.name = name
        self.ref = nil
    }
    
    init(snapshot: FDataSnapshot) {
        key = snapshot.key
        name = snapshot.value["name"] as! String
        ref = snapshot.ref
    }
    
    func toAnyObject() -> AnyObject {
        return [
            "name": name,
        ]
}
}