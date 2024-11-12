//
//  Models.swift
//  Server-driven-ui-example
//
//  Created by Engin Gülek on 11.11.2024.
//

import Foundation


// MARK: - PlaceDetail
struct CategoriesComponntModel: Decodable {
    let backroundColor: String
    let clipShape: Bool
    let data: [Categories]
    let frame: Frame
    let scaledType:String
    
    static var defaultData: CategoriesComponntModel = CategoriesComponntModel(
           backroundColor: "#EEEEEE",
           clipShape: true, // TRUE yerine 'true' kullanmalısınız
           data: [Categories(id: 1, imageURL: "https://cdn2.iconfinder.com/data/icons/household-appliances-8/64/clothing-512.png")],
           frame: Frame(height: 50, width: 50),
           scaledType: "fit"
       )
}

// MARK: - Categories
struct Categories: Decodable {
    let id:Int
    let imageURL: String

    enum CodingKeys: String, CodingKey {
        case imageURL = "imageUrl"
        case id = "id"
    }
}

// MARK: - Frame
struct Frame: Codable {
    let height, width: Float
}


