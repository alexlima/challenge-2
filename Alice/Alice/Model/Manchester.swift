//
//  Manchester.swift
//  Alice
//
//  Created by Alex Lima on 14/05/16.
//  Copyright © 2016 Alex Lima. All rights reserved.
//
//  Risk classification in an emergency room: agreement 
//  level between a Brazilian institutional and the Manchester Protocol
//  http://www.scielo.br/scielo.php?script=sci_arttext&pid=S0104-11692011000100005
// 

import UIKit
import Foundation

class Manchester
{
    func riskColor(value : Int) -> UIColor
    {
        if value > 80 {
            return UIColor(red: 0.745, green:0.153, blue:0.129, alpha:1.00)
        }
        if value > 60 {
            return UIColor(red: 0.918, green:0.545, blue:0.278, alpha:1.00)
        }
        if value > 40 {
            return UIColor(red: 0.980, green:0.878, blue:0.000, alpha:1.00)
        }
        if value > 20 {
            return UIColor(red: 0.302, green:0.690, blue:0.337, alpha:1.00)
        }
        return UIColor(red: 0.255, green:0.643, blue:0.859, alpha:1.00)
    }
}