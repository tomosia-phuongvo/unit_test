//
//  LoginScreen.swift
//  WidgetApp
//
//  Created by Tri Dang on 28/06/2021.


import SwiftUI

private struct ConfigurationLoginScreen {
    static let widthTextFieldContent: CGFloat = UIScreen.main.bounds.width - 40
    static let limitInputPassword = 16
    static let limitInputName = 24
    static let heightTextField: CGFloat = 50
}


struct LoginScreen: View {
    @StateObject var viewModel: LoginViewModel
    @State private var showMessage = false
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    VStack {
                        InputTextFieldView(image: Image(uiImage: Asset.icMail.image),
                                           lineColor: .clear,
                                           textPlaceHolder: "Email",
                                           textChange: $viewModel.email)
                            .frame(width: ConfigurationLoginScreen.widthTextFieldContent,
                                   height: ConfigurationLoginScreen.heightTextField)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.gray, lineWidth: 0.5)
                            )
                        InputTextFieldView(image: Image(uiImage: Asset.icPassword.image),
                                           lineColor: .clear,
                                           textPlaceHolder: "Password",
                                           isPasswordType: true,
                                           textChange: $viewModel.password)
                            .frame(width: ConfigurationLoginScreen.widthTextFieldContent,
                                   height: ConfigurationLoginScreen.heightTextField)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.gray, lineWidth: 0.5)
                            )
                        Spacer()
                            .frame(height: ConfigurationLoginScreen.heightTextField)

                        Button {
                            viewModel.action.send(.login)
                        } label: {
                            RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                                .overlay(
                                    Text("Login")
                                        .foregroundColor(.black)
                                )
                                .frame(width: ConfigurationLoginScreen.widthTextFieldContent,
                                       height: ConfigurationLoginScreen.heightTextField)
                                .foregroundColor(viewModel.isValid ? .blue : Color(Asset.colorLightText.color.cgColor))
                        }
                        .buttonStyle(BorderlessButtonStyle())
                        .allowsHitTesting(viewModel.isValid)
                    }
                    .background(Color.clear)
                }
            }
            .frame(minWidth: 0,
                   maxWidth: .infinity,
                   minHeight: 0,
                   maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
            .background(
                Color(.white)
                    .allowsHitTesting(true)
                    .onTapGesture {
//                        UIApplication.shared.endEditing()
                    }
            )
            .navigationBarTitle(
                Text("Login"),
                displayMode: .inline)
        }
    }
}

struct InputTextFieldView: View {
    var image: Image = Image("")
    var lineColor: Color = .black
    var textPlaceHolder: String = ""
    var isPasswordType: Bool = false
    var limit: Int = Int.max
    @State private var isHiddenPlaceHolder: Bool = false
    @Binding var textChange: String

    var body: some View {
        HStack {
            image
                .resizable()
                .frame(width: 15, height: 15)
                .scaledToFill()
                .padding(EdgeInsets(top: 5, leading: 16, bottom: 5, trailing: 5))
            ZStack {
                Text(isHiddenPlaceHolder ? "" : textPlaceHolder)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    .foregroundColor(.gray)
                    .allowsHitTesting(false)
                    .background(Color.clear)
                    .ignoresSafeArea()
                if isPasswordType {
                    CustomTextField(bindingText: BindingText(textChange: $textChange, limit: limit),
                                    isSercure: true)
                        .onChange(of: textChange) { text in
                            isHiddenPlaceHolder = !text.isEmpty
                        }
                } else {
                    CustomTextField(bindingText: BindingText(textChange: $textChange, limit: limit))
                        .onChange(of: textChange) { text in
                            isHiddenPlaceHolder = !text.isEmpty
                        }
                }
            }
            Spacer()
        }
    }
}

struct CustomTextField: View {
    @StateObject var bindingText: BindingText
    var isSercure: Bool = false

    var body: some View {
        if isSercure {
            SecureField("", text: $bindingText.text)
                .textContentType(.oneTimeCode)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .foregroundColor(.black)
                .ignoresSafeArea()
        } else {
            TextField("", text: $bindingText.text)
                .textContentType(.oneTimeCode)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .foregroundColor(.black)
                .ignoresSafeArea()
        }
    }
}

class BindingText: ObservableObject {
    @Binding var textChange: String
    var limitText: Int
    init(textChange: Binding<String>, limit: Int) {
        _textChange = textChange
        limitText = limit
        text = textChange.wrappedValue
    }

    @Published var text: String = "" {
        didSet {
            if text.count > limitText {
                text = oldValue
            }
            textChange = text
        }
    }
}
