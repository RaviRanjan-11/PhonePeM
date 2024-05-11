//
//  NetworkManager.swift
//  PhonePe
//
//  Created by Ravi Ranjan on 11/05/24.
//

import Foundation

struct NetworkConstant {
    static let BASE_API = "https://api.seatgeek.com/2/venues/"
}


final class NetworkManager {
    
    
    
    static let shared = NetworkManager()
    private init(){}
    
    func serviceRequest<T: Decodable>( parameter: [String: Any]?,completion: @escaping (Result<T, HTTPError>) -> Void) {
        
        
        guard let requestURL = URL(string: buildRequest(parameters: parameter)) else {
            completion(.failure(.urlError))
            return
        }
        
        var request = URLRequest(url: requestURL,cachePolicy: .returnCacheDataElseLoad)
        
        // For Now it is static for the current api implementation
        request.httpMethod = HTTPMethod.get.rawValue
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                debugPrint(error,"\(#line) \(#file)")
                completion(.failure(.apiError))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                let statusCode = (response as? HTTPURLResponse)?.statusCode ?? -1
                debugPrint(statusCode," Error \(#line)")
                completion(.failure(.httpError))
                return
            }
            
            guard let data = data else {
                completion(.failure(.noDataError))
                return
            }
            
            do {
                let decodedResponse = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedResponse))
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
    
    private func buildRequest(parameters: [String: Any]?) -> String {
        
        
        
        var components = URLComponents(string: NetworkConstant.BASE_API)
        
        guard let parameters = parameters else {return components?.url?.absoluteString ?? ""}
        
        var queryItems = [URLQueryItem]()
        for (key, value) in parameters {
            queryItems.append(URLQueryItem(name: key, value: "\(value)"))
        }
        components?.queryItems = queryItems
        
        return components?.url?.absoluteString ?? ""
    }
}
