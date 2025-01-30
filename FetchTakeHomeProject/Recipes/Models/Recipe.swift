//
//  Recipe.swift
//  FetchTakeHomeProject
//
//  Created by Jose Torres on 1/29/25.
//

import Foundation

struct Recipe: Codable {
    let cuisine: String
    let name: String
    let photoUrlLarge: String?
    let photoUrlSmall: String?
    let sourceUrl: String?
    let youtubeUrl: String?
    let uuid: String
}

