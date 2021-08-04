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


class LoginTest: XCTestCase {
    
    var viewModel: LoginViewModel!
    private var cancellable = Set<AnyCancellable>()
    static var i = 0

    
    override func setUp() {
        super.setUp()
        viewModel = LoginViewModel(apiService: UserAPIServiceImpl(apiSession: APISession()))
        print("Test Run")
        print(testRun)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testValidate() {
        measure {
            viewModel.email = "vonguyenchiphuong@gmail.com"
            viewModel.password = "12345678"
            XCTAssertTrue(viewModel.isValid)
        }
    }
    
    func testInValidateEmpty() {
        viewModel.email = ""
        viewModel.password = ""
        XCTAssertFalse(viewModel.isValid)
    }
    
    func testInValidateEmail() {
        viewModel.email = "vonguyenchiphuong"
        viewModel.password = "12345678"
        XCTAssertFalse(viewModel.isValid)
    }
    
    func testInValidatePassword() {
        viewModel.email = "vonguyenchiphuong@gmail.com"
        viewModel.password = "12345"
        XCTAssertFalse(viewModel.isValid)
    }
    
    func testLoginSuccess() {
        measure {
            let data = loadStub(name: "login_success", extension: "json")
            
            // Define Stub
            stub(everything, jsonData(data))
            
            viewModel.email = "phuong.vo14@tomosia.com"
            viewModel.password = "Banvatoi77"
            
            
            // Define Expectation
            let expectation = XCTestExpectation(description: "Login")
            
            // Install Handler
            viewModel.login().sink { completion in
                print(completion)
            } receiveValue: { (response) in
                XCTAssertNotNil(response.data)
                XCTAssertEqual(response.data!.token, "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo3NTQsInRpbWVfY3JlYXRlIjoxNjI3NTg4Njc2fQ.Jz-QiEWtLqLdu06cwfq2xFXLEmvxTlnvFPH2xCEGtvM")
                XCTAssertEqual(response.data!.profile!.username!, "phuong.vo14@tomosia.com")
                expectation.fulfill()
            }.store(in: &cancellable)
            
            // Wait for Expectation to Be Fulfilled
            wait(for: [expectation], timeout: 5.0)
        }
    }
    
    func testLoginFailure() {
        let data = loadStub(name: "login_failure", extension: "json")
        
        // Define Stub
        stub(everything, jsonData(data))
        
        viewModel.email = "phuong.vo15@tomosia.com"
        viewModel.password = "12345678"
        
        // Define Expectation
        let expectation = XCTestExpectation(description: "Login")
        
        // Install Handler
        viewModel.login().sink { completion in
            print(completion)
        } receiveValue: { (response) in
            XCTAssertNil(response.data)
            XCTAssertEqual(response.message!, "メールアドレスまたはパスワードに誤りがあります")
            XCTAssertEqual(response.errorCode, 21)
            expectation.fulfill()
        }.store(in: &cancellable)
        
        // Wait for Expectation to Be Fulfilled
        wait(for: [expectation], timeout: 5.0)
    }
}
