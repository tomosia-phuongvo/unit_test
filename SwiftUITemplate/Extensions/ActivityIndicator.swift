//
//  ActivityIndicator.swift
//  SwiftUITemplate
//
//  Created by Mac on 7/29/21.
//

import Foundation
import Combine


final class ActivityLoading {
    
    private struct ActivityHandler<Source: Publisher> {
        let source: Source
        let begin: () -> Void
        let finish: () -> Void
        
        func asPublisher() -> AnyPublisher<Source.Output, Source.Failure> {
            source.handleEvents (receiveOutput: { _ in
                finish()
            }, receiveCompletion: { _ in
                finish()
            }, receiveCancel: {
                finish()
            }, receiveRequest: { _ in
                begin()
            }).eraseToAnyPublisher()
        }
    }
    
    
    @Published private var relay = 0
    private let lock = NSRecursiveLock()
    
    var isLoading: Bool {
        relay > 0
    }
    
    var loading: AnyPublisher<Bool, Never> {
        $relay.map { $0 > 0 }
            .removeDuplicates()
            .eraseToAnyPublisher()
    }
    
    init() {}
    
    func trackActivityOfPublisher<Source: Publisher>(source: Source) -> AnyPublisher<Source.Output, Source.Failure> {
        return ActivityHandler(source: source) {
            self.increment()
        } finish: {
            self.decrement()
        }.asPublisher()

    }
    
    private func increment() {
        lock.lock()
        relay += 1
        lock.unlock()
    }
    
    private func decrement() {
        lock.lock()
        relay -= 1
        lock.unlock()
    }
}

extension Publisher {
    func trackActivity(_ activityIndicator: ActivityLoading) -> AnyPublisher<Self.Output, Self.Failure> {
        activityIndicator.trackActivityOfPublisher(source: self)
    }
}

