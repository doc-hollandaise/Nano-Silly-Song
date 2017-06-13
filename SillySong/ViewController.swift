//
//  ViewController.swift
//  Silly Songs
//
//  Created by Derek Justus on 6/12/17.
//  Copyright © 2017 Nox Solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lyricsTextView: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.delegate = self;
        
        
        print(lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: "Nate"))
    }
    
    @IBAction func reset(_ sender: Any) {
        nameTextField.text = ""
        lyricsTextView.text = ""
    }
    @IBAction func displayLyrics(_ sender: Any) {
        if !(nameTextField.text?.isEmpty)! {
           lyricsTextView.text = lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: nameTextField.text!)
        }
    }
   
    
    let bananaFanaTemplate = [
        "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
        "Banana Fana Fo F<SHORT_NAME>",
        "Me My Mo M<SHORT_NAME>",
        "<FULL_NAME>"].joined(separator: "\n")
    
   
    
    
}
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}


func shortNamefromName(name: String) -> String {
    
    var nameToReturn = name.lowercased()
    
    let chars = nameToReturn.characters
    
    for letter in chars {
        switch letter {
        case "a", "e", "i", "o", "u":
            
            let currentIndex = nameToReturn.index(nameToReturn.startIndex, offsetBy: 0)
            nameToReturn = nameToReturn.substring(from: currentIndex)
            
            return nameToReturn
            
        default:
            let currentIndex = nameToReturn.index(nameToReturn.startIndex, offsetBy: 1)
            nameToReturn = nameToReturn.substring(from: currentIndex)
            
            
        }
        
    }
    
    return nameToReturn
}

func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
    
    let replacedString = lyricsTemplate.replacingOccurrences(of: "<FULL_NAME>", with: fullName)
        .replacingOccurrences(of: "<SHORT_NAME>", with: shortNamefromName(name: fullName))
    
    return replacedString
}
