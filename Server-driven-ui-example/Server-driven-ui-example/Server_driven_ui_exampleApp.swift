//
//  Server_driven_ui_exampleApp.swift
//  Server-driven-ui-example
//
//  Created by Engin Gülek on 11.11.2024.
//

import SwiftUI

@main
struct Server_driven_ui_exampleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ViewModel())
        }
    }
}
