//
//  SwiftUITemplateTests.swift
//  SwiftUITemplateTests
//
//  Created by Mac on 7/22/21.
//

import XCTest
@testable import SwiftUITemplate
import Combine
import Mockingjay
import Quick
import Nimble

class LoginTestQuick: QuickSpec {
    var viewModel: LoginViewModel!
    private var cancellable = Set<AnyCancellable>()
    let service = UserAPIServiceImplMock(apiSession: APISession())
    
    override func setUp() {

        viewModel = LoginViewModel(apiService: service)
    }
    
    override func spec() {
        setUp()
        describe("Test input email and password") {
            context("User input correct email and correct password") {
                beforeEach {
                    self.viewModel.email = "vonguyenchiphuong@gmail.com"
                    self.viewModel.password = "12345678"
                }
                
                it("Check validate") {
                    expect(self.viewModel.isValid).to(equal(true))
                }
                
                afterEach {
                    self.viewModel.email = ""
                    self.viewModel.password = "12345678"
                }
            }
            
            context("User input empty email and empty password") {
                beforeEach {
                    self.viewModel.email = ""
                    self.viewModel.password = ""
                }
                
                it("Check validate") {
                    expect(self.viewModel.isValid).to(equal(false))
                }
            }
            
            context("User input wrong email and correct password") {
                beforeEach {
                    self.viewModel.email = "vonguyenchiphuong"
                    self.viewModel.password = "12345678"
                }
                it("Check validate") {
                    expect(self.viewModel.isValid).to(equal(false))
                }
            }
            
            context("User input correct email and wrong password") {
                beforeEach {
                    self.viewModel.email = "vonguyenchiphuong@gmail.com"
                    self.viewModel.password = "12345"
                }
                it("Check validate") {
                    expect(self.viewModel.isValid).to(equal(false))
                }
            }
        }
        
        describe("Test login function api") {
            
            
            context("User tap login button") {
                beforeEach {
                    
                    self.viewModel.email = "phuong.vo14@tomosia.com"
                    self.viewModel.password = "Banvatoi77"
                    
                    let data = self.loadStub(name: "login_success", extension: "json")
                    
                    self.stub(everything, jsonData(data))
                }
                it("Check login success") {
                    let expectation = XCTestExpectation(description: "Login")
                    self.viewModel.login().sink { completion in
                        print(completion)
                    } receiveValue: { (response) in
                        expect(response.data).toNot(beNil())
                        expect(response.data!.token).to(equal("eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo3NTQsInRpbWVfY3JlYXRlIjoxNjI3NTg4Njc2fQ.Jz-QiEWtLqLdu06cwfq2xFXLEmvxTlnvFPH2xCEGtvM"))
                        expect(response.data!.profile!.username!).to(equal("phuong.vo14@tomosia.com"))
                        expectation.fulfill()
                    }.store(in: &self.cancellable)
                    self.wait(for: [expectation], timeout: 5.0)
                }
            }
        }
        
        describe("Test login function api") {
            context("User tap login button") {
                beforeEach {
                    
                    self.viewModel.email = "phuong.vo15@tomosia.com"
                    self.viewModel.password = "Banvatoi77"
                    
                    let data = self.loadStub(name: "login_failure", extension: "json")
                    
                    self.stub(everything, jsonData(data))
                }
                it("Check login failure") {
                    let expectation = XCTestExpectation(description: "Login")
                    self.viewModel.login().sink { completion in
                        print(completion)
                    } receiveValue: { (response) in
                        expect(response.data).to(beNil())
                        expect(response.message!).to(equal("メールアドレスまたはパスワードに誤りがあります"))
                        expect(response.errorCode).to(equal(21))
                        expectation.fulfill()
                    }.store(in: &self.cancellable)
                    self.wait(for: [expectation], timeout: 5.0)
                }
            }
        }
    }
    
}
