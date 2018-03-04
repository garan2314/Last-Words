//
//  Dictionary.swift
//  ThreeLetterKeyboard
//
//  Created by Lewis Tham on 25/2/18.
//  Copyright © 2018 miim. All rights reserved.
//

import Foundation


let myDic = WordDictionary.sharedInstance

final class WordDictionary
{
    static let sharedInstance = WordDictionary()
    
    var DefaultDictionary : [Word] = []
    
    var readString = ""
    
    private init() {
        //https://github.com/first20hours/google-10000-english/blob/master/google-10000-english.txt
        do {
            let fileURL = Bundle.main.path(forResource: "google-10000-english", ofType: "txt")

            readString = try String(contentsOfFile: fileURL!, encoding: String.Encoding.utf8)
            let words = readString.components(separatedBy: .newlines)
        
            for word in words
            {
                addWord(chars: word)
            }
        }
        catch let error as NSError
        {
            print(error)
        }
    }
    
    func addWord(chars : String) {
        //check if word exists first, if it does, increase the priority??
        DefaultDictionary.append(Word(chars: chars))
    }
}

