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
    var pageNo = 1
    
    @IBOutlet weak var lbCurrWord: UILabel!
    @IBOutlet weak var tbCurrWord: UITextField!
    
    @IBOutlet weak var btLetter1: UIButton!
    @IBOutlet weak var btLetter2: UIButton!
    @IBOutlet weak var btLetter3: UIButton!
    @IBOutlet weak var btLetter4: UIButton!
    @IBOutlet weak var btBestWord: UIButton!
    @IBOutlet weak var btPrev: UIButton!
    @IBOutlet weak var btNext: UIButton!
    
    
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
    @IBAction func btLetter4(_ sender: Any) {
        type(letter: btLetter4.title(for: .normal)!)
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
        pageNo = 1
        update()
    }
    
    @IBAction func btPrev(_ sender: Any) {
        pageNo = pageNo - 1
        update()
    }
    @IBAction func btNext(_ sender: Any) {
        pageNo = pageNo + 1
        update()
    }
    
    
    func type(letter : String)
    {
        newWord.addLetter(letter: letter)
        pageNo = 1
        update()
    }
    
    func back()
    {
        newWord.removeLetter()
        pageNo = 1
        update()
    }
    
    func best()
    {
        newWord.setBestWord()
        pageNo = 1
        update()
    }
    
    func save()
    {
        newWord.complete()
        pageNo = 1
        newWord = Word()
        update()
    }
    
    func update(){
        
        if pageNo == 1
        {
            btPrev.isEnabled = false
            btPrev.setTitle("👈🏿", for: .normal)
            btNext.isEnabled = true
            btNext.setTitle("👉", for: .normal)
        }
        else if pageNo == 6 //26/3
        {
            btPrev.isEnabled = true
            btPrev.setTitle("👈", for: .normal)
            btNext.isEnabled = false
            btNext.setTitle("👉🏿", for: .normal)
        }
        else
        {
            btPrev.isEnabled = true
            btPrev.setTitle("👈", for: .normal)
            btNext.isEnabled = true
            btNext.setTitle("👉", for: .normal)
        }
        
        var string = newWord.toString()
        
        lbCurrWord.text = newWord.toString()
        
        //let letters = newWord.getNextFew()
        let letters = newWord.getLetters()
    
        let option1 = (pageNo-1)*4
        let option2 = (pageNo-1)*4+1
        let option3 = (pageNo-1)*4+2
        let option4 = (pageNo-1)*4+3

        
        if letters.count>=option1+1
        {
            btLetter1.setTitle(letters[option1], for: .normal)
            btLetter1.isEnabled = true
        }
        else
        {
            clearOption(option: 1)
        }
        if letters.count>=option2+1
        {
            btLetter2.setTitle(letters[option2], for: .normal)
            btLetter2.isEnabled = true
        }
        else
        {
            clearOption(option: 2)
        }
        if letters.count>=option3+1
        {
            btLetter3.setTitle(letters[option3], for: .normal)
            btLetter3.isEnabled = true
        }
        else
        {
            clearOption(option: 3)
        }
        
        if letters.count>=option4+1
        {
            btLetter4.setTitle(letters[option4], for: .normal)
            btLetter4.isEnabled = true
        }
        else
        {
            clearOption(option: 4)
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
    
    func clearOption(option : Int = 0)
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
            btLetter4.setTitle("", for: .normal)
            btLetter4.isEnabled = false
        }
        else if option == 0
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

