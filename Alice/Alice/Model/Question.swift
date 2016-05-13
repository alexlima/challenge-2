//
//  Question.swift
//  Alice
//
//  Created by Alex Lima on 13/05/16.
//  Copyright © 2016 Alex Lima. All rights reserved.
//

import Foundation
// import SwiftyJSON

class Question
{
    var order : Int = 0
    var key : String = ""
    var title : String = ""
    var alternatives : Array<Alternative> = [Alternative]()
    
    // Default initializer
    init(){}
    
    // Designated initializer
    init(
        title : String,
        alternatives : Array<Alternative>,
        key : String)
    {
        self.title = title
        self.alternatives = alternatives
        self.key = key
    }
}

