//
//  DetailView.swift
//  TrucksController
//
//  Created by noseeevil on 04.05.2022.
//

import SwiftUI
import MapKit

struct DetailView: View {
    
    let truck: Truck

    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    @State private var showingDeleteAlert = false
    
    var body: some View {
        
        ScrollView {
        
        MapView(coordinate: CLLocationCoordinate2D(latitude: 50.27046, longitude: 30.33695))
        .ignoresSafeArea(edges: .top)
        .frame(height: 300)
        
        let img = UIImage(data: truck.img!)
            
        ImageView(picture: img!)
        .offset(y: -130)
        .padding(.bottom, -130)
            
        let model = "Модель: \(truck.model)"
        let mileage = "Пробіг: \(truck.mileage)"
        let eco = "Євро: \(truck.mileage)"
        let pallets = "Палети: \(truck.mileage)"
        let age = "Рік випуску: \(truck.mileage)"
        let fuel = "Росхід: \(truck.mileage)"
        
        Button("Save photo") {
             print("hello moto")
        }

        Text(model).padding()
        Text(mileage).padding()
        Text(eco).padding()
        Text(pallets).padding()
        Text(age).padding()
        Text(fuel).padding()

                .navigationTitle(truck.model ?? "Unknown truck")
                .navigationBarTitleDisplayMode(.inline)
                .alert("Видалити машину?", isPresented: $showingDeleteAlert) {
                Button("Видалити", role: .destructive, action: deleteTruck)
                Button("Відмінити", role: .cancel) { }
                } message: {
                    Text("Ви впевнені?")
                }
        }
                .toolbar {
                    Button {
                        showingDeleteAlert = true
                    } label: {
                        Label("Видалити машину", systemImage: "trash")
                    }
                }
    }
    
    func deleteTruck() {
        moc.delete(truck)
        dismiss()
    }
    
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}
