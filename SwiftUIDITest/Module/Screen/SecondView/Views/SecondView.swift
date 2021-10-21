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

