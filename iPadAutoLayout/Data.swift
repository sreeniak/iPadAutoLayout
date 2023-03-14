//
//  Data.swift
//  iPadAutoLayout
//
//  Created by  on 2023-02-03.
//

import UIKit

class Data: NSObject {

    var savedName : String?
    var savedWeight : String?
    
    override init(){
        savedName = "Jim Kirk"
        savedWeight = "150"
    }
    
    func initWithStuff(theName : String, theWeight : String){
        savedName = theName
        savedWeight = theWeight
    }
}
