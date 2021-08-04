//
//  SwiftUITemplateApp.swift
//  SwiftUITemplate
//
//  Created by apple on 25/05/2021.
//

import SwiftUI

@main
struct SwiftUITemplateApp: App {
    let persistenceController = PersistenceController.shared
    @StateObject var appStore = StoreGroup.appStore

    init() {
        NetworkService.shared.startMonitor()
    }

    var body: some Scene {
        WindowGroup {
            AppView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(appStore)
        }
    }
}
