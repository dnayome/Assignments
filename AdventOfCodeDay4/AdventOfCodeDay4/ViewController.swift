//
//  ViewController.swift
//  AdventOfCodeDay4
//
//  Created by nayome.devapriya on 2017/06/15.
//  Copyright © 2017 nayome.devapriya. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet weak var part1ResultTextField: NSTextField?
    @IBOutlet weak var part2ResultTextField: NSTextField?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let filePath = Bundle.main.path(forResource: "Input", ofType: "txt") {
            let arrayOfFileContents = readContentsOfFile(fromPath: filePath)
            
            /*Solving Part 1 Of the puzzle*/
            let sumOfSectorId = findRealRoomsAndAddSectorIdFor(parsedStrings: arrayOfFileContents)
            print("Sum of sector id for real rooms is ",sumOfSectorId)
            part1ResultTextField?.stringValue = sumOfSectorId.description
            
            /*Solving Part 2 Of the puzzle*/
            let sectorIdForNorthPole = findRoomFrom(parsedStrings: arrayOfFileContents, whoseRealNameContains: "northpole")
            print("Sector id of the room with objects stored in northpole is \(sectorIdForNorthPole)")
            part2ResultTextField?.stringValue = sectorIdForNorthPole.description
        }
    }
    
    //MARK: Methods to solve Part 1 and Part 2 of the puzzle
    //Function is used to find out which is a real room and add the sector ids of the real rooms and return the total sector id
    func findRealRoomsAndAddSectorIdFor(parsedStrings: [String]) -> Int {
        var sumOfSectorId = 0
        
        for statement in parsedStrings {
            if statement != "" {
                let sectorAndCheckSum = String(statement.characters.suffix(10))
                let encodedData = String(statement.characters.prefix(statement.characters.count - 10))
                
                if let indexOfOpenBracket = sectorAndCheckSum.characters.index(of: Character(Constants.openSquareBrace)), let indexOfCloseBracket = sectorAndCheckSum.characters.index(of: Character(Constants.closedSquareBrace)) {
                    //get the sector id
                    let sectorId = String(sectorAndCheckSum.characters.prefix(upTo: indexOfOpenBracket))
                    // get the checksum
                    var checkSum = String(sectorAndCheckSum.characters.prefix(upTo: indexOfCloseBracket))
                    checkSum = String(checkSum.characters.suffix(Constants.checkSumCount))
                    
                    //Call a function to get the number of times the character exists.
                    var charactersCountArray = getCountOfCharacters(fromString: encodedData)
                    var checkSumBuilt = Constants.emptyString
                    var lengthOfCheckSum = 1
                    
                    //Adding a do while loop to check for real room and proceed, intially the value is made true to execute the first parsed input
                    while lengthOfCheckSum > 0 {
                        var filteredChars = filterCharactersWhichHaveGreaterValue(charactersDict: charactersCountArray)
                        filteredChars.sort()//sort the array to make it alphabetical as the corect checksum will be in alphabetical form
                        
                        for chars in filteredChars {
                            checkSumBuilt =  checkSumBuilt + chars
                            guard let indexToRemove = charactersCountArray.index(forKey: chars) else {
                                print("Error: Unable to get index !!")
                                break
                            }
                            charactersCountArray.remove(at: indexToRemove)
                            if checkSumBuilt.characters.count == Constants.checkSumCount {
                                lengthOfCheckSum = 0
                                break
                            }
                        }
                    }
                    if checkSum == checkSumBuilt {
                        guard let sectorIdConverted = Int(sectorId) else {
                            print("Unable to convert to Int")
                            break
                        }
                        sumOfSectorId = sumOfSectorId + sectorIdConverted
                    }
                }
            }
        }
        return sumOfSectorId
    }
    
    //To solve second part of the puzzle
    func findRoomFrom(parsedStrings: [String],whoseRealNameContains: String) -> String {
        for words in parsedStrings {
            if words != Constants.emptyString {
                //Get the last element
                let sectorAndCheckSum = String(words.characters.suffix(10))
                let encodedData = String(words.characters.prefix(words.characters.count - 10))
                
                if let indexOfOpenBracket = sectorAndCheckSum.characters.index(of: Character(Constants.openSquareBrace)) {
                    let sectorId = String(sectorAndCheckSum.characters.prefix(upTo: indexOfOpenBracket)) //get the sector id
                    //parse the string to get check sum
                    let shiftBy: Int = Int(sectorId)! % Constants.countOfAlphabets
                    var convertedString = Constants.emptyString
                    
                    for item in encodedData.unicodeScalars {
                        if item != "-" {
                            var unicodeValue = Int(item.value)
                            unicodeValue = unicodeValue + shiftBy
                            if unicodeValue > Constants.asciiValueAboveCharactersRange {
                                unicodeValue -= Constants.countOfAlphabets
                            }
                            let c = Character(UnicodeScalar(unicodeValue)!)
                            convertedString.append(c)
                        } else {
                            convertedString.append(Constants.stringWithSpace)
                        }
                    }
                    if (convertedString.contains(whoseRealNameContains)) {
                        return sectorId
                    }
                }
            }
        }
        return Constants.emptyString
    }


    //MARK: Methods to read the contents of file
    func readContentsOfFile(fromPath: String) -> [String] {
        do {
            let content = try String(contentsOfFile:fromPath, encoding: String.Encoding.utf8)
            if content == Constants.emptyString {
                return []
            }
            return content.components(separatedBy: Constants.inputDelimiter)
        } catch {
            return []
        }
    }
    
    //MARK: Methods to evaluate the instructions
    //Function is used to get the encrypted name and check number of times a character is repated and store all of them in array
    func getCountOfCharacters(fromString: String) -> [String:Int] {
        var dictionaryToFrame:[String:Int] = [:]
        for item in fromString.characters {
            if item != "-" {
                if !dictionaryToFrame.keys.contains(String(item)) {
                    let occurrencies = fromString.characters.filter { $0 == item }.count
                    dictionaryToFrame[String(item)] = occurrencies
                }
            }
        }
       return dictionaryToFrame
    }
    
    func filterCharactersWhichHaveGreaterValue(charactersDict : [String:Int]) -> [String]{
        var greatestValue = 0
        var filteredChars = [String]()
        
        for key in charactersDict.keys{
            guard let valueOfCharacter = charactersDict[key] else {
                print("Failed to retreive data.. !!")
                break
            }
            if valueOfCharacter > greatestValue {
                filteredChars.removeAll()
                greatestValue = valueOfCharacter
                filteredChars.append(key)
            } else if valueOfCharacter == greatestValue { //If same value exists for diferent keys then store them also
                filteredChars.append(key)
            }
        }
        return filteredChars
    }
}


