//
//  Provider.swift
//  SwiftUIDITest
//
//  Created by innertainment00 on 2021/10/21.
//

@propertyWrapper struct Provider<T> {
    var wrappedValue: T
    
    init(wrappedValue: T) {
        self.wrappedValue = wrappedValue
        DependencyInjector.register(dependency: wrappedValue)
    }
}

