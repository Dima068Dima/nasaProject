import SwiftUI

struct PhotographsEarthView: View {
    @ObservedObject var viewModel: PhotographsEarthViewModel
    
    init(viewModel: PhotographsEarthViewModel) {
        self._viewModel = ObservedObject(wrappedValue: viewModel)
        viewModel.loadData()
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    ForEach(viewModel.photographsEarthModel) { index in
                            if #available(iOS 15.0, *) {
                                let imageUrl = "https://epic.gsfc.nasa.gov/archive/natural/2019/05/30/jpg/"
                                AsyncImage(
                                    url: URL(string: "\(imageUrl)\(index.image).jpg"),
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
            .navigationTitle("Photo")
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
}

//struct PhotographsEarthView_Previews: PreviewProvider {
//    static var previews: some View {
//        PhotographsEarthView(viewModel: <#PhotographsEarthViewModel#>)
//    }
//}
