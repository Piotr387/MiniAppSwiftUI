//
//  ContentView.swift
//  lab13
//
//  Created by Piotr Piwonski on 20/01/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var wybranyElem:String = ""
    @State private var czyWybrano = true
    
    let listaZadan = ["Lab13.1", "Lab13.2", "Lab13.3", "Lab13.4",
                      "Lab14.1", "Lab14.2", "Lab14.3"]
    
    var body: some View {
        HStack{
                List {
                    Section(header: Text("Lista zadań: ")) {
                        ForEach(listaZadan, id: \.self) {
                            (zadanie: String) in Text(zadanie)
                                .onTapGesture {
                                    czyWybrano = true
                                    wybranyElem = zadanie
                                }
                        }
                    }
                } .frame(width: 100)
            VStack {
                List{
                    Section(header: HStack{
                        Text(wybranyElem)
                        Spacer()
                        Text("Autor: Piotr Piwonski").multilineTextAlignment(.center)
                    }){
                        if wybranyElem == "Lab13.1" {
                            lab13_1()
                        } else if wybranyElem == "Lab13.2" {
                            lab13_2()
                        } else if wybranyElem == "Lab13.3" {
                            lab13_3()
                        } else if wybranyElem == "Lab13.4" {
                            lab13_4()
                        } else if  wybranyElem == "Lab14.1"{
                            lab14_1()
                        } else if  wybranyElem == "Lab14.2"{
                            lab14_2()
                        } else if  wybranyElem == "Lab14.3"{
                            lab14_3()
                        } else {
                            Text("Wybierz zadanie do wyswietlenia z listy.")
                        }
                    }
                }
            } .frame(width: 700, alignment: .trailing)
            
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
