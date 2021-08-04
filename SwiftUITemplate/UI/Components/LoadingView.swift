//
//  LoadingView.swift
//  SwiftUITemplate
//
//  Created by apple on 27/05/2021.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color.black
                .opacity(0.3)

            VStack {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    .scaleEffect(x: 1.6, y: 1.6)
                    .padding(.all, 40)
            }
            .background(Color.black)
            .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
