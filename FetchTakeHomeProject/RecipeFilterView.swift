//
//  RecipeFilterView.swift
//  FetchTakeHomeProject
//
//  Created by Jose Torres on 1/29/25.
//

import SwiftUI

struct RecipeFilterView: View {
    var body: some View {
        VStack {
            Text("Cuisine")
            Text("Name")
            Text("Website")
            Text("Youtube")
        }
        .frame(width: 200, height: 125)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(.secondary)
        )
    }
}

#Preview {
    RecipeFilterView()
}
