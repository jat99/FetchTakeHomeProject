//
//  ImageLoaderViewModel.swift
//  FetchTakeHomeProject
//
//  Created by Jose Torres on 1/29/25.
//

import Foundation
import SwiftUI

@Observable
final class ImageLoaderViewModel {
    
    var image: UIImage? = nil
    var isLoadingImage: Bool = true
    let cacheManager = CacheManager.shared
    let networkManager = NetworkManager.shared
    let url: String
    
    init(url: String) {
        self.url = url
    }
    
    func getImage() async {
        guard image == nil else { return }
        isLoadingImage = true
        if let image = cacheManager.getImage(forKey: url) {
            self.image = image
        } else {
            do {
                self.image = try await networkManager.fetchImage(at: url)
                if let image = self.image {
                    cacheManager.addImage(image, forKey: url)
                }
            } catch {
                image = nil
            }
        }
        self.isLoadingImage = false
    }
}
