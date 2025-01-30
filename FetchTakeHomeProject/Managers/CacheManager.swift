//
//  CacheManager.swift
//  FetchTakeHomeProject
//
//  Created by Jose Torres on 1/29/25.
//

import Foundation
import UIKit

final class CacheManager {
    
    static let shared = CacheManager()
    
    private init() {}
    
    var imageCache: NSCache<NSString, UIImage> = {
        let cache = NSCache<NSString, UIImage>()
        cache.countLimit = 100
        cache.totalCostLimit = 1024 * 1024 * 10
        return cache
    }()
    
    func addImage(_ image: UIImage, forKey key: String) {
        imageCache.setObject(image, forKey: key as NSString)
    }
    
    func getImage(forKey key: String) -> UIImage? {
        return imageCache.object(forKey: key as NSString)
    }
}
