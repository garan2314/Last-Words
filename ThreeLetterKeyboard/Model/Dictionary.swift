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
        addWord(chars: "apple")
        addWord(chars: "axclibur")
        addWord(chars: "bone")
        addWord(chars: "buttocks")

    }
    
    func addWord(chars : String) {
        WordDictionary.DefaultDictionary.append(Word(chars: chars))
    }
}
