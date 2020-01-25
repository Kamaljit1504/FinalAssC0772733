//
//  singlteon.swift
//  FinalAssC0772733
//
//  Created by MacStudent on 2020-01-24.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import Foundation
class singlteon: NSObject
{
    private var productArray = [Product]()
    private static var obj = singlteon()
    private override init()
    {
        
    }
    
    internal static func getInstance() -> singlteon
    {
        return obj
    }
    
    func returnProObject() -> Product?
    {
        for pro in productArray
        {
            return pro
        }
        
        return nil
    }
    
    func returnProductArray() -> [Product] {
        return productArray
    }
    
    func returnCount() -> Int
    {
        return productArray.count
    }
    
    func addPro(product: Product)
    {
        productArray.append(product)
    }
    
    func createPro()
    {
        let p1 = Product(name: "ipone1", id: 101, desc: "pne", price: 22.36)
        let p2 = Product(name: "ipone2", id: 102, desc: "pne", price: 22.36)
        let p3 = Product(name: "ipone3", id: 103, desc: "pne", price: 22.36)
        let p4 = Product(name: "ipone4", id: 104, desc: "pne", price: 22.36)
        let p5 = Product(name: "ipone5", id: 105, desc: "pne", price: 22.36)
        let p6 = Product(name: "ipone6", id: 106, desc: "pne", price: 22.36)
        let p7 = Product(name: "ipone7", id: 107, desc: "pne", price: 22.36)
        let p8 = Product(name: "ipone8", id: 108, desc: "pne", price: 22.36)
        let p9 = Product(name: "ipone9", id: 109, desc: "pne", price: 22.36)
        let p10 = Product(name: "ipone10", id: 1010, desc: "pne", price: 22.36)
        
        addPro(product: p1)
         addPro(product: p2)
         addPro(product: p3)
         addPro(product: p4)
         addPro(product: p5)
         addPro(product: p6)
         addPro(product: p7)
         addPro(product: p8)
         addPro(product: p9)
         addPro(product: p10)

    }


}
