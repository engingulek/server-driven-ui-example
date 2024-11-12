//
//  ProductComponent.swift
//  Server-driven-ui-example
//
//  Created by Engin Gülek on 11.11.2024.
//

import Foundation

struct ProductComponentModel : Decodable {
    let id:Int
    let imageComponent:ProductImageComponentModel
    let producNameComponet:TextComponentModel
    let productDescComponent:TextComponentModel
    let productOldPriceComponent:TextComponentModel?
    let productNowPriceComponet:TextComponentModel
}


struct ProductImageComponentModel : Decodable {
    let imageUrl:String
    let scaleType:String
    let cornerRadius:Int
}

struct TextComponentModel:Decodable{
    let textType:String
    let text:String
    let color:String
    
}

