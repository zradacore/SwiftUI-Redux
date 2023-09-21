//
//  Enviroment.swift
//  ReduxExample
//
//  Created by Владимир Никитин on 21.09.2023.
//

import Foundation




public enum Environment: String, CaseIterable{
    case development
    case production
}


extension Environment{
    var baseServiceURL : String {
        switch self {
        case .development:
            return "http://sometest.ru/"
        case .production:
            return "https://jsonplaceholder.typicode.com/"
        }
    }
}
