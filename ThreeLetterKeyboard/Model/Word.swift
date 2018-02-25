//
//  Word.swift
//  ThreeLetterKeyboard
//
//  Created by Lewis Tham on 25/2/18.
//  Copyright © 2018 miim. All rights reserved.
//

import Foundation

public class Word{
    
    public var letters : [String]
    
    //for creation of words from empty
    init() {
        letters = []
    }
    
    //for creation of words from dictionary
    init(chars : String)
    {
        letters = []
        
        for char in chars{
            if char != " "
            {
                letters.append(String(char).lowercased())
            }
        }
    }
    
    
    func addLetter(letter : String)
    {
        letters.append(letter)
    }
    
    func removeLetter()
    {
        letters.removeLast()
    }
    
    
    
    //get the nth possible letter based on what has been written so far
    func getNextLetter(no : Int) -> String { //getLetter is non zero indexed
        var wordIndex : Int = no-1 //zero indexes it for use in array
        
        var nextLetter : String = "no more letter lol"

        var possiblewords = getPossibleWords()
        
        if possiblewords.count == no //if there is a word for the chosen letter number
        {
            //check if the word has more letters
            if possiblewords[wordIndex].letters.count > self.letters.count
            {
                nextLetter = possiblewords[wordIndex].letters[self.letters.count] //.count by itself provides +1 index of current word
            }
            
            //word is completed
            else
            {
                nextLetter = "completed"
            }
        }
        return nextLetter
    }
    
    
    //gets possible words in the dictionary that can be written with the current letters
    public func getPossibleWords() -> [Word]{
        
        var possiblewords : [Word] = []
        
        for dicword in WordDictionary.DefaultDictionary
        {
            //trim each word within the dictionary to match size of current half written word, to compare if it matches
            if (Array(dicword.letters.prefix(letters.count)) == letters)
            {
                possiblewords.append(dicword)
            }
        }
        
        return possiblewords
    }
    
    
    //displays word
    public func display()
    {
        var word : String = ""
        
        for letter in letters{
            word = word + letter
        }
        
        print(word)
    }
}
