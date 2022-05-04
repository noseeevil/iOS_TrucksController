//
//  DetailView.swift
//  TrucksController
//
//  Created by noseeevil on 04.05.2022.
//

import SwiftUI

struct DetailView: View {
    
    let truck: Truck

    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    @State private var showingDeleteAlert = false
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomTrailing) {
                Image(truck.model ?? "Unknown")
                .resizable()
                .scaledToFit()

                Text(truck.model?.uppercased() ?? "Unknown model")
                .font(.caption)
                .fontWeight(.black)
                .padding(8)
                .foregroundColor(.white)
                .background(.black.opacity(0.75))
                .clipShape(Capsule())
                .offset(x: -5, y: -5)
                }

                Text(truck.mileage ?? "Unknown mileage")
                .font(.title)
                .foregroundColor(.secondary)

                Text(truck.eco ?? "No euro standart")
                .padding()

                //RatingView(rating: .constant(Int(book.rating)))
                //.font(.largeTitle)
                }
                .navigationTitle(truck.model ?? "Unknown truck")
                .navigationBarTitleDisplayMode(.inline)
                .alert("Delete truck?", isPresented: $showingDeleteAlert) {
                Button("Delete", role: .destructive, action: deleteTruck)
                Button("Cancel", role: .cancel) { }
                } message: {
                    Text("Are you sure?")
                }
                .toolbar {
                    Button {
                        showingDeleteAlert = true
                    } label: {
                        Label("Delete this truck", systemImage: "trash")
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
