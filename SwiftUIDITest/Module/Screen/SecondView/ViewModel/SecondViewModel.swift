//
//  SecondViewModel.swift
//  SwiftUIDITest
//
//  Created by innertainment00 on 2021/10/21.
//

import Foundation

class SecondViewModel: ObservableObject {
    
    @Inject var printComponent: PrintComponent
    
    func printIamSecondViewModel() {
        print("Iam Second ViewModel")
        printComponent.printAnything(origin: "SecondViewModel")
    }
    
}
