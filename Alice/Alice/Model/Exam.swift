//
//  Exam.swift
//  Alice
//
//  Created by Alex Lima on 13/05/16.
//  Copyright © 2016 Alex Lima. All rights reserved.
//

import Foundation
import RealmSwift

class Exam : Object
{
    dynamic var patient : Patient? = Patient()
    dynamic var createdAt : NSDate?
    dynamic var result : Int = 0
}
