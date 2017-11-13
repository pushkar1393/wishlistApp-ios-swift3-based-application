//
//  Store.swift
//  WishListApp
//
//  Created by Pushkar Khedekar on 11/12/17.
//  Copyright © 2017 Pushkar Khedekar. All rights reserved.
//

import Foundation


class Store {
    
    var storeName : String
    var storeAddress : String
    var storeContact : Int64
    
    init(_ storeName : String ,_ storeAddress : String ,_ storeContact : Int64) {
        self.storeName = storeName
        self.storeAddress = storeAddress
        self.storeContact = storeContact
    }
}
