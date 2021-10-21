//
//  Inject.swift
//  SwiftUIDITest
//
//  Created by innertainment00 on 2021/10/21.
//

@propertyWrapper struct Inject<T> {
    var wrappedValue: T
    
    init() {
        self.wrappedValue = DependencyInjector.resolve()
    }
}

