//
//  ViewController.swift
//  ThreeLetterKeyboard
//
//  Created by Lewis Tham on 25/2/18.
//  Copyright © 2018 miim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var newWord = Word()

    @IBOutlet weak var lbCurrWord: UILabel!
    @IBOutlet weak var tbCurrWord: UITextField!
    
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
    @IBAction func tbCurrWord(_ sender: Any) {
        //runs upon change to textbox
        newWord = Word(chars: tbCurrWord.text!)
        update()
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
        newWord.complete()
        
        newWord = Word()
        update()
    }
    
    func update(){
        var string = newWord.toString()
        
        lbCurrWord.text = newWord.toString()
        
        //let letters = newWord.getNextFew()
        let letters = newWord.getLetters()
    
        if letters.count>=1
        {
            btLetter1.setTitle(letters[0], for: .normal)
            btLetter1.isEnabled = true
        }
        else
        {
            clearOption(option: 1)
        }
        if letters.count>=2
        {
            btLetter2.setTitle(letters[1], for: .normal)
            btLetter2.isEnabled = true
        }
        else
        {
            clearOption(option: 2)
        }
        if letters.count>=3
        {
            btLetter3.setTitle(letters[2], for: .normal)
            btLetter3.isEnabled = true
        }
        else
        {
            clearOption(option: 3)
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
    
        tbCurrWord.text!=lbCurrWord.text!
        
    }
    
    func clearOption(option : Int = 4)
    {
        if option == 1
        {
            btLetter1.setTitle("", for: .normal)
            btLetter1.isEnabled = false
        }
        else if option == 2
        {
            btLetter2.setTitle("", for: .normal)
            btLetter2.isEnabled = false
        }
        else if option == 3
        {
            btLetter3.setTitle("", for: .normal)
            btLetter3.isEnabled = false
        }
        else if option == 4
        {
            clearOption(option : 1)
            clearOption(option : 2)
            clearOption(option : 3)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

