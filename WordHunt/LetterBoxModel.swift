//
//  LetterBoxModel.swift
//  WordHunt
//
//  Created by arbenjusufhayati on 7/10/16.
//  Copyright © 2016 Versus UE. All rights reserved.
//

import Foundation

class LetterBoxModel{
    var boxLetter : String!
    var x: Int
    var y: Int
    
    init(letter: String, indexX: Int, indexY: Int)
    {
        boxLetter = letter
        x = indexX
        y = indexY
    }
}
