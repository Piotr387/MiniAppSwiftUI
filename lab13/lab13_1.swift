//
//  lab13_1.swift
//  lab13
//
//  Created by Piotr Piwonski on 20/01/2022.
//

import SwiftUI



struct lab13_1: View {
    @State private var promien = ""
    @State private var alert = false
    @State private var wcisniety = false
    
    var body: some View {
        HStack {
            Text("Podaj promien okregu: ")
            TextField("Wpisz promień...", text: $promien)
        }
        Button(action: {
            if Float(promien) != nil {
                wcisniety = true
            } else {
                alert = true
            }
        }) {
            Text("Oblicz pole i obwód")
        }
        .alert(isPresented: $alert){
            Alert(
                title: Text("Uwaga!"),
                message: Text("Błąd")
            )
        }
        if wcisniety {
            if let r = Float(promien) {
                Text("Pole: \(Float.pi*pow(r,2))\nObwód: \(2*r*Float.pi)").padding()
            } else {
                Text("Błędna konwersja!")
            }
        }
    }
}

struct lab13_1_Previews: PreviewProvider {
    static var previews: some View {
        lab13_1()
    }
}
