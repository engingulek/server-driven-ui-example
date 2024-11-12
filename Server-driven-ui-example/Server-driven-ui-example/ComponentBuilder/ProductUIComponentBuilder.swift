//
//  ProductUIComponentBuilder.swift
//  Server-driven-ui-example
//
//  Created by Engin Gülek on 11.11.2024.
//

import Foundation
import SwiftUI
import Kingfisher

struct ProductUIComponentBuilder {
    @MainActor
    static func buildComponent(from productComponents:[ProductComponentModel]) -> some View {
        return AnyView(
            LazyVGrid(columns: [GridItem(),GridItem()], content: {
                ForEach(productComponents, id: \.id) { productComponent in
                    ZStack(alignment:.bottomLeading){
                        
                        KFImage(URL(string: productComponent.imageComponent.imageUrl))
                            .resizable()
                            .scaledTypeForImage(scaledType: productComponent.imageComponent.scaleType)
                            .cornerRadius(CGFloat(productComponent.imageComponent.cornerRadius))
                        
                        VStack(alignment:.leading){
                            Text(productComponent.producNameComponet.text)
                            
                                .fontDesingForText(from: productComponent.producNameComponet)
                            
                            Text(productComponent.productDescComponent.text)
                                .fontDesingForText(from: productComponent.productDescComponent)
                            
                            HStack{
                                Text(productComponent.productOldPriceComponent?.text ?? "")
                                    .fontDesingForText(from: productComponent.productOldPriceComponent)
                                
                                
                                Text(productComponent.productNowPriceComponet.text)
                                    .fontDesingForText(from: productComponent.productNowPriceComponet)
                            }
                            
                        }.padding([.leading,.bottom],4)
                        
                    }.cornerRadius(15)
                    
                    
                    
                }
                
                
            })
            
        )
    }
}
