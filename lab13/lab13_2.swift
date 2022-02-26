//
//  lab13_2.swift
//  lab13
//
//  Created by Piotr Piwonski on 20/01/2022.
//

import SwiftUI

struct lab13_2: View {
    @State private var wcisniety = false
    @State private var kwota = ""
    @State private var alert = false
    @State private var walutaWybor: waluty = .PLN
    
    enum waluty: String, Equatable, CaseIterable {
        case PLN = "PLN"
        case EUR = "EUR"
        case USD = "USD"
        case GBP = "GBP"
        
        var enumValue: LocalizedStringKey {LocalizedStringKey(rawValue)}

    }
    
    func getValueWaluta(waluta: waluty) -> Float {
        switch waluta {
        case .PLN:
            return 1
        case .EUR:
            return 0.22
        case .USD:
            return 0.25
        case .GBP:
            return 0.18
        }
    }
    
    var body: some View {
        HStack{
            Text("Podaj kwote do przeliczenia: ")
            TextField("Wpisz kwote...", text: $kwota)
        }
        HStack {
            Picker("Przelicz złotówki na: ", selection: $walutaWybor){
                ForEach(waluty.allCases, id: \.self){
                    Text($0.enumValue).tag($0)
                }
            }
            
        }
        .alert(isPresented: $alert){
            Alert(
                title: Text("Uwaga!"),
                message: Text("Błąd")
            )
        }
        Button(action: {
            if Float(kwota) != nil {
                wcisniety = true
            } else {
                alert = true
            }
        }) {
            Text("Przelicz")
        }
        if wcisniety {
            if let money = Float(kwota) {
                Text("Po przeliczeniu: \(money*getValueWaluta(waluta: walutaWybor))").padding()
            } else if kwota == "" {
                Text("Puste pole!").padding()
            } else {
                Text("Bledna konwersja!").padding()
            }
        }
    }
}

struct lab13_2_Previews: PreviewProvider {
    static var previews: some View {
        lab13_2()
    }
}
