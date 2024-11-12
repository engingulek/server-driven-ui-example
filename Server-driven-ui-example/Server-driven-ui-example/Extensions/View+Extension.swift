//
//  View+Extension.swift
//  Server-driven-ui-example
//
//  Created by Engin Gülek on 11.11.2024.
//

import Foundation
import SwiftUI
extension View {
    func scaledTypeForImage(scaledType:String) -> some View {
        switch scaledType {
        case "fill":
            return AnyView(scaledToFill())
        case "fit":
            return AnyView(scaledToFit())
        default:
            return AnyView(scaledToFit())
        }
    }
    
    
    func clipShapeForImage(from clipShaped:Bool) -> some View {
        return clipShaped ? AnyView(clipShape(Circle())) : nil
    }
    
    func fontDesingForText(from textComponent:TextComponentModel?) -> some View {
        switch textComponent?.textType ?? "default" {
        case "productTitle":
            return AnyView(
                font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color(UIColor(hex: textComponent?.color ?? "")!))
            )
        case "desc":
            return AnyView(
                font(.footnote)
                    .lineLimit(2)
                    .foregroundStyle(Color(UIColor(hex: textComponent?.color ?? "")!))
            )
        case "oldPrice":
            return AnyView(
                dynamicTypeSize(.large)
                    .strikethrough()
                    .foregroundStyle(Color(UIColor(hex: textComponent?.color ?? "")!))
            )
        case "nowPrice":
            return AnyView(
                dynamicTypeSize(.xLarge)
                    .font(.title3)
                    .foregroundStyle(Color(UIColor(hex: textComponent?.color ?? "")!))
            )
        default:
            return AnyView(
                fontWeight(.medium)
                    .foregroundStyle(Color(UIColor(hex:"#FFFFFF")!))
            )
        }
    }
}
