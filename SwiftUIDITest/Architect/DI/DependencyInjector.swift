//
//  DependencyInjector.swift
//  SwiftUIDITest
//
//  Created by innertainment00 on 2021/10/21.
//

struct DependencyInjector {
    private static var dependencyList: [String:Any] = [:]
    
    static func resolve<T>() -> T {
        guard let t = dependencyList[String(describing: T.self)] as? T else {
            fatalError("No provider registered for type \(T.self)")
        }
        return t
    }
    
    static func register<T>(dependency: T) {
        dependencyList[String(describing: T.self)] = dependency
    }
}

