import SwiftUI

struct MarsRoverPhotosView: View {
    @ObservedObject var viewModel: MarsRoverPhotosViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    ForEach(viewModel.marsPhotosModel) { index in
                            if #available(iOS 15.0, *) {
                                AsyncImage(
                                    url: URL(string: "\(index.imgSrc)"),
                                    content: { image in
                                        image.resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .layoutPriority(-1)
                                            .cornerRadius(25)
                                            .padding(.horizontal)
                                    },
                                    placeholder: {
                                        
                                    }
                                )
                            } else {
                                // Fallback on earlier versions
                            }
                    }
                }
            }
            .navigationTitle("MarsRoverPhotos")
            .navigationBarTitleDisplayMode(.automatic)
        }
        .onAppear {
            viewModel.loadData()
        }
    }
}

//struct MarsRoverPhotosView_Previews: PreviewProvider {
//    static var previews: some View {
//        MarsRoverPhotosView()
//    }
//}
