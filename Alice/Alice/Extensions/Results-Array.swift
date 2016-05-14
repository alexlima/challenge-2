//
//  Results-Array.swift
//  Alice
//
//  Created by Alex Lima on 13/05/16.
//  Copyright © 2016 Alex Lima. All rights reserved.
//

import Foundation
import RealmSwift

extension Results
{
    func toArray() -> [T] {
        return self.map{$0}
    }
}

extension RealmSwift.List
{
    func toArray() -> [T] {
        return self.map{$0}
    }
}