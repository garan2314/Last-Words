//
//  ViewController.swift
//  ThreeLetterKeyboard
//
//  Created by Lewis Tham on 25/2/18.
//  Copyright © 2018 miim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //need to init a dictionary for it to load all words
    var newDic = WordDictionary()
    var newWord = Word()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        type(letter: "a")
        type(letter: "p")
        type(letter: "p")
        type(letter: "l")
        type(letter: "i")
        newWord.removeLetter()
        type(letter: "e")
        type(letter: "c")
    }
    
    func type(letter : String){
        newWord.addLetter(letter: letter)
        
        let next3 = newWord.getNextFew()
        
        for letter in next3{
            print(letter)
        }
        
        print("current word:")
        
        var string = newWord.display()
        
        if newWord.isValid
        {
            string + " is valid!"
        }
        
        print(string)
        
        
        if !newWord.hasMore
        {
            print("No more possible words")
        }
        print("–––––––––––––")
        
        print("likely word: " + newWord.getBestWord().display())
        print("–––––––––––––")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

