//
//  Answer.swift
//  Alice
//
//  Created by Alex Lima on 13/05/16.
//  Copyright © 2016 Alex Lima. All rights reserved.
//

import Foundation
import RealmSwift

class Answer : Object
{
    dynamic var key : String = ""
    dynamic var value : AnyObject = ""
    
    convenience init(key : String, value : String)
    {
        self.init()
        self.key = key
        self.value = value
    }
}
