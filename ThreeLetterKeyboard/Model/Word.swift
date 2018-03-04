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
    public var isValid : Bool //if word is legit in current state
    public var hasMore : Bool //if word has more possible words
    private var acceptLetters : String = "abcdefghijklmnopqrstuvwxyz"
    
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
        
        isValid = false
        hasMore = true
        
        for char in chars{
            /*
            if char != " "
            {
                letters.append(String(char).lowercased())
            }
                */
            if acceptLetters.contains(String(char).lowercased())
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
        if letters.count>=1
        {
            letters.removeLast()
            //reset validity upon change
            isValid = false
            hasMore = true
        }
    }
    
    func setBestWord()
    {
        var bestWord = getBestWord()
        
        if bestWord != nil{
            letters = (bestWord?.letters)! //set the current word to the best possible word rn
        }
    }
    
    func getBestWord() -> Word? {

        var bestWord : Word?
        
        if getPossibleWords().count > 0
        {
            //if more words can be written and first best word is already written, recommend second best word if possible
            bestWord = getPossibleWords()[0]
            
            if ((bestWord?.letters.count)! == letters.count)
            {
                //scan for a word that is better that is possible
                for word in getPossibleWords()
                {
                    if word.letters.count > letters.count
                    {
                        bestWord = word
                        break
                    }
                }
            }
            
        }
        else
        {
            bestWord = nil
        }

        return bestWord
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
    //frequency based sorting is depracated due to its resource intensive nature
    //will sort the items upon saving, move to front maybe
    public func getPossibleWords() -> [Word]{
        
        var possiblewords : [Word] = []
        
        for dicword in myDic.DefaultDictionary
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
    public func toString() -> String
    {
        var dword : String = ""
        
        for letter in letters{
            dword = dword + letter
        }
        
        dword = dword.capitalized
        
        return dword
    }
    
    
    //complete word
    //check if word already exists and perform save/prio
    //can either do it using the txt string or the memory array, which is more optimised?
    public func complete()
    {
        if letters.count>0
        {
            print(myDic.getData().suffix(20))
            if myDic.getData().lowercased().contains(toString().lowercased()+"\n")
            {
                print("contains " + toString())
            }
            else
            {
                print("does not contain " + toString())
                myDic.addWord(chars: toString())
            }
        }
    }
}

