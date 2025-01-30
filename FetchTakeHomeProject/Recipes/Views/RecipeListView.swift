//
//  RecipeListView.swift
//  FetchTakeHomeProject
//
//  Created by Jose Torres on 1/29/25.
//

import SwiftUI

struct RecipeListView: View {
    
    @State var viewModel = RecipeListViewModel()
    
    var body: some View {
        NavigationView {
            recipeListOrEmptyView
            .navigationTitle("Recipes")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    toolBarView
                }
            }
        }
        .tint(.primary)
        .task {
            await viewModel.fetchAllRecipes()
        }
    }
    
    @ViewBuilder
    private var recipeListOrEmptyView: some View {
        if viewModel.showEmptyView {
            emptyListView
        } else {
            recipeListView
        }
    }
    
    private var recipeListView: some View {
        ScrollView {
            VStack {
                ForEach(viewModel.recipes, id: \.uuid) { recipe in
                    NavigationLink(
                        destination: RecipeView(recipe: recipe)
                    ) {
                        LazyVStack {
                            recipeCellView(for: recipe)
                        }
                    }
                }
            }
        }
    }
    
    private func recipeCellView(for recipe: Recipe) -> some View {
        HStack {
            ImageLoaderView(url: recipe.photoUrlSmall ?? "")
                .padding(.leading)
            VStack(alignment: .leading, spacing: 10) {
                description(for: recipe)
                links(for: recipe)
            }
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 150)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(
                    Color(UIColor.secondarySystemBackground)
                )
        )
        .padding(.horizontal)
    }
    
    private func description(for recipe: Recipe) -> some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack(spacing: 0) {
                Text("Name: ")
                    .foregroundStyle(Color.secondary)
                    .font(.system(size: 15, weight: .bold))
                Text(recipe.name)
                    .fontWeight(.semibold)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
            }
        
            HStack(spacing: 0) {
                Text("Cuisine: ")
                    .foregroundStyle(Color.secondary)
                    .font(.system(size: 15, weight: .bold))
                Text(recipe.cuisine)
                    .fontWeight(.semibold)
            }
        }
    }
    
    private func links(for recipe: Recipe) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            if let sourceUrl = recipe.sourceUrl, let sourceLink = URL(string: sourceUrl) {
                Link("Vist Website", destination: sourceLink)
                    .foregroundStyle(Color.primary)
                    .fontWeight(.bold)
            } else {
                Text("Visit Website")
                    .foregroundStyle(Color.primary)
                    .fontWeight(.bold)
                    .opacity(0.1)
            }
            
            if let youtubeUrl = recipe.youtubeUrl, let youtubeLink = URL(string: youtubeUrl) {
                Link("Visit Youtube Video", destination: youtubeLink)
                    .foregroundStyle(Color.primary)
                    .fontWeight(.bold)
            } else {
                Text("Visit Youtube Video")
                    .foregroundStyle(Color.primary)
                    .fontWeight(.bold)
                    .opacity(0.1)
            }
        }
    }
    
    private var toolBarView: some View {
        HStack {
            if !viewModel.isLoadingRecipes {
                refreshDataButton
            } else {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .frame(width: 25, height: 25)
            }
            
            Button {
         
            } label: {
                Image(systemName: "ellipsis.circle")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 25, height: 25)
            }
        }
    }
    
    private var refreshDataButton: some View {
        Button {
            Task {
                await viewModel.refreshData()
            }
        } label: {
            Image(systemName: "arrow.clockwise.circle")
                .resizable()
                .scaledToFill()
                .frame(width: 25, height: 25)
        }
    }
    
    private var emptyListView: some View {
        Text("Sorry no recipes were found!")
            .font(.system(size: 20, weight: .bold))
            .foregroundColor(.secondary)
    }
}

#Preview {
    RecipeListView()
}
