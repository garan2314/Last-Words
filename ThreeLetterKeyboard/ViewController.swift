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
        
        
        type(letter: "b")
        type(letter: "o")
        type(letter: "o")
        type(letter: "b")
        type(letter: "s")
        newWord.save()
        
        newWord.letters = []
        type(letter: "b")
        type(letter: "o")
        type(letter: "o")
        best()
        
    }
    
    func type(letter : String)
    {
        newWord.addLetter(letter: letter)
        update()
    }
    
    func back()
    {
        newWord.removeLetter()
        update()
    }
    
    func best()
    {
        newWord.setBestWord()
        update()
    }
    
    func update(){
        
        let next3 = newWord.getNextFew()
        
        for letter in next3{
            print(letter)
        }
        
        print("current word:")
        
        var string = newWord.toString()
        
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
        
        
        var bestWord = newWord.getBestWord()
        
        if bestWord != nil{
            print("likely word: " + (bestWord?.toString())!)
            print("–––––––––––––")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

