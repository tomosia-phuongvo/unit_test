//
//  AppView.swift
//  SwiftUITemplate
//
//  Created by apple on 26/05/2021.
//

import SwiftUI

struct AppView: View {
    @EnvironmentObject var appStore: AppStore

    @ViewBuilder
    var body: some View {
        ZStack {
//            if appStore.state.tutorialIsDisplay {
//                HomeRouterView()
//            } else {
//                TutorialRouterView()
//            }
            LoginRouterView()
        }
        .ignoresSafeArea(.all)
    }
}
