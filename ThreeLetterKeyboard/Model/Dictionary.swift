//
//  Dictionary.swift
//  ThreeLetterKeyboard
//
//  Created by Lewis Tham on 25/2/18.
//  Copyright © 2018 miim. All rights reserved.
//

import Foundation

public class WordDictionary
{
    public static var DefaultDictionary : [Word] = []
    
    init() {
        //load all string data into dictionary
        addWord(chars: "a")
        addWord(chars: "aa")
        addWord(chars: "abg")
        addWord(chars: "abc")
        addWord(chars: "af")
        addWord(chars: "axe")
        addWord(chars: "app")
        addWord(chars: "apple")
        addWord(chars: "applet")
        addWord(chars: "application")
        addWord(chars: "apple")
        addWord(chars: "applejuice")
        addWord(chars: "axclibur")
        addWord(chars: "applecider")
        addWord(chars: "bone")
        addWord(chars: "buttocks")
        addWord(chars: "bobs")
        addWord(chars: "vagene")
        addWord(chars: "manko")
        
        
        //https://github.com/first20hours/google-10000-english/blob/master/google-10000-english.txt
    }
    
    func addWord(chars : String) {
        //check if word exists first, if it does, increase the priority??
        WordDictionary.DefaultDictionary.append(Word(chars: chars))
    }
}
