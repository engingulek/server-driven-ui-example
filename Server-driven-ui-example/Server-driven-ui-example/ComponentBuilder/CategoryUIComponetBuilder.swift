//
//  CategoryUIComponetBuilder.swift
//  Server-driven-ui-example
//
//  Created by Engin Gülek on 11.11.2024.
//

import Foundation
import SwiftUI
import Kingfisher

struct CategoryUIComponetBuilder {
    @MainActor
    static func builComponent(from categoryComponet:CategoriesComponntModel?) -> some View {
        return AnyView(
            LazyHStack(content: {
                ForEach(categoryComponet!.data ,id: \.id) { image in
                    KFImage(URL(string: image.imageURL))
                        .resizable()
                        .scaledTypeForImage(scaledType: categoryComponet!.scaledType)
                        .background(Color(UIColor(hex: categoryComponet!.backroundColor) ?? .white))
                        .frame(width: CGFloat(categoryComponet!.frame.width),
                               height: CGFloat(categoryComponet!.frame.height))
                        .clipShapeForImage(from: categoryComponet!.clipShape)
                    
                }
            })
        )
    }
   
    
    
}
