//
//  ContentView.swift
//  PhotoPicker
//
//  Created by 김상현 on 2022/03/01.
//

import SwiftUI
import PhotosUI

struct ContentView: View {
    @State private var isPresenPicker = false
    @State private var images = [UIImage]()
    var body: some View {
        VStack{
            Button("Select Image"){
                isPresenPicker = true
            }
            
            List{
                ForEach(images, id:\.self){ image in
                    Image(uiImage: image)
                }
            }
        }
        .sheet(isPresented: $isPresenPicker, onDismiss: nil, content: {
            //Picker
        })
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var isPresent: Bool
    
    func makeCoordinator() -> Coordinator {
        <#code#>
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        
        var config = PHPickerConfiguration()
        config.selectionLimit = 0
        config.filter = .images
        
        let picker = PHPickerViewController(configuration: config)
        
//        picker.delegate = context.coordinator
        
        return picker
    }
    class Coordinator: PHPickerViewControllerDelegate{
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            <#code#>
        }
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        <#code#>
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
