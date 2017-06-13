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
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var lyricsView: UITextView!

    
    let bananaFanaTemplate = [
        "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
        "Banana Fana Fo F<SHORT_NAME>",
        "Me My Mo M<SHORT_NAME>",
        "<FULL_NAME>"].joined(separator: "\n")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameField.delegate = self;
        
        
        print(lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: "Nate"))
    }
    
    @IBAction func reset(_ sender: Any) {
        nameField.text = ""
        lyricsView.text = ""
    }
    @IBAction func displayLyrics(_ sender: Any) {
        if !(nameField.text?.isEmpty)! {
           lyricsView.text = lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: nameField.text!)
        }
    }
    
}
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}


func shortNamefromName(name: String) -> String {
    
    let charSet = CharacterSet(charactersIn: "aeiou")
    let nameToReturn = name.lowercased()
    
    if let indexOfVowel = nameToReturn.rangeOfCharacter(from: charSet) {
        return nameToReturn.substring(from: indexOfVowel.lowerBound)
    } else {
        return nameToReturn
    }
}

func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
    
    let replacedString = lyricsTemplate.replacingOccurrences(of: "<FULL_NAME>", with: fullName)
        .replacingOccurrences(of: "<SHORT_NAME>", with: shortNamefromName(name: fullName))
    
    return replacedString
}
