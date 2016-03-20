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
    let price: Int
    let addedByUser: String!
    
    // Initialize from arbitrary data
    init(name: String, key: String = "", addedByUser: String, price: Int) {
        self.key = key
        self.name = name
        self.ref = nil
        self.price = price
        self.addedByUser = addedByUser

        
    }
    
    init(snapshot: FDataSnapshot) {
        key = snapshot.key
        name = snapshot.value["name"] as! String
        ref = snapshot.ref
        price = snapshot.value["price"] as! Int
        addedByUser = snapshot.value["addedByUser"] as! String
    }
    
    func toAnyObject() -> AnyObject {
        return [
            "name": name,
            "price": price,
            "addedByUser": addedByUser
            
        ]
}
}