//
//  Cart.swift
//  WishListApp
//
//  Created by Pushkar Khedekar on 10/22/17.
//  Copyright © 2017 Pushkar Khedekar. All rights reserved.
//

import Foundation

class Cart {
    
    static let cart = Cart()
    
    var sessionCart = [Item]()
    
    
    func addItem(_ itemToBeInserted : Item ) {
        
        sessionCart.append(itemToBeInserted)
    }
    
    
    func removeItem(_ itemNameToBeRemoved : String) -> Bool? {
        var count = 0
        var flag = false
        for item in sessionCart{
            if item.itemName == itemNameToBeRemoved {
           sessionCart.remove(at: count)
                flag = true
           print("Item \(item.itemName) is removed from your cart !")
           break
            }
            count += 1
        }
        return flag
    }
    
    
    func searchItem(_ itemToBeSearched : String) -> [Item]? {
        var listOfItems = [Item]()
        for item in sessionCart {
            if itemToBeSearched == item.itemName{
                listOfItems.append(item)
            }
        }
       
        return listOfItems
    }
    
    
    func listAllItems() -> [Item] {
        return sessionCart
    }
    


}
