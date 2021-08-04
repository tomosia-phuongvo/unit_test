//
//  ListView.swift
//  SwiftUITemplate
//
//  Created by apple on 27/05/2021.
//

import Combine
import SwiftUI

fileprivate let minOffset: CGFloat = -1000

struct ListView<Content>: View where Content: View {
    var isRefresh: Published<Bool>.Publisher
    var isLoadmore: Binding<Bool>
    var performRefresh: () -> Void
    let listContentView: () -> Content

    @State private var refreshState = RefreshState()
    @State private var _isRefresh: Bool = false

    var body: some View {
        return ScrollView(.vertical, showsIndicators: true) {
            GeometryReader { reader -> AnyView in
                DispatchQueue.main.async {
                    if refreshState.offsetStart == minOffset {
                        refreshState.offsetStart = reader.frame(in: .global).minY
                    }
                    refreshState.offset = reader.frame(in: .global).minY
                    if refreshState.offset - refreshState.offsetStart > refreshState.distance {
                        refreshState.refreshIsInit = true
                    }
                    if refreshState.offset == refreshState.offsetStart && refreshState.refreshIsInit && !refreshState.refreshIsStarted {
                        withAnimation {
                            refreshState.refreshIsStarted = true
                            performRefresh()
                        }
                    }
                }
                return AnyView(EmptyView())
            }
            .frame(width: 0, height: 0)

            ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
                Image(systemName: "arrow.down")
                    .font(FontFamily.Roboto.medium.makeFont(from: 16))
                    .foregroundColor(.blue)
                    .rotationEffect(Angle(degrees: refreshState.refreshIsInit ? 180 : 0))
                    .offset(y: -UIApplication.statusBarHeight)
                    .animation(.easeIn)
                    .opacity(refreshState.refreshIsStarted ? 0 : 1)

                LazyVStack {
                    if refreshState.refreshIsStarted && _isRefresh {
                        VStack {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                        }
                        .frame(height: 30)
                    }

                    listContentView()
                }
            }

            if isLoadmore.wrappedValue {
                LoadmoreView()
            }
        }
        .onReceive(isRefresh) { isRefresh in
            if refreshState.refreshIsStarted && !isRefresh {
                refreshState.refreshIsInit = false
                refreshState.refreshIsStarted = false
            }
            _isRefresh = isRefresh
        }
    }

    struct RefreshState {
        let distance: CGFloat = 120
        var refreshIsInit = false
        var refreshIsStarted = false
        var offsetStart: CGFloat = minOffset
        var offset: CGFloat = 0
    }
}
