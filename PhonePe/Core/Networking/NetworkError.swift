//
//  NetworkError.swift
//  PhonePe
//
//  Created by Ravi Ranjan on 11/05/24.
//

import Foundation

enum HTTPError: Error, InfoProtocol {
    
    case httpError
    case apiError
    case noDataError
    case decodingError
    case urlError
    
    var info: String {
        switch self {
        case .httpError:
            return "Unable to Process your reqest"
        case .apiError:
            return "Unable to process your request"
        case .noDataError:
            return "No data avaialble"
        case .decodingError:
            return "Unable to process your request"
        case .urlError:
            return "Unable to process your reqest"
        }
    }
    
    var debugInfo: String {
        switch self {
        case .httpError:
            return "HTTP error"
        case .apiError:
            return "API error"
        case .noDataError:
            return "No Data error"
        case .decodingError:
            return "Decoding error"
        case .urlError:
            return "Please check the URL"
        }
    }
}
