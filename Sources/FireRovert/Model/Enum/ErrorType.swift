//
//  ErrorType.swift
//  
//
//  Created by Salihcan Kahya on 15.02.2021.
//


public enum ErrorType: String {
    case nilSnapshot = "Snapshot nil"
    case dictionaryTodataConvertError = "Error occured while trying to convert dictionary to data"
    case dataToDictionaryConvertError = "Error occured while trying to convert data to dictionary"
    case decodeError = "Error occured while trying to decode"
    
}
