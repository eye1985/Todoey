//
//  TodoeyModel.swift
//  Todoey
//
//  Created by Erik Ye on 13/02/2018.
//  Copyright © 2018 Erik Ye. All rights reserved.
//

import Foundation

class Item : Codable{
    var title:String = ""
    var done:Bool = false
    
    
    init(_ title:String, _ done:Bool){
        self.title = title
        self.done = done
    }
    convenience init(){
        self.init("",false)
    }
}
