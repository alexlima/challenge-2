//
//  Patient.swift
//  Alice
//
//  Created by Alex Lima on 13/05/16.
//  Copyright © 2016 Alex Lima. All rights reserved.
//

import Foundation
import RealmSwift

class Patient : Object
{
    dynamic var name : String = ""
    
    convenience init(name : String)
    {
        self.init()
        self.name = name
    }
}