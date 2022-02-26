//
//  lab14_1.swift
//  lab13
//
//  Created by Piotr Piwonski on 20/01/2022.
//

import SwiftUI

struct lab14_1: View {
    
    let listaksiazek = ["JavaScript od podstaw - Moskała Marcin",
                        "JavaScript w praktyce - Beighley Lynn",
                        "Java. Zadania z programowania z przykładowymi rozwiązaniami ",
                        "JavaScript. Tworzenie nowoczesnych aplikacji webowych",
                        "JavaScript Wyrażenia regularne dla programistów",
                        "Projekt Riese - Mróz Remigiusz",
                        "Ella w teatrze. Ella. Tom 2 - Timo Parvela",
                        "No i pogadali. 'Szkło Kontaktowe' gdy gasną kamery - Tomasz Jachimek",
                        "Siła kobiet - Wysoczańska Barbara",
                        "Mów mi Win - Harlan Coben"]
    let listaebookow = ["O Syberii i Kamczatce ",
                        "Perspektywy w psychologii ",
                        "Oblicza Wojny. Tom 5",
                        "Koszty współczesnych kryzysów ",
                        "Łódzkie festiwale teatralne ",
                        "Myśl społeczno-polityczna Musy Bigijewa",
                        "Oblicza Wojny. Tom 4",
                        "Koronawirus. Książka dla dzieci",
                        "Samotność"]
    
    var body: some View {
        VStack{
            List {
                Section(header: Text("Lista książek: ")) {
                    ForEach(listaksiazek, id: \.self) {
                        (ksiazka: String) in Text(ksiazka)
                    }
                }
            } .frame(height: 200)
            List {
                Section(header: Text("Lista ebookow: ")) {
                    ForEach(listaebookow, id: \.self) {
                        (ksiazka: String) in Text(ksiazka)
                    }
                }
            } .frame(height: 200)
        }
    }
}

struct lab14_1_Previews: PreviewProvider {
    static var previews: some View {
        lab14_1()
    }
}
