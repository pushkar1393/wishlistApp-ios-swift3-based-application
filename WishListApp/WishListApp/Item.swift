//
//  Item.swift
//  WishListApp
//
//  Created by Pushkar Khedekar on 11/12/17.
//  Copyright © 2017 Pushkar Khedekar. All rights reserved.
//

import Foundation
import UIKit

class Item{
    
    var itemName : String
    var itemDescription : String
    var itemPrice : Int
    var store : Store
    var category : String
    var itemImage : UIImage
    init(_ itemName : String ,_ itemDescription : String ,_ itemPrice : Int,_ store : Store ,_ category : String,_ itemImage : UIImage) {
        
        self.itemName = itemName
        self.itemDescription = itemDescription
        self.itemPrice = itemPrice
        self.store = store
        self.category = category
        self.itemImage = itemImage
        
    }
    
    
    
    
}
