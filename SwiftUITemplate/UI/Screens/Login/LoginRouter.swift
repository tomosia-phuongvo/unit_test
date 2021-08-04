import Combine
import Foundation
import Swinject

class LoginRouter: RouterProtocol {
    var screen: LoginScreen
    @Published var isCompleted: Bool = false
    @Published var isOpenPolicy: Bool = false
    @Published var isShowLoading: Bool = false
    @Published var msgAlertContent: MsgAlertContent?

    private var container: Container

    init() {
        container = Container()
        container.register(APIService.self,
                           factory: { _ in APISession() })
        container.register(UserAPIService.self,
                           factory: { r in
                            UserAPIServiceImpl(apiSession: r.resolve(APIService.self)!)
                           })
        let viewModel = LoginViewModel(apiService: container.resolve(UserAPIService.self)!)
        screen = LoginScreen(viewModel: viewModel)
        viewModel.router = self
    }

    func handleOpenPolicy() {
        isOpenPolicy = true
    }

    func didCompleted() {
        isCompleted = true
    }

    func showLoading() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.animation(.easeIn) { [weak self] in
                self?.isShowLoading = true
            }
        }
    }

    func hideLoading() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.animation(.easeIn) { [weak self] in
                self?.isShowLoading = false
            }
        }
    }
}
