//
//  Item.swift
//  WishListApp
//
//  Created by Pushkar Khedekar on 10/22/17.
//  Copyright © 2017 Pushkar Khedekar. All rights reserved.
//

import Foundation

class Item{
    
    var itemName : String
    var itemDescription : String
    var itemPrice : Int
    var store : Store
    var category : String
    
    init(_ itemName : String ,_ itemDescription : String ,_ itemPrice : Int,_ store : Store ,_ category : String) {
        
        self.itemName = itemName
        self.itemDescription = itemDescription
        self.itemPrice = itemPrice
        self.store = store
        self.category = category
        
    }
    
    
    
    
}
