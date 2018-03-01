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

    @IBOutlet weak var lbCurrWord: UILabel!
    @IBOutlet weak var btLetter1: UIButton!
    @IBOutlet weak var btLetter2: UIButton!
    @IBOutlet weak var btLetter3: UIButton!
    @IBOutlet weak var btBestWord: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        update()
    }
    
    @IBAction func btLetter1(_ sender: Any) {
        type(letter: btLetter1.title(for: .normal)!)
    }
    @IBAction func btLetter2(_ sender: Any) {
        type(letter: btLetter2.title(for: .normal)!)
    }
    @IBAction func btLetter3(_ sender: Any) {
        type(letter: btLetter3.title(for: .normal)!)
    }
    @IBAction func btBestWord(_ sender: Any) {
        best()
    }
    @IBAction func btBack(_ sender: Any) {
        back()
    }
    @IBAction func btSpace(_ sender: Any) {
        save()
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
    
    func save()
    {
        newWord.save()
        print("saved '" + newWord.toString()+"'")
        newWord.letters = []
        update()
    }
    
    func update(){
        var string = newWord.toString()
        
        lbCurrWord.text = newWord.toString()
        
        let letters = newWord.getNextFew()
        
        if newWord.hasMore //hasmore is only updated upon getNextFew, must execute after
        {
            if letters.count>=1
            {
                btLetter1.setTitle(letters[0], for: .normal)
            }
            else
            {
                btLetter1.setTitle("", for: .normal)
            }
            if letters.count>=2
            {
                btLetter2.setTitle(letters[1], for: .normal)
            }
            else
            {
                btLetter2.setTitle("", for: .normal)
            }
            if letters.count>=3
            {
                btLetter3.setTitle(letters[2], for: .normal)
            }
            else
            {
                btLetter3.setTitle("", for: .normal)
            }
        }
        else //if no more possible letters
        {
            btLetter1.setTitle("", for: .normal)
            btLetter2.setTitle("", for: .normal)
            btLetter3.setTitle("", for: .normal)
        }
        
        
        let bestWord = newWord.getBestWord()
        
        if bestWord != nil
        {
            btBestWord.setTitle(bestWord?.toString(), for: .normal)
            btBestWord.isEnabled = true
            
            if bestWord?.toString() == newWord.toString()
            {
                btBestWord.isEnabled = false
            }
            
        }
        else
        {
            btBestWord.setTitle("No predictable words", for: .normal)
            btBestWord.isEnabled = false
        }
        
        //must occur after getnextfew
        if newWord.isValid
        {
            lbCurrWord.textColor = UIColor.green
        }
        else
        {
            lbCurrWord.textColor = UIColor.darkText
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

