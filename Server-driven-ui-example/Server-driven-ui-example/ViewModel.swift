//
//  ViewModel.swift
//  Server-driven-ui-example
//
//  Created by Engin Gülek on 12.11.2024.
//

import Foundation

class ViewModel : ObservableObject {
    @Published var categorieComponent = CategoriesComponntModel.defaultData
    @Published var productComponents : [ProductComponentModel] = []
    
    
    func fetchData(){
        fetchCategories()
        fetchProducts()
    
    }
    
   private func fetchCategories() {
                let url = URL(string: "https://server-driven-ui-f2fb7-default-rtdb.firebaseio.com/categories.json")!
                URLSession.shared.dataTask(with: url) { data, response, error in
                    if let error = error {
                        print("Network error: \(error)")
                        return
                    }
                    
                    guard let data = data else {
                        print("No data received")
                        return
                    }
                    
                    do {
                        let components = try JSONDecoder().decode(CategoriesComponntModel.self, from: data)
                        DispatchQueue.main.async { [weak self] in
                            guard let self = self else {return}
                            categorieComponent = components
                        }
                       
                    } catch {
                        print("Decoding error: \(error)")
                    }
                }.resume()
        
    }
    
    
   private func fetchProducts(){
        let url = URL(string: "https://server-driven-ui-f2fb7-default-rtdb.firebaseio.com/products.json")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Network error: \(error)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                let components = try JSONDecoder().decode([ProductComponentModel].self, from: data)
                DispatchQueue.main.async {
                    [weak self] in
                        guard let self = self else {return}
                   productComponents = components
                }
               
            } catch {
                print("Decoding error: \(error)")
            }
        }.resume()

    }
}
