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
    @State private var img = UIImage(named: "daf_xf_105")
    
    @State private var image = UIImage()
    @State private var showSheet = false
    
    var body: some View {
        
        
        
        NavigationView {
            Form {
                
                Section {
                    Button("Add photo") {
                        showSheet = true
                    }
                }
                
                Section {
                    Image(uiImage: image)
                        .resizable()
                        .frame(width: 250, height: 250)
                        .clipShape(Circle())
                        .overlay {
                            Circle().stroke(.white, lineWidth: 4)
                        }
                        .shadow(radius: 7)
                }
                
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
                        
                        let jpegImageData = image.jpegData(compressionQuality: 1.0)
                        
                        let newTruck = Truck(context: moc)
                        newTruck.model = model
                        newTruck.mileage = mileage
                        newTruck.age = age
                        newTruck.eco = eco
                        newTruck.pallets = pallets
                        newTruck.fuel = fuel
                        newTruck.img = jpegImageData
                        
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
        .sheet(isPresented: $showSheet) {
            ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
        }
    }
    
    private func SaveImg() {
        
    }
    
}

struct AddTruckView_Previews: PreviewProvider {
    static var previews: some View {
        AddTruckView()
    }
}
