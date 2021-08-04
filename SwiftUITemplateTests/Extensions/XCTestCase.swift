//
//  XCTestCase.swift
//  SwiftUITemplateTests
//
//  Created by Mac on 7/22/21.
//

import XCTest
import Combine

extension XCTestCase {
    func loadStub(name: String, extension: String) -> Data {
        let bundle = Bundle(for: classForCoder)
        let url = bundle.url(forResource: name, withExtension: `extension`)
        
        return try! Data(contentsOf: url!)
    }
    
}
