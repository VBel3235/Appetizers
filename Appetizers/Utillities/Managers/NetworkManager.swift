//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Владислав Белов on 17.11.2021.
//

import Foundation
import UIKit

final class NetworkManager{
    static let shared = NetworkManager()
    
    private let cache = NSCache<NSString, UIImage>()
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizerURL = baseURL + "appetizers"
    
    private init() {}
    
    func getAppetizer() async throws ->  [Appetizer]{
        guard let url = URL(string: appetizerURL) else {
            throw APError.invalidURL
        }
        let (data, response) = try await URLSession.shared.data(from: url)
       
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                throw APError.invalidResponse
            }
            do {
                let decoder =  JSONDecoder()
                let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
                return decodedResponse.request
            } catch  {
                throw APError.invalidData
            }
       
    }
    
//    func getAppetizer(completion: @escaping (Result<[Appetizer], APError>) -> Void){
//        guard let url = URL(string: appetizerURL) else {
//            completion(.failure(.invalidURL))
//            return
//        }
//        print(url)
//        let task = URLSession.shared.dataTask(with: url) { data, response, error in
//            if let _ = error {
//                completion(.failure(.unableToComplete))
//                return
//            }
//            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
//                completion(.failure(.invalidResponse))
//                return
//            }
//            print(response)
//            guard let data = data else {
//                completion(.failure(.invalidData))
//                return
//            }
//            do {
//               let decoder =  JSONDecoder()
//                let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
//                completion(.success(decodedResponse.request))
//            } catch  {
//                completion(.failure(.invalidData))
//            }
//        }
//        task.resume()
//    }
    
    
    func downloadImage(from URLString : String, completion: @escaping (UIImage?) -> Void){
        let cacheKey = NSString(string: URLString)
        
        if let image = cache.object(forKey: cacheKey){
            completion(image)
            return
        }
        
        guard let url = URL(string: URLString) else {
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response , error in
            guard let data = data, let image = UIImage(data: data) else {
                completion(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completion(image)

        }
        task.resume()
    }
}
