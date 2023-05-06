// This program calculates length of char
// in strings, using recursion.
//

//
//  Created by Sarah Andrew

//  Created on 2023-05-06

//  Version 1.0

//  Copyright (c) 2023 Sarah. All rights reserved.
import Foundation

// Define input & output paths.
let inputFile = "input.txt"
let outputFile = "output.txt"

// Usage of file handle method to locate files,
// as well as opening input for file reading.
do {
    // Open input file for reading.
    guard let input = FileHandle(forReadingAtPath: inputFile) else {
        print("Error: cannot access input file for opening.")
        exit(1)
    }

    // Open output file for writing.
    guard let output = FileHandle(forWritingAtPath: outputFile) else {
        print("Error: cannot access output file for writing.")
        exit(1)
    }

    // Read content from file.
    let inputData = input.readDataToEndOfFile()

    // Convert data to a string.
    guard let inputString = String(data: inputData, encoding: .utf8) else {
        print("Error: Cannot convert input data to string.")
        exit(1)
    }

    // Split string by newlines.
    let inputLines = inputString.components(separatedBy: .newlines)

    // Loop through each line of the file.
    for inputLine in inputLines {
        // In the case of an empty line,
        // display length of string is 0.
        if inputLine.isEmpty {
            print("No strings found on line.")
            print("Therefore, length of string is 0.")
            let data = Data("No strings found on line.\n".utf8)
            output.write(data)
            let data1 = Data("Therefore, length of string is 0.\n".utf8)
            output.write(data1)
            continue
        }
        // Call function.
        let lengthStr = strLength(someStr: inputLine)

        // Display results to user. 
        print("The original string is:", inputLine)
        print("The length of the string is:", lengthStr)

        // Display results to input file.
        let data2 = Data("The original string is: \(inputLine)\n".utf8)
        output.write(data2)
        let data3 = Data("The length of the string is: \(lengthStr)\n".utf8)
        output.write(data3)
    }
}

// This function calculates the amount of
// char a string has recursively.
func strLength(someStr: String) -> Int {
    // Defines base case, checking to see
    // if end of line is reached.
    if someStr.isEmpty {
        // Return a 1, if raised to 0.
        return 0
    } else if someStr.count == 1 {
        // Case if length of the string is 
        // 1.
        return 1
    } else {
        // Calls the function recursively & returns it.
        return 1 + strLength(someStr:String(someStr.dropFirst()))
    }
}