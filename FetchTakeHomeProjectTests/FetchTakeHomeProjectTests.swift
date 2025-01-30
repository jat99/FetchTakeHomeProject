//
//  FetchTakeHomeProjectTests.swift
//  FetchTakeHomeProjectTests
//
//  Created by Jose Torres on 1/29/25.
//

import XCTest
@testable import FetchTakeHomeProject

final class FetchTakeHomeProjectTests: XCTestCase {
    
    let networkManager = NetworkManager.shared
    let cacheManager = CacheManager.shared
    
    // MARK: Network Tests
    
    func testMalformedData() async throws {
        let endpoint = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-malformed.json"
        do {
            _  = try await networkManager.fetchRecipes(at: endpoint)
            XCTFail()
        } catch {
            XCTAssertEqual(error as? CustomError, CustomError.malformedData)
        }
    }
    
    func testEmptyData() async throws {
        let endpoint = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-empty.json"
        do {
            let recipes = try await networkManager.fetchRecipes(at: endpoint)
            XCTAssertTrue(recipes.recipes.count == 0)
        } catch {
            XCTFail()
        }
    }
    
    func testSuccessfulData() async throws {
        let endpoint = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json"
        do {
            let recipes = try await networkManager.fetchRecipes(at: endpoint)
            XCTAssertTrue(type(of:recipes.recipes[0]) == Recipe.self)
            XCTAssertTrue(recipes.recipes.count > 0)
        } catch {
            XCTFail()
        }
    }
    
    func testInvalidURL() async throws {
        let endPoint = ""
        do {
            _ = try await networkManager.fetchRecipes(at: endPoint)
            XCTFail()
        } catch {
            let urlError = error as? URLError
            XCTAssertEqual(urlError?.code, URLError.badURL)
        }
    }
    
    func testSuccessImageDownload() async throws {
        let urlString = "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/large.jpg"
        do {
            let image = try await networkManager.fetchImage(at: urlString)
            XCTAssertTrue(type(of: image) == UIImage.self)
        } catch {
            XCTFail()
        }
    }
    
    func testFailedImageDownload() async throws {
        let urlString = ""
        do {
            _ = try await networkManager.fetchImage(at: urlString)
            XCTFail()
        } catch {
            XCTAssertTrue(true)
        }
    }

    
    // MARK: Cache Tests
    
    func testSuccessfulCache() {
        let key = UUID().uuidString
        let image = UIImage(systemName: "ellipsis")
        cacheManager.addImage(image!, forKey: key)
        let cachedImage = cacheManager.getImage(forKey: key)
        XCTAssertEqual(image, cachedImage)
    }
    
    func testImageNotInCache() {
        let image = cacheManager.getImage(forKey: "key")
        XCTAssertNil(image)
    }
}

