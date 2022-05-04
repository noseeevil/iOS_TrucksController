//
//  AddTruckView.swift
//  TrucksController
//
//  Created by noseeevil on 04.05.2022.
//

import SwiftUI

struct AddTruckView: View {
    
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss

    @State private var model = "DAF XF 105.460"
    @State private var mileage = "968000"
    @State private var age = "2012"
    @State private var eco = "5"
    @State private var pallets = "22"
    @State private var fuel = "24.5"
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Модель: ", text: $model)
                    TextField("Пробіг:", text: $mileage);
                    TextField("Рік випуску: ", text: $age)
                    TextField("Євро: ", text: $eco)
                    TextField("Кількість палет: ", text: $pallets)
                    TextField("Росхід: ", text: $fuel)
                }
                
                header: {
                    Text("Технічні характеристики")
                }
                
                Section {
                    Button("Зберегти") {
                        
                        let newTruck = Truck(context: moc)
                        newTruck.model = model
                        newTruck.mileage = mileage
                        newTruck.age = age
                        newTruck.eco = eco
                        newTruck.pallets = pallets
                        newTruck.fuel = fuel
                        
                        try? moc.save()
                        dismiss()
                    }
                    Button(action: {
                        dismiss()
                    }, label: {
                        Text("Відмінити")
                            .foregroundColor(.red)
                    })
                    
                }
            }.navigationTitle("Нова машина")
        }
    }
}

struct AddTruckView_Previews: PreviewProvider {
    static var previews: some View {
        AddTruckView()
    }
}
