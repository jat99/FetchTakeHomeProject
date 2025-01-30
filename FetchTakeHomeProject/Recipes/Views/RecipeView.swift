//
//  RecipeView.swift
//  FetchTakeHomeProject
//
//  Created by Jose Torres on 1/29/25.
//

import SwiftUI

struct RecipeView: View {
    
    let recipe: Recipe
    
    var body: some View {
        VStack {
            ImageLoaderView(
                url: recipe.photoUrlLarge ?? "",
                imageWidth: 300,
                imageHeight: 300
            )
            
            HStack {
                VStack(alignment: .leading, spacing: 20) {
                    name
                    cuisine
                    website
                    youtube
                }
                .font(.system(size: 20, weight: .bold))
                .lineLimit(1)
                .minimumScaleFactor(0.8)
                Spacer()
            }
            .padding([.horizontal, .top])
            
            Spacer()
        }
    }
    
    private var name: some View {
        HStack {
            Text("Name: ")
            Spacer()
            Text("\(recipe.name ?? "N/A")")
        }
    }
    
    private var cuisine: some View {
        HStack {
            Text("Cuisine: ")
            Spacer()
            Text("\(recipe.cuisine ?? "N/A")")
        }
    }
    
    private var website: some View {
        HStack {
            Text("Website: ")
            Spacer()
            if let sourceUrl = recipe.sourceUrl, let sourceLink = URL(string: sourceUrl) {
                Link(sourceUrl, destination: sourceLink)
            } else {
                Text("N/A")
            }
            
        }
    }
    
    private var youtube: some View {
        HStack {
            Text("Youtube: ")
            Spacer()
            if let youtubeUrl = recipe.youtubeUrl, let youtubeLink = URL(string: youtubeUrl) {
                Link(youtubeUrl, destination: youtubeLink)
            } else {
                Text("N/A")
            }
        }
    }
}

#Preview {
    RecipeView(
        recipe: Recipe(
            cuisine: "Italian",
            name: "Spaghetti",
            photoUrlLarge: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/ff52841a-df5b-498c-b2ae-1d2e09ea658d/large.jpg",
            photoUrlSmall: "small photo url",
            sourceUrl: nil,
            youtubeUrl: nil,
            uuid: "123"
        )
    )
}
