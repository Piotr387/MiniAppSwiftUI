//
//  lab13_3.swift
//  lab13
//
//  Created by Piotr Piwonski on 27/01/2022.
//

import SwiftUI
import Foundation

struct lab13_3: View {
    struct wydarzenie: Hashable {
        var date: Date
        var nazwa: String
        
        init(dataStr: String, nazwa: String) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy/MM/dd"
            let convertedDate = dateFormatter.date(from: dataStr)!
            self.date = convertedDate
            self.nazwa = nazwa
            
        }
        
        func show() -> String {
            return "Nazwa: \(nazwa), Data: \(date)"
        }
    }
    
    @MainActor class dynamicContent: ObservableObject{
        var arr: [String] {
            willSet {
                objectWillChange.send()
            }
        }
        
        init(){
            self.arr = []
            if(arr.isEmpty){
                arr.append("Brak nadchodzących wydarzeń")
            }
        }
        
        func searchForNew(tab: [wydarzenie], currentDate: Date){
            var tempArr: [String]  = []
            for i in 0..<tab.count {
                if(currentDate <= tab[i].date){
                    tempArr.append(tab[i].show())
                }
                if(tempArr.capacity == 7){
                    break
                }
            }
            if(!tempArr.isEmpty){
                self.arr = tempArr
            } else {
                tempArr.append("Brak nadchodzących wydarzeń")
                self.arr = tempArr
            }
        }
    }
 
    @State private var arr = [
        wydarzenie(dataStr: "2022/01/31", nazwa: "Wydarzenie 1"),
        wydarzenie(dataStr: "2022/02/04", nazwa: "Wydarzenie 2"),
        wydarzenie(dataStr: "2022/02/10", nazwa: "Wydarzenie 3"),]
    
    @ObservedObject var updater = dynamicContent()
    
    @State private var datePick = Date()
    @State private var wcisniety = false
    
    var body: some View {
        
        Section(header: Text("Szukaj najbliższych wydarzeń: ")) {
            VStack{
                DatePicker(
                    "Wybierz datę początkową",
                    selection: $datePick,
                    in: Date()...,
                    displayedComponents: [.date])
            }
            Button(action: {
                wcisniety = true
                updater.searchForNew(tab: arr, currentDate: datePick)
            }) {
                Text("Szukaj wydarzeń")
            }
            if wcisniety {
                List {
                    Section(header: Text("Lista najblizszych wydarzen: ")) {
                        ForEach(updater.arr, id: \.self) {
                            let wydarzenie = $0
                            Text(wydarzenie)
                        }
                    }
                } .frame(height: 200)
            }
        }
    }
}

struct lab13_3_Previews: PreviewProvider {
    static var previews: some View {
        lab13_3()
    }
}
