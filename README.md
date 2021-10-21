# Structure

- Presentation
    - Model
    - Services → Environment Objects
    - Architectect
        - DependencyInjector
        - BindedView
    - Components
        - DialogNavigator
    - Modules
        - Dialog
            - SomeDialogView
                - Bindings
                - ViewModel
                - Views
        - Screens
            - SecondView
                - Bindings
                - ViewModel
                - Views
            - ThirdView
                - Bindings
                - ViewModel
                - Views
- Domain
    - Usecases
- Data
    - Model
    - DataSource
    - Repository

# Dependency Injector

```swift
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

@propertyWrapper struct Inject<T> {
    var wrappedValue: T
    
    init() {
        self.wrappedValue = DependencyInjector.resolve()
    }
}



@propertyWrapper struct Provider<T> {
    var wrappedValue: T
    
    init(wrappedValue: T) {
        self.wrappedValue = wrappedValue
        DependencyInjector.register(dependency: wrappedValue)
    }
}
```

# BindedView - Routes

```swift
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
```

# Module

### View

```swift
//
//  SecondView.swift
//  SwiftUIDITest
//
//  Created by innertainment00 on 2021/10/21.
//

import SwiftUI

struct SecondView: View {
    
    @Inject var secondViewModel: SecondViewModel

    var body: some View {
        
        NavigationView {
            NavigationLink(destination: BindedView.thirdView) {
                Text("SecondView")
                    .onAppear {
                        secondViewModel.printIamSecondViewModel()
                    }
            }
        }
    }
    
    
    
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
```

### SecondViewModel

```swift
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
```

### Bindings

```swift
//
//  SecondViewBindings.swift
//  SwiftUIDITest
//
//  Created by innertainment00 on 2021/10/21.
//

struct SecondViewBindings {
    @Provider var printComponent = PrintComponent()
    @Provider var secondViewModel = SecondViewModel()
}
```