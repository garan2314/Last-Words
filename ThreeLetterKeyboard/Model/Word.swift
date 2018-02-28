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
    public var isValid : Bool? //if word is legit in current state
    public var hasMore : Bool? //if word has more possible words
    
    //for creation of words from empty
    init() {
        letters = []
        
        isValid = false
        hasMore = true
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
        //reset validity upon change
        isValid = false
        hasMore = true
    }
    
    func removeLetter()
    {
        letters.removeLast()
        //reset validity upon change
        isValid = false
        hasMore = true
    }
    
    
    
    //get the nth possible letter based on what has been written so far
    func getNextLetter(no : Int) -> String { //getLetter is non zero indexed
        var wordIndex : Int = no-1 //zero indexes it for use in array
        
        var nextLetter : String = "end"
        
        var possiblewords = getPossibleWords()
        
        if possiblewords.count >= no //if there is a word for the chosen letter number
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
                isValid = true
            }
        }
        return nextLetter
    }
    
    func getNextFew(num : Int = 3) -> [String] //num is the max num of letters to get (or display later, default is 3)
    {
        var letters : [String] = []
        
        var count : Int = 1
        
        //iterate til n letters are found or ended alr
        while true {
            
            var currentLetter = getNextLetter(no: count)
            
            if currentLetter == "end"
            {
                break
            }
                
            else
            {
                //ignore completed
                if !(currentLetter == "completed")
                {
                    if !letters.contains(currentLetter) //if the next letter is already being displayed, dont display
                    {
                        letters.append(currentLetter)
                        //if 3 letters are in array, break
                        
                        if letters.count == num
                        {
                            break
                        }
                    }
                    else
                    {
                        //increase priority of current letter due to its frequency
                        //will require a dictionary to assign frequency int to each letter, and then later sort the array based on highest frequency
                        //maybe highest put in the easiest to reach region
                    }
                }
            }
            
            count = count+1
        }
        
        if letters.count == 0
        {
            //print("no possible words")
            hasMore = false //set as no more words
        }
        
        return letters
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
        var dword : String = ""
        
        for letter in letters{
            dword = dword + letter
        }
        
        dword = dword.capitalized
        
        if isValid!
        {
            dword = dword + " is valid!"
        }
        print(dword)
        
        if !hasMore!
        {
            print("No more possible words")
        }
    }
}

