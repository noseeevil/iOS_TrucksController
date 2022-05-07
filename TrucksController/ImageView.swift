//
//  ImageView.swift
//  TrucksController
//
//  Created by noseeevil on 04.05.2022.
//

import SwiftUI

struct ImageView: View {
    
    var picture = UIImage()
    
    @State private var image = UIImage()
    @State private var showSheet = false
    
    var body: some View {
        
            HStack {
                Image(uiImage: self.picture)
                //.cornerRadius(50)
                //.background(Color.black.opacity(0.2))
                //.aspectRatio(contentMode: .fill)
                .resizable()
                .frame(width: 250, height: 250)
                .clipShape(Circle())
                .overlay {
                    Circle().stroke(.white, lineWidth: 4)
                }
                .shadow(radius: 7)
                .onTapGesture {
                    showSheet = true
                }

            }
        .padding(.horizontal, 20)
//        .sheet(isPresented: $showSheet) {
//                ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
//            }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(picture: UIImage(named: "daf_xf_105")!)
    }
}
