//
//  Routes.swift
//  SwiftUIDITest
//
//  Created by innertainment00 on 2021/10/21.
//

class BindedView {
    
    static func secondView() -> SecondView {
        let _ = SecondViewBindings()
        return SecondView()
    }
    
    static func thirdView() -> ThirdView {
        let _ = ThirdViewBindings()
        return ThirdView()
    }
    
}
