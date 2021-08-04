
import SwiftUI

struct LoginRouterView: View {
    @StateObject var router: LoginRouter = LoginRouter()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        ZStack {
            router.screen

            if router.isShowLoading {
                LoadingView()
                    .zIndex(1)
                    .transition(.opacity)
            }
        }
        .onChange(of: router.isCompleted) { _ in
            presentationMode.wrappedValue.dismiss()
        }
        .alert(item: $router.msgAlertContent) { item in
            Alert(title: Text(item.title),
                  message: Text(item.message),
                  dismissButton: .cancel())
        }
    }
}
