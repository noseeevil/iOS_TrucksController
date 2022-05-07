//
//  ContentView.swift
//  TrucksController
//
//  Created by noseeevil on 04.05.2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var trucks: FetchedResults<Truck>
    
    @State private var showingAddScreen = false

    
    var body: some View {
        NavigationView {
            List {
                ForEach(trucks) { truck in
                    NavigationLink {
                        DetailView(truck: truck)
                    } label: {
                        HStack {
                        Text(truck.eco ?? "Unknown model")
                        .font(.largeTitle)

                            VStack(alignment: .leading)
                            {
                                Text(truck.model ?? "Unknown model")
                                    .font(.headline)
                                Text(truck.mileage ?? "Unknown mileage")
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        showingAddScreen.toggle()
                    } label: {
                        Label("Add truck", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddScreen) {
                AddTruckView();
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
