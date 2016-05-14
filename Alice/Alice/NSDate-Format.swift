//
//  NSDate-Format.swift
//  Alice
//
//  Created by Alex Lima on 13/05/16.
//  Copyright © 2016 Alex Lima. All rights reserved.
//

import Foundation

extension NSDate
{
    func stringFromDate(var format : String) -> String
    {
        format = format.isEmpty ? "yyyy-MM-dd" : format
        let formatter = NSDateFormatter()
        formatter.dateFormat = format
        let string = formatter.stringFromDate(self)
        return string
    }
}