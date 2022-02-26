//
//  lab13_4.swift
//  lab13
//
//  Created by Piotr Piwonski on 20/01/2022.
//

import SwiftUI

struct lab13_4: View {
    var body: some View {
        HStack {
            VStack {
                Text("Jabłko").font(.largeTitle)
                Image("apple")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100, alignment: .center)
            }
            VStack {
                Text("Gruszka").font(.largeTitle)
                Image("peer")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100, alignment: .center)
            }
            VStack {
                Text("Pomarańcza").font(.largeTitle)
                Image("orange")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100, alignment: .center)
            }
        }
    }
}

struct lab13_4_Previews: PreviewProvider {
    static var previews: some View {
        lab13_4()
    }
}
