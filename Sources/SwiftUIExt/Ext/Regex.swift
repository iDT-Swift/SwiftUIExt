//
//  File.swift
//  
//
//  Created by Gustavo Halperin on 6/9/23.
//

import SwiftUI
import RegexBuilder

fileprivate
extension CharacterClass {
    static let lowercaseLetter:CharacterClass = CharacterClass.generalCategory(.lowercaseLetter)
    static let uppercaseLetter:CharacterClass = CharacterClass.generalCategory(.uppercaseLetter)
    static let letter:CharacterClass = lowercaseLetter.union(uppercaseLetter)
    static let word_:CharacterClass = letter.union(.digit)
}

fileprivate
let emailRegex = Regex {
    OneOrMore { CharacterClass.letter }
    ZeroOrMore {
        ZeroOrMore (CharacterClass.word_)
        ZeroOrMore ("_")
        ZeroOrMore (".")
        ZeroOrMore ("+")
        ZeroOrMore ("-")
    }
    "@"
    OneOrMore { CharacterClass.letter }
    ZeroOrMore {
        ZeroOrMore (CharacterClass.word_)
        ZeroOrMore (".")
        ZeroOrMore ("-")
    }
    "."
    Repeat(2...) {
        OneOrMore { CharacterClass.letter }
    }
}

public
extension String {
    var emailIsValid: Bool {
        return self.wholeMatch(of: emailRegex) !=  nil
    }
    
}
