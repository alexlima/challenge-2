//
//  Alternative.swift
//  Alice
//
//  Created by Alex Lima on 13/05/16.
//  Copyright © 2016 Alex Lima. All rights reserved.
//

import Foundation
// import SwiftyJSON

class Alternative
{
    var value : String = ""
    var title : String = ""
    var selected : Bool = false
    
    // Default initializer
    init(){}
    
    // Designated initializer
    init(
        value : String,
        title : String,
        selected : Bool)
    {
        self.value = value
        self.title = title
        self.selected = selected
    }
    
    // Convenience initializer
    convenience init(value : String, title : String)
    {
        self.init(value : value, title : title, selected : false)
    }
    
    // Convenience initializer
    convenience init(title : String)
    {
        self.init(value : title, title : title, selected : false)
    }
}


