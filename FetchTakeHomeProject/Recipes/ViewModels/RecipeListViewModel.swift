//
//  RecipeListViewModel.swift
//  FetchTakeHomeProject
//
//  Created by Jose Torres on 1/29/25.
//

import Foundation
import SwiftUI

@Observable
final class RecipeListViewModel {
    
    var recipes: [Recipe] = []
    var isLoadingRecipes: Bool = true
    
    let networkManger = NetworkManager.shared
    
    var showEmptyView: Bool {
        return isLoadingRecipes == false && recipes.count == 0
    }
    
    func fetchAllRecipes() async {
        isLoadingRecipes = true
        do {
            let recipes = try await NetworkManager.shared.fetchRecipes()
            self.recipes = recipes.recipes
        } catch {
            print(error.localizedDescription)
        }
        self.isLoadingRecipes = false
    }
    
    func refreshData() async {
        recipes.removeAll()
        self.isLoadingRecipes = true
        await fetchAllRecipes()
    }
}
