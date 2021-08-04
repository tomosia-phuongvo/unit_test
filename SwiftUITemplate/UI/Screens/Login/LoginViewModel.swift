import Combine
import SwiftUI
import Swinject

class LoginViewModel: ViewModelProtocol {

    @Published var isValidRegister: Bool = false
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isValid = false
    
    unowned var router: LoginRouter!
    var apiService: UserAPIService
    var action = PassthroughSubject<ViewAction, Never>()
    var activityLoading = ActivityLoading()

    private var cancellable = Set<AnyCancellable>()
    

    init(apiService: UserAPIService) {
        self.apiService = apiService
        binding()
        listenerAction()
    }

    func binding() {
        let validate = Publishers.CombineLatest($email, $password)
        validate.map { input in
            return input.0.isEmail && !input.0.isEmpty && !input.1.isEmpty && input.1.count >= 8
        }.eraseToAnyPublisher()
        .assign(to: &$isValid)
        
        activityLoading.loading.sink { (isLoading) in
            print("Loading")
            print(isLoading)
        }.store(in: &cancellable)
        
    }
    
    func listenerAction() {
        action.sink {[weak self] (action) in
            guard let self = self else { return }
            switch action {
            case .login:
                self.login()
                    .trackActivity(self.activityLoading)
                    .sink { (completion) in
                    switch completion {
                    case .failure(let error):
                        self.router.msgAlertContent = MsgAlertContent(title: "", message: error.localizedDescription)
                    default: break
                    }
                } receiveValue: { (response) in
                    self.router.msgAlertContent = MsgAlertContent(title: "", message: "Login Success")
                }.store(in: &self.cancellable)
            }
        }.store(in: &cancellable)
        
        
    }
    
    func login() -> AnyPublisher<Response<UserInforModel>, APIError> {
        let parameter = Request.Login(email: email, password: password, deviceType: 1)
        return apiService.loginEmail(parameter).receive(on: DispatchQueue.main).eraseToAnyPublisher()
    }
}

extension LoginViewModel {
    enum ViewAction {
        case login
    }
}
