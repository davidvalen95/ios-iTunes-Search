//
//  ItunesError.swift
//  iTunes Search
//
//  Created by suryasoft konsultama on 6/8/17.
//  Copyright © 2017 DavidValentino. All rights reserved.
//

import Foundation


enum ItunesError:Error{
    
    case requestFailed
    case responseUnsuccessful
    case invalidData
    case jsonConversionFailure
    case jsonParsingFailure(message:String)
}
