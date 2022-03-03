//
//  ContentView.swift
//  PhotoPicker
//
//  Created by 김상현 on 2022/03/01.
//

import SwiftUI
import PhotosUI

struct ContentView: View {
    
    @State private var isPresentPicker = false
    @State private var images = [UIImage]()
    
    var body: some View {
        
        VStack{
            Button("Select Image"){
                isPresentPicker = true
            }
            
            List{
                ForEach(images, id:\.self){ image in
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.size.width/1.5, height: UIScreen.main.bounds.size.height/3)
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 10))
                        
                }
            }
        }
        .sheet(isPresented: $isPresentPicker, onDismiss: nil, content: {
            //Picker 뿌려줄 것
            ImagePicker(isPresent: $isPresentPicker, images: $images)
        })
  
    }
}

//viewcontroller 가져올때 representable
struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var isPresent: Bool
    @Binding var images: [UIImage]
    
    func makeCoordinator() -> Coordinator {
        return ImagePicker.Coordinator(picker: self) //구조체 자체를 넣어줌
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        
        var config = PHPickerConfiguration()
        config.selectionLimit = 0  //피커 선택 개수 제한
        config.filter = .images  //미디어 종류
        
        let picker = PHPickerViewController(configuration: config)
        
        picker.delegate = context.coordinator
        
        return picker
    }
    
    class Coordinator: PHPickerViewControllerDelegate{
        
        var picker: ImagePicker
        
        init(picker: ImagePicker){
            self.picker = picker
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            
            self.picker.isPresent = false // picker 내리기
            self.picker.images.removeAll() // 배열을 모두 비우고 새로 가져오도록 함

            for img in results {
                if img.itemProvider.canLoadObject(ofClass: UIImage.self){
                    img.itemProvider.loadObject(ofClass: UIImage.self) { loadImage, error in
                        
                        guard let hasImage = loadImage else{
                            print("Empty Image")
                            return
                        }
                        self.picker.images.append(hasImage as! UIImage)
                    }
                }else{
                    print("failed to load")
                }//이미지를 로드할 수 있는지 확인해줌. 못 불러오는 이미지 있을 수 있으므로 이거 사용하는건 국룰임.
            }
        }
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
