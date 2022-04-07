//
//  GameState.swift
//  ApplePie
//
//  Created by Ashin Wang on 2022/4/5.
//

import Foundation


struct GameState{
    var word: String
    var incorrectWord: Int
    var guessLatter: [Character]
    
    var formatterWord: String{
        var guessedWord = ""
        for letter in word {
            if guessLatter.contains(letter){
                guessedWord += "\(letter)"
            }else{
                guessedWord += "_"
            }
        }
        return guessedWord
    }
    
    
    
    mutating func guessedWord(letter: Character){
        guessLatter.append(letter)
        if !word.contains(letter){
            incorrectWord -= 1
        }
    }
    
}


