//
//  WordEngine.swift
//  WordHunt
//
//  Created by arbenjusufhayati on 7/10/16.
//  Copyright © 2016 Versus UE. All rights reserved.
//

import Foundation


class WordEngine{
    
    var letters: [LetterBoxModel]!
    
    init(capacityX: Int, capacityY: Int)
    {
        for  indexY in 1...capacityY {
            
            for indexX in 1...capacityX {
                let rndChar = randomAlphaNumericString(1)
                
               // print(rndChar)
                
                let model = LetterBoxModel(letter: rndChar, indexX: indexX, indexY:indexY)
                
                if letters == nil {
                    letters = [LetterBoxModel]()
                }
                
                letters.append(model)
           
            }
        }
    }
    
    func randomAlphaNumericString(length: Int) -> String {
        
        let allowedChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        let allowedCharsCount = UInt32(allowedChars.characters.count)
        var randomString = ""
        
        for _ in (0..<length) {
            let randomNum = Int(arc4random_uniform(allowedCharsCount))
            let newCharacter = allowedChars[allowedChars.startIndex.advancedBy(randomNum)]
            randomString += String(newCharacter)
        }
        
        return randomString
    }
}