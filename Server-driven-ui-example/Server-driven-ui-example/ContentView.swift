//
//  ContentView.swift
//  Server-driven-ui-example
//
//  Created by Engin Gülek on 11.11.2024.
//

import SwiftUI
import Kingfisher
struct ContentView: View {
    @State private var categorieComponent = CategoriesComponntModel.defaultData
    @State private var productComponents : [ProductComponentModel] = []
    @ObservedObject  var viewModel:ViewModel
    
    var body: some View {
        VStack(spacing:20) {
            ScrollView {
                VStack(alignment:.leading){
                    Text("Categories")
                        .font(.title2)
                        .fontWeight(.semibold)
                    ScrollView(.horizontal,showsIndicators: false){
                        CategoryUIComponetBuilder.builComponent(from: viewModel.categorieComponent)
                    }.frame(height: 80)
                }
                VStack(alignment:.leading){
                    Text("Products")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    ScrollView(.vertical,showsIndicators: true) {
                        ProductUIComponentBuilder.buildComponent(from: viewModel.productComponents)
                    }
                }
            }
        }
        .padding()
        .onAppear{
            viewModel.fetchData()
        }.refreshable {
            viewModel.fetchData()
        }
    }
    
}

#Preview {
    ContentView(viewModel: ViewModel())
}
