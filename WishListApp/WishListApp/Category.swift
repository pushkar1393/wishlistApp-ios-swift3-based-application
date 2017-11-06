//
//  Category.swift
//  WishListApp
//
//  Created by Pushkar Khedekar on 11/5/17.
//  Copyright © 2017 Pushkar Khedekar. All rights reserved.
//

import Foundation

class Category {
    
    var categoryName : String
    var items = [Item]()
    
    init(_ categoryName : String){
        self.categoryName = categoryName
    }
    
    
}
