//
//  ImageLoaderView.swift
//  FetchTakeHomeProject
//
//  Created by Jose Torres on 1/29/25.
//

import SwiftUI

struct ImageLoaderView: View {
    
    @State var viewModel: ImageLoaderViewModel
    let imageWidth: CGFloat
    let imageHeight: CGFloat
    
    init(
        url: String,
        imageWidth: CGFloat = 115,
        imageHeight: CGFloat = 115
    ) {
        self.viewModel = ImageLoaderViewModel(url: url)
        self.imageWidth = imageWidth
        self.imageHeight = imageHeight
    }
  
    var body: some View {
        VStack {
            if !viewModel.isLoadingImage {
                if let image = viewModel.image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                } else {
                    Text("Image Not Available!")
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                }
            } else {
                ProgressView()
            }
        }
        .frame(
            width: imageWidth,
            height: imageHeight
        )
        .task {
           await viewModel.getImage()
        }
    }
}

#Preview {
    ImageLoaderView(
        url: "https://d3jbb8n5wk0qxi.cloudfrot.net/photos/ff52841a-df5b-498c-b2ae-1d2e09ea658d/small.jpg"
    )
}
