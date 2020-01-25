//
//  Product.swift
//  FinalAssC0772733
//
//  Created by MacStudent on 2020-01-24.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import Foundation
class Product{
    
    init(name: String, id: Int, desc: String, price: Float) {
        self.name = name
        self.id = id
        self.desc = desc
        self.price = price
    }
    
    
    var name: String
    var id: Int
    var desc: String
    var price: Float
    
}
