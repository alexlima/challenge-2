//
//  Alternative.swift
//  Alice
//
//  Created by Alex Lima on 13/05/16.
//  Copyright © 2016 Alex Lima. All rights reserved.
//

import Foundation

class Alternative
{
    var weight : Int = 0
    var title : String = ""
    var selected : Bool = false
    
    // Default initializer
    init(){}
    
    // Designated initializer
    init(
        weight : Int,
        title : String,
        selected : Bool)
    {
        self.weight = weight
        self.title = title
        self.selected = selected
    }
    
    // Convenience initializer
    convenience init(weight : Int, title : String)
    {
        self.init(weight : weight, title : title, selected : false)
    }
    
    // Convenience initializer
    convenience init(title : String)
    {
        self.init(weight : 0, title : title, selected : false)
    }
}


