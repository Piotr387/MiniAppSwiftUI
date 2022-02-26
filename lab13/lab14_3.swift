//
//  lab14_3.swift
//  lab13
//
//  Created by ForEduPurposeOnly on 29/01/2022.
//

import SwiftUI
import Foundation

struct lab14_3: View {
    
    @MainActor class dynamicContent: ObservableObject{
        var spisMiast: [String] {
            willSet {
                objectWillChange.send()
            }
        }
        var alertCustom = false
        var alertText = ""
        
        init(){
            self.spisMiast = ["Warszawa","Krakow","Wroclaw","Gdansk","Bydgoszcz","Olsztyn"]
        }
        
        func dodajMiasto(miastoNew: String){
            if(spisMiast.contains(miastoNew)){
                alertText = "Powtorzenie miast"
                alertCustom = true
            } else {
                spisMiast.append(miastoNew)
                alertText = "Pomyslnie dano miasto"
                alertCustom = true
            }
        }
        
        func usunMiasto(miastoNew: String){
            if(spisMiast.contains(miastoNew)){
                for i in 0..<spisMiast.count{
                    if(spisMiast[i] == miastoNew){
                        spisMiast.remove(at: i)
                        alertText = "Pomyslnie usunieto miasto!"
                        alertCustom.toggle()
                    }
                }
            } else {
                alertCustom.toggle()
                alertText =  "Nie ma takiego miasta!"
            }
        }
        
        func setTextEmpty(){
            alertText = "Pole nie moze byc puste!"
        }
    }
    
    @ObservedObject var updater = dynamicContent()
    @State private var miastoInput = ""
    @State var alertStatus = false
    
    var body: some View {
        VStack{
            Section(header: Text("Aplikacja do wprowadzania ocen: ")){
                HStack{
                    Text("Miasto: ")
                    TextField("Wpisz nazwe miasta...", text: $miastoInput)
                }
                HStack{
                    Button(action: {
                        if miastoInput != "" {
                            updater.dodajMiasto(miastoNew: miastoInput)
                            miastoInput = ""
                            alertStatus = true
                        } else {
                            alertStatus = true
                            updater.setTextEmpty()
                        }
                    }) {
                        Text("Dodaj miasto")
                    }
                    Button(action: {
                        if miastoInput != "" {
                            updater.usunMiasto(miastoNew: miastoInput)
                            miastoInput = ""
                            alertStatus = true
                        } else {
                            updater.setTextEmpty()
                            alertStatus = true
                        }
                    }) {
                        Text("Usun miasto")
                    }
                }
                .alert(isPresented: $alertStatus){
                    Alert(
                        title: Text("Uwaga!"),
                        message: Text(updater.alertText)
                    )
                }
                List {
                    Section(header: Text("Lista miast: ")) {
                        ForEach(updater.spisMiast, id: \.self) {
                            Text($0)
                        }
                    }
                } .frame(height: 200)
            }
        }
    }
}

struct lab14_3_Previews: PreviewProvider {
    static var previews: some View {
        lab14_3()
    }
}
