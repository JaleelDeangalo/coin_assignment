//
//  Networking.swift
//  newexample
//
//  Created by Jaleel Gilbert on 2/25/23.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case dataNotFound
    case invalidHTTPResponse
}

class Networking {
    
    
    func getData(completion: @escaping (Result<Coin, APIError>) -> ()) {
        
        guard let url = URL(string: "https://www.cryptingup.com/api/markets") else {
            completion(.failure(APIError.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data = data, error == nil else {
                completion(.failure(APIError.dataNotFound))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(APIError.invalidHTTPResponse))
                return
            }
            
            if httpResponse.statusCode > 299 {
                print(httpResponse.statusCode)
                return
            }
            
            do {
                let jsonData = try JSONDecoder().decode(Coin.self, from: data)
                completion(.success(jsonData))
            } catch {
                print(error)
            }
            
            
        }.resume()
    }
    
}
