//
//  ThirdView.swift
//  SwiftUIDITest
//
//  Created by innertainment00 on 2021/10/21.
//

import SwiftUI

struct ThirdView: View {
    
    @Inject var printComponent: PrintComponent
    
    var body: some View {
        Text("ThirdView")
            .onAppear {
                printComponent.printAnything(origin: "ThirdView")
            }
    }
}

struct ThirdView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdView()
    }
}
