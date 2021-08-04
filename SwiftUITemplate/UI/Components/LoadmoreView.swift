//
//  LoadmoreView.swift
//  SwiftUITemplate
//
//  Created by apple on 26/05/2021.
//

import SwiftUI

struct LoadmoreView: View {
    var body: some View {
        VStack {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .blue))
        }
        .frame(width: kScreen.bounds.width, height: 30)
    }
}

struct LoadmoreView_Previews: PreviewProvider {
    static var previews: some View {
        LoadmoreView()
    }
}
