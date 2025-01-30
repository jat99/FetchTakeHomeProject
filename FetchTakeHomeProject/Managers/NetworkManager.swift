//
//  NetworkManager.swift
//  FetchTakeHomeProject
//
//  Created by Jose Torres on 1/29/25.
//

import Foundation
import UIKit

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchRecipes(at urlString: String? = nil) async throws -> Recipes {
        let endpoint = urlString ?? "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json"
        
        guard let url = URL(string: endpoint) else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }

        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(Recipes.self, from: data)
        } catch {
            throw CustomError.malformedData
        }
    }
    
    func fetchImage(at: String) async throws -> UIImage {
        guard let url = URL(string: at) else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        guard let image = UIImage(data: data) else {
            throw CustomError.invalidImage
        }
        
        return image
    }
}
