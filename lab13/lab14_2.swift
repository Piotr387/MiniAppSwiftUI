//
//  lab14_2.swift
//  lab13
//
//  Created by ForEduPurposeOnly on 29/01/2022.
//

import SwiftUI

struct lab14_2: View {
    
    enum oceny: Float, Equatable, CaseIterable {
        case A = 5
        case Bplus = 4.5
        case B = 4
        case Cplus = 3.5
        case C = 3
        case F = 2
        
        var enumValue: LocalizedStringKey {LocalizedStringKey(String(rawValue))}

    }
    
    struct wpis: Hashable {
        var ocena: oceny
        var opis: String
        
        init(ocena: oceny,opis: String){
            self.ocena = ocena
            self.opis = opis
        }
        
        func returnInfo() -> String {
            let text = "Ocena: \(ocena.rawValue) - \(opis)"
            return text
        }
    }
    
    @MainActor class dynamicContent: ObservableObject{
        var spisOcen: [wpis] {
            willSet {
                objectWillChange.send()
            }
        }
        
        init(){
            self.spisOcen = []
        }
        
        func dodajWpis(ocenaNew: oceny, opisNew: String){
            let wpis = wpis(ocena: ocenaNew, opis: opisNew)
            spisOcen.append(wpis)
        }
    }
    
    @State private var ocenaWybor: oceny = .A
    @State private var opis = ""
    
    @State private var alert = false
    @State private var wcisniety = false
    
    @ObservedObject var updater = dynamicContent()
    
    var body: some View {
            Section(header: Text("Aplikacja do wprowadzania ocen: ")) {
                HStack {
                    Picker("Wybierz ocene: ", selection: $ocenaWybor){
                        ForEach(oceny.allCases, id: \.self){
                            Text($0.enumValue).tag($0)
                        }
                    }
                }
                HStack{
                    Text("Opis: ")
                    TextField("Wprowadz opis...", text: $opis)
                }
                Button(action: {
                    if opis != "" {
                        wcisniety = true
                        updater.dodajWpis(ocenaNew: ocenaWybor, opisNew: opis)
                    } else {
                        alert = true
                    }
                }) {
                    Text("Dodaj wpis z ocena")
                }
                .alert(isPresented: $alert){
                    Alert(
                        title: Text("Uwaga!"),
                        message: Text("Pole nie moze byc puste!")
                    )
                }
                if wcisniety {
                    List {
                        Section(header: Text("Lista wprowadzonych ocen: ")) {
                            ForEach(updater.spisOcen, id: \.self) {
                                let description = $0.returnInfo()
                                Text(description)
                            }
                        }
                    } .frame(height: 200)
                }
            }
    }
}

struct lab14_2_Previews: PreviewProvider {
    static var previews: some View {
        lab14_2()
    }
}
